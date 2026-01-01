<script setup lang="ts">
import { Button } from '@/components/ui/button';
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from '@/components/ui/card';
import { Checkbox } from '@/components/ui/checkbox';
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from '@/components/ui/dialog';
import { Input } from '@/components/ui/input';
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, router } from '@inertiajs/vue3';
import axios from 'axios';
import { GraduationCap, Loader2, Search, Sparkles } from 'lucide-vue-next';
import { computed, ref, watch } from 'vue';

interface ProgramStudi {
    id: number;
    name: string;
    nim_code: string;
}

interface Registration {
    id: number;
    registration_number: string;
    status: string;
    created_at: string;
    user: {
        id: number;
        name: string;
        email: string;
        nim: string | null;
    };
    accepted_program_studi: ProgramStudi | null;
    registration_type: {
        id: number;
        name: string;
    } | null;
    registration_period: {
        id: number;
        academic_year: string;
    } | null;
}

interface PaginatedRegistrations {
    data: Registration[];
    current_page: number;
    last_page: number;
    per_page: number;
    total: number;
    links: Array<{ url: string | null; label: string; active: boolean }>;
}

interface NimResult {
    id: number;
    name: string;
    nim?: string;
    reason?: string;
}

interface Props {
    registrations: PaginatedRegistrations;
    programStudi: ProgramStudi[];
    filters: {
        prodi: string;
        type: string;
        search: string;
    };
}

const props = defineProps<Props>();

const breadcrumbs = [
    { title: 'Dashboard', href: '/admin/dashboard' },
    { title: 'Generate NIM', href: '/admin/nim-generation' },
];

const searchQuery = ref(props.filters.search);
const prodiFilter = ref(props.filters.prodi || 'all');
const selectedIds = ref<number[]>([]);
const isGenerating = ref(false);
const showResultDialog = ref(false);
const checkedAll = ref(false);
const generateResults = ref<{ success: NimResult[]; failed: NimResult[] }>({
    success: [],
    failed: [],
});

// Watch for filter changes
let debounceTimer: ReturnType<typeof setTimeout>;
watch([searchQuery, prodiFilter], () => {
    clearTimeout(debounceTimer);
    debounceTimer = setTimeout(() => {
        router.get(
            '/admin/nim-generation',
            {
                search: searchQuery.value || undefined,
                prodi: prodiFilter.value === 'all' ? undefined : prodiFilter.value,
            },
            {
                preserveState: true,
                replace: true,
            },
        );
    }, 300);
});

const allSelected = computed(() => {
    if (props.registrations.data.length === 0) return false;
    return props.registrations.data.every((r) => selectedIds.value.includes(r.id));
});

const toggleAll = () => {
    if (allSelected.value) {
        selectedIds.value = [];
    } else {
        selectedIds.value = props.registrations.data.map((r) => r.id);
    }
};

const toggleSelection = (id: number) => {
    const index = selectedIds.value.indexOf(id);
    if (index === -1) {
        selectedIds.value.push(id);
    } else {
        selectedIds.value.splice(index, 1);
    }
};

const generateNim = async () => {
    if (selectedIds.value.length === 0) {
        alert('Pilih minimal satu calon mahasiswa');
        return;
    }

    isGenerating.value = true;

    try {
        const response = await axios.post('/admin/nim-generation/generate', {
            registration_ids: selectedIds.value,
        });

        generateResults.value = response.data.results;
        showResultDialog.value = true;
        selectedIds.value = [];

        // Refresh data
        router.reload({ only: ['registrations'] });
    } catch (error: unknown) {
        const axiosError = error as { response?: { data?: { message?: string } } };
        alert(axiosError.response?.data?.message || 'Terjadi kesalahan');
    } finally {
        isGenerating.value = false;
    }
};

const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('id-ID', {
        day: '2-digit',
        month: 'short',
        year: 'numeric',
    });
};
</script>

<template>
    <Head title="Generate NIM" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Card>
                <CardHeader>
                    <div class="flex items-center justify-between">
                        <div>
                            <CardTitle class="flex items-center gap-2">
                                <GraduationCap class="size-5" />
                                Generate NIM Mahasiswa
                            </CardTitle>
                            <CardDescription>
                                Generate NIM untuk calon mahasiswa yang sudah
                                menyelesaikan daftar ulang
                            </CardDescription>
                        </div>
                        <Button
                            :disabled="
                                selectedIds.length === 0 || isGenerating
                            "
                            @click="generateNim"
                        >
                            <Loader2
                                v-if="isGenerating"
                                class="mr-2 size-4 animate-spin"
                            />
                            <Sparkles v-else class="mr-2 size-4" />
                            Generate NIM ({{ selectedIds.length }})
                        </Button>
                    </div>
                </CardHeader>
                <CardContent>
                    <!-- Filters -->
                    <div
                        class="mb-6 flex flex-col gap-4 sm:flex-row sm:items-center"
                    >
                        <div class="relative flex-1">
                            <Search
                                class="absolute top-1/2 left-3 size-4 -translate-y-1/2 text-muted-foreground"
                            />
                            <Input
                                v-model="searchQuery"
                                placeholder="Cari nama atau email..."
                                class="pl-10"
                            />
                        </div>
                        <Select v-model="prodiFilter">
                            <SelectTrigger class="w-full sm:w-64">
                                <SelectValue placeholder="Filter Prodi" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="all">Semua Prodi</SelectItem>
                                <SelectItem
                                    v-for="prodi in programStudi"
                                    :key="prodi.id"
                                    :value="String(prodi.id)"
                                >
                                    {{ prodi.name }} ({{ prodi.nim_code }})
                                </SelectItem>
                            </SelectContent>
                        </Select>
                    </div>

                    <!-- Table -->
                    <div class="overflow-x-auto rounded-lg border">
                        <table class="w-full text-sm">
                            <thead class="bg-muted/50">
                                <tr>
                                    <th class="w-12 px-4 py-3">
                                        <Checkbox
                                            :model-value="allSelected"
                                            @update:model-value="toggleAll"
                                        />
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        No. Registrasi
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Nama
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Program Studi
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Jenis Pendaftaran
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Tahun Akademik
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Tanggal Daftar
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="divide-y">
                                <tr
                                    v-for="reg in registrations.data"
                                    :key="reg.id"
                                    class="hover:bg-muted/50"
                                    :class="{
                                        'bg-primary/5': selectedIds.includes(
                                            reg.id,
                                        ),
                                    }"
                                >
                                    <td class="px-4 py-3">
                                        <Checkbox
                                            :model-value="selectedIds.includes(reg.id)"
                                            @update:model-value="
                                                toggleSelection(reg.id)
                                            "
                                        />
                                    </td>
                                    <td
                                        class="px-4 py-3 font-mono text-xs text-muted-foreground"
                                    >
                                        {{ reg.registration_number }}
                                    </td>
                                    <td class="px-4 py-3">
                                        <div>
                                            <div class="font-medium">
                                                {{ reg.user.name }}
                                            </div>
                                            <div
                                                class="text-xs text-muted-foreground"
                                            >
                                                {{ reg.user.email }}
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div
                                            v-if="reg.accepted_program_studi"
                                            class="flex items-center gap-2"
                                        >
                                            <span>{{
                                                reg.accepted_program_studi.name
                                            }}</span>
                                            <span
                                                class="rounded bg-muted px-1.5 py-0.5 text-xs font-mono"
                                            >
                                                {{
                                                    reg.accepted_program_studi
                                                        .nim_code
                                                }}
                                            </span>
                                        </div>
                                        <span
                                            v-else
                                            class="text-muted-foreground"
                                            >-</span
                                        >
                                    </td>
                                    <td class="px-4 py-3">
                                        {{
                                            reg.registration_type?.name || '-'
                                        }}
                                    </td>
                                    <td class="px-4 py-3">
                                        {{
                                            reg.registration_period
                                                ?.academic_year || '-'
                                        }}
                                    </td>
                                    <td
                                        class="px-4 py-3 text-muted-foreground"
                                    >
                                        {{ formatDate(reg.created_at) }}
                                    </td>
                                </tr>
                                <tr v-if="registrations.data.length === 0">
                                    <td
                                        colspan="7"
                                        class="px-4 py-8 text-center text-muted-foreground"
                                    >
                                        Tidak ada calon mahasiswa yang siap
                                        untuk generate NIM
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <div
                        v-if="registrations.last_page > 1"
                        class="mt-4 flex items-center justify-between"
                    >
                        <p class="text-sm text-muted-foreground">
                            Menampilkan {{ registrations.data.length }} dari
                            {{ registrations.total }} data
                        </p>
                        <div class="flex gap-2">
                            <Button
                                v-for="link in registrations.links"
                                :key="link.label"
                                size="sm"
                                :variant="link.active ? 'default' : 'outline'"
                                :disabled="!link.url"
                                @click="link.url && router.get(link.url)"
                                v-html="link.label"
                            />
                        </div>
                    </div>
                </CardContent>
            </Card>
        </div>

        <!-- Result Dialog -->
        <Dialog v-model:open="showResultDialog">
            <DialogContent class="max-w-lg">
                <DialogHeader>
                    <DialogTitle>Hasil Generate NIM</DialogTitle>
                    <DialogDescription>
                        {{ generateResults.success.length }} berhasil,
                        {{ generateResults.failed.length }} gagal
                    </DialogDescription>
                </DialogHeader>

                <div class="max-h-80 space-y-4 overflow-y-auto">
                    <!-- Success -->
                    <div v-if="generateResults.success.length > 0">
                        <h4 class="mb-2 font-medium text-green-600">
                            ✓ Berhasil ({{ generateResults.success.length }})
                        </h4>
                        <div class="space-y-1">
                            <div
                                v-for="item in generateResults.success"
                                :key="item.id"
                                class="flex items-center justify-between rounded bg-green-50 p-2 text-sm dark:bg-green-900/20"
                            >
                                <span>{{ item.name }}</span>
                                <span class="font-mono font-medium">{{
                                    item.nim
                                }}</span>
                            </div>
                        </div>
                    </div>

                    <!-- Failed -->
                    <div v-if="generateResults.failed.length > 0">
                        <h4 class="mb-2 font-medium text-red-600">
                            ✗ Gagal ({{ generateResults.failed.length }})
                        </h4>
                        <div class="space-y-1">
                            <div
                                v-for="item in generateResults.failed"
                                :key="item.id"
                                class="rounded bg-red-50 p-2 text-sm dark:bg-red-900/20"
                            >
                                <div class="font-medium">{{ item.name }}</div>
                                <div class="text-xs text-red-600">
                                    {{ item.reason }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <DialogFooter>
                    <Button @click="showResultDialog = false">Tutup</Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    </AppLayout>
</template>
