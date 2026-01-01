<script setup lang="ts">
import { Button } from '@/components/ui/button';
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from '@/components/ui/card';
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
import { GraduationCap, Search } from 'lucide-vue-next';
import { ref, watch } from 'vue';

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

interface Props {
    registrations: PaginatedRegistrations;
    programStudi: ProgramStudi[];
    filters: {
        prodi: string;
        search: string;
    };
}

const props = defineProps<Props>();

const breadcrumbs = [
    { title: 'Dashboard', href: '/admin/dashboard' },
    { title: 'Mahasiswa Aktif', href: '/admin/enrolled-students' },
];

const searchQuery = ref(props.filters.search);
const prodiFilter = ref(props.filters.prodi || 'all');

// Watch for filter changes
let debounceTimer: ReturnType<typeof setTimeout>;
watch([searchQuery, prodiFilter], () => {
    clearTimeout(debounceTimer);
    debounceTimer = setTimeout(() => {
        router.get(
            '/admin/enrolled-students',
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

const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('id-ID', {
        day: '2-digit',
        month: 'short',
        year: 'numeric',
    });
};
</script>

<template>
    <Head title="Data Mahasiswa Aktif" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Card>
                <CardHeader>
                    <div class="flex items-center justify-between">
                        <div>
                            <CardTitle class="flex items-center gap-2">
                                <GraduationCap class="size-5" />
                                Data Mahasiswa Aktif
                            </CardTitle>
                            <CardDescription>
                                Daftar mahasiswa yang telah terdaftar dan memiliki NIM
                            </CardDescription>
                        </div>
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
                                placeholder="Cari nama, email, atau NIM..."
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
                                    {{ prodi.name }}
                                </SelectItem>
                            </SelectContent>
                        </Select>
                    </div>

                    <!-- Table -->
                    <div class="overflow-x-auto rounded-lg border">
                        <table class="w-full text-sm">
                            <thead class="bg-muted/50">
                                <tr>
                                    <th class="px-4 py-3 text-left font-medium">NIM</th>
                                    <th class="px-4 py-3 text-left font-medium">Nama Mahasiswa</th>
                                    <th class="px-4 py-3 text-left font-medium">Program Studi</th>
                                    <th class="px-4 py-3 text-left font-medium">Angkatan</th>
                                    <th class="px-4 py-3 text-left font-medium">Status</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y">
                                <tr
                                    v-for="reg in registrations.data"
                                    :key="reg.id"
                                    class="hover:bg-muted/50"
                                >
                                    <td class="px-4 py-3 font-mono font-medium">
                                        {{ reg.user.nim || '-' }}
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
                                        </div>
                                        <span
                                            v-else
                                            class="text-muted-foreground"
                                            >-</span
                                        >
                                    </td>
                                    <td class="px-4 py-3">
                                        {{
                                            reg.registration_period
                                                ?.academic_year || '-'
                                        }}
                                    </td>
                                    <td class="px-4 py-3">
                                         <span
                                            class="inline-flex items-center rounded-full bg-green-100 px-2.5 py-0.5 text-xs font-medium text-green-800 dark:bg-green-900/30 dark:text-green-400"
                                        >
                                            Aktif
                                        </span>
                                    </td>
                                </tr>
                                <tr v-if="registrations.data.length === 0">
                                    <td
                                        colspan="5"
                                        class="px-4 py-8 text-center text-muted-foreground"
                                    >
                                        Tidak ada data mahasiswa aktif yang ditemukan
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
    </AppLayout>
</template>
