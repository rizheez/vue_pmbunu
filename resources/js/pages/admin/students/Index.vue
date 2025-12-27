<script setup lang="ts">
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from '@/components/ui/card';
import { Input } from '@/components/ui/input';
import AppLayout from '@/layouts/AppLayout.vue';
import type { Registration, RegistrationPeriod, StudentBiodata } from '@/types/pmb';
import { Head, Link, router } from '@inertiajs/vue3';
import { Eye, Search } from 'lucide-vue-next';
import { ref, watch } from 'vue';
import { formatDate } from '@/composables/useFormat';

interface Student {
    id: number;
    name: string;
    email: string;
    phone: string | null;
    student_biodata: StudentBiodata | null;
    registration: Registration | null;
}

interface PaginatedStudents {
    data: Student[];
    current_page: number;
    last_page: number;
    per_page: number;
    total: number;
    links: { url: string | null; label: string; active: boolean }[];
}

interface Props {
    students: PaginatedStudents;
    periods: RegistrationPeriod[];
    filters: {
        status?: string;
        period?: string;
        search?: string;
    };
}

const props = defineProps<Props>();

const search = ref(props.filters.search || '');
const status = ref(props.filters.status || 'all');
const period = ref(props.filters.period || 'all');

const applyFilters = () => {
    router.get(
        '/admin/students',
        {
            search: search.value || undefined,
            status: status.value !== 'all' ? status.value : undefined,
            period: period.value !== 'all' ? period.value : undefined,
        },
        { preserveState: true }
    );
};

watch([status, period], () => applyFilters());

const getStatusBadge = (regStatus: string | undefined) => {
    const map: Record<string, { variant: 'default' | 'secondary' | 'destructive' | 'outline'; label: string }> = {
        draft: { variant: 'secondary', label: 'Draft' },
        submitted: { variant: 'outline', label: 'Terdaftar' },
        verified: { variant: 'default', label: 'Terverifikasi' },
        accepted: { variant: 'default', label: 'Diterima' },
        rejected: { variant: 'destructive', label: 'Ditolak' },
    };
    return map[regStatus || ''] || { variant: 'secondary', label: 'Unknown' };
};

const breadcrumbs = [
    { title: 'Admin Dashboard', href: '/admin/dashboard' },
    { title: 'Students', href: '/admin/students' },
];
</script>

<template>
    <Head title="Manajemen Mahasiswa" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Card>
                <CardHeader>
                    <div class="flex items-center justify-between">
                        <div>
                            <CardTitle>Manajemen Mahasiswa</CardTitle>
                            <CardDescription>
                                Total: {{ props.students.total }} mahasiswa
                            </CardDescription>
                        </div>
                    </div>
                </CardHeader>
                <CardContent>
                    <!-- Filters -->
                    <div class="mb-6 flex flex-wrap gap-4">
                        <div class="flex items-center gap-2">
                            <Input
                                v-model="search"
                                placeholder="Cari nama, email, no. pendaftaran..."
                                class="w-64"
                                @keyup.enter="applyFilters"
                            />
                            <Button size="icon" variant="outline" @click="applyFilters">
                                <Search class="size-4" />
                            </Button>
                        </div>

                        <select
                            v-model="status"
                            class="rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                        >
                            <option value="all">Semua Status</option>
                            <option value="draft">Draft</option>
                            <option value="submitted">Terdaftar</option>
                            <option value="verified">Terverifikasi</option>
                            <option value="accepted">Diterima</option>
                            <option value="rejected">Ditolak</option>
                        </select>

                        <select
                            v-model="period"
                            class="rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                        >
                            <option value="all">Semua Periode</option>
                            <option
                                v-for="p in props.periods"
                                :key="p.id"
                                :value="p.id"
                            >
                                {{ p.name }}
                            </option>
                        </select>
                    </div>

                    <!-- Table -->
                    <div class="overflow-x-auto rounded-lg border">
                        <table class="w-full text-sm">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="min-w-[140px] px-4 py-3 text-left font-medium">
                                        No. Pendaftaran
                                    </th>
                                    <th class="min-w-[200px] px-4 py-3 text-left font-medium">
                                        Nama
                                    </th>
                                    <th class="min-w-[200px] px-4 py-3 text-left font-medium">
                                        Email
                                    </th>
                                    <th class="min-w-[200px] px-4 py-3 text-left font-medium">
                                        Sumber Informasi
                                    </th>
                                    <th class="min-w-[180px] px-4 py-3 text-left font-medium">
                                        Prodi Pilihan 1
                                    </th>
                                    <th class="whitespace-nowrap px-4 py-3 text-left font-medium">
                                        Tanggal Daftar
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Status
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Aksi
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="divide-y">
                                <tr
                                    v-for="student in props.students.data"
                                    :key="student.id"
                                    class="hover:bg-gray-50"
                                >
                                    <td class="px-4 py-3 font-mono text-xs">
                                        {{
                                            student.registration
                                                ?.registration_number || '-'
                                        }}
                                    </td>
                                    <td class="px-4 py-3 font-medium">
                                        {{
                                            student.student_biodata?.name ||
                                            student.name
                                        }}
                                    </td>
                                    <td class="px-4 py-3 text-gray-500">
                                        {{ student.email }}
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="flex flex-col">
                                            <span class="font-medium">
                                                {{ student.registration?.referral_source || '-' }}
                                            </span>
                                            <span
                                                v-if="student.registration?.referral_detail"
                                                class="text-xs text-gray-500"
                                            >
                                                {{ student.registration.referral_detail }}
                                            </span>
                                        </div>
                                    </td>
                                    <td class="px-4 py-3">
                                        {{
                                            student.registration
                                                ?.program_studi_choice1
                                                ?.name || '-'
                                        }}
                                    </td>
                                    <td class="px-4 py-3 text-gray-500">
                                        {{
                                            student.registration?.created_at
                                                ? formatDate(student.registration.created_at)
                                                : '-'
                                        }}
                                    </td>
                                    <td class="px-4 py-3">
                                        <Badge
                                            :variant="
                                                getStatusBadge(
                                                    student.registration?.status
                                                ).variant
                                            "
                                        >
                                            {{
                                                getStatusBadge(
                                                    student.registration?.status
                                                ).label
                                            }}
                                        </Badge>
                                    </td>
                                    <td class="px-4 py-3">
                                        <Button
                                            as-child
                                            variant="ghost"
                                            size="sm"
                                        >
                                            <Link
                                                :href="`/admin/students/${student.id}`"
                                            >
                                                <Eye class="mr-1 size-4" />
                                                Detail
                                            </Link>
                                        </Button>
                                    </td>
                                </tr>
                                <tr v-if="props.students.data.length === 0">
                                    <td
                                        colspan="8"
                                        class="px-4 py-8 text-center text-gray-500"
                                    >
                                        Tidak ada data mahasiswa
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <div
                        v-if="props.students.last_page > 1"
                        class="mt-4 flex items-center justify-between"
                    >
                        <p class="text-sm text-gray-500">
                            Halaman {{ props.students.current_page }} dari
                            {{ props.students.last_page }}
                        </p>
                        <div class="flex gap-1">
                            <template
                                v-for="link in props.students.links"
                                :key="link.label"
                            >
                                <Button
                                    v-if="link.url"
                                    as-child
                                    variant="outline"
                                    size="sm"
                                    :class="{
                                        'bg-primary text-primary-foreground':
                                            link.active,
                                    }"
                                >
                                    <Link
                                        :href="link.url"
                                    >
                                        <span v-html="link.label" />
                                    </Link>
                                </Button>
                            </template>
                        </div>
                    </div>
                </CardContent>
            </Card>
        </div>
    </AppLayout>
</template>
