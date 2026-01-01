<script setup lang="ts">
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
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
import { Edit, Search, UserCheck } from 'lucide-vue-next';
import { ref, watch } from 'vue';

interface Registration {
    id: number;
    registration_number: string;
    status: string;
    created_at: string;
    user: {
        id: number;
        name: string;
        email: string;
        student_biodata?: {
            name: string;
            reregistration_status?: string;
        };
    };
    accepted_program_studi: {
        id: number;
        name: string;
        jenjang: string;
    } | null;
    registration_type: {
        id: number;
        name: string;
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
    filters: {
        status: string;
        search: string;
    };
}

const props = defineProps<Props>();

const breadcrumbs = [
    { title: 'Dashboard', href: '/admin/dashboard' },
    { title: 'Daftar Ulang Manual', href: '/admin/reregistration' },
];

const searchQuery = ref(props.filters.search);
const statusFilter = ref(props.filters.status || 'all');

let debounceTimer: ReturnType<typeof setTimeout>;
watch([searchQuery, statusFilter], () => {
    clearTimeout(debounceTimer);
    debounceTimer = setTimeout(() => {
        router.get(
            '/admin/reregistration',
            {
                search: searchQuery.value || undefined,
                status: statusFilter.value === 'all' ? undefined : statusFilter.value,
            },
            { preserveState: true, replace: true },
        );
    }, 300);
});

const getStatusBadge = (status: string) => {
    switch (status) {
        case 'accepted':
            return { label: 'Diterima', class: 'bg-green-100 text-green-800' };
        case 're_registration_pending':
            return { label: 'Menunggu Daftar Ulang', class: 'bg-yellow-100 text-yellow-800' };
        default:
            return { label: status, class: 'bg-gray-100 text-gray-800' };
    }
};

const getReregistrationStatus = (status?: string) => {
    switch (status) {
        case 'form_completed':
            return { label: 'Form Lengkap', class: 'bg-blue-100 text-blue-800' };
        case 'payment_pending':
            return { label: 'Menunggu Verifikasi', class: 'bg-orange-100 text-orange-800' };
        case 'completed':
            return { label: 'Selesai', class: 'bg-green-100 text-green-800' };
        default:
            return { label: 'Belum Diisi', class: 'bg-gray-100 text-gray-800' };
    }
};
</script>

<template>
    <Head title="Daftar Ulang Manual" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Card>
                <CardHeader>
                    <CardTitle class="flex items-center gap-2">
                        <UserCheck class="size-5" />
                        Daftar Ulang Manual
                    </CardTitle>
                    <CardDescription>
                        Input data daftar ulang untuk mahasiswa yang sudah diterima
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <!-- Filters -->
                    <div class="mb-6 flex flex-col gap-4 sm:flex-row sm:items-center">
                        <div class="relative flex-1">
                            <Search class="absolute top-1/2 left-3 size-4 -translate-y-1/2 text-muted-foreground" />
                            <Input v-model="searchQuery" placeholder="Cari nama atau email..." class="pl-10" />
                        </div>
                        <Select v-model="statusFilter">
                            <SelectTrigger class="w-full sm:w-64">
                                <SelectValue placeholder="Filter Status" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="all">Semua Status</SelectItem>
                                <SelectItem value="accepted">Diterima</SelectItem>
                                <SelectItem value="re_registration_pending">Menunggu Daftar Ulang</SelectItem>
                            </SelectContent>
                        </Select>
                    </div>

                    <!-- Table -->
                    <div class="overflow-x-auto rounded-lg border">
                        <table class="w-full text-sm">
                            <thead class="bg-muted/50">
                                <tr>
                                    <th class="px-4 py-3 text-left font-medium">Nama</th>
                                    <th class="px-4 py-3 text-left font-medium">Program Studi</th>
                                    <th class="px-4 py-3 text-left font-medium">Status Registrasi</th>
                                    <th class="px-4 py-3 text-left font-medium">Status Daftar Ulang</th>
                                    <th class="px-4 py-3 text-center font-medium">Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y">
                                <tr v-for="reg in registrations.data" :key="reg.id" class="hover:bg-muted/50">
                                    <td class="px-4 py-3">
                                        <div>
                                            <div class="font-medium">
                                                {{ reg.user.student_biodata?.name || reg.user.name }}
                                            </div>
                                            <div class="text-xs text-muted-foreground">
                                                {{ reg.user.email }}
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-4 py-3">
                                        <span v-if="reg.accepted_program_studi">
                                            {{ reg.accepted_program_studi.jenjang }} {{ reg.accepted_program_studi.name }}
                                        </span>
                                        <span v-else class="text-muted-foreground">-</span>
                                    </td>
                                    <td class="px-4 py-3">
                                        <Badge :class="getStatusBadge(reg.status).class">
                                            {{ getStatusBadge(reg.status).label }}
                                        </Badge>
                                    </td>
                                    <td class="px-4 py-3">
                                        <Badge :class="getReregistrationStatus(reg.user.student_biodata?.reregistration_status).class">
                                            {{ getReregistrationStatus(reg.user.student_biodata?.reregistration_status).label }}
                                        </Badge>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="flex justify-center">
                                            <Button size="sm" variant="outline" @click="router.get(`/admin/reregistration/${reg.user.id}/edit`)">
                                                <Edit class="mr-1 size-4" />
                                                Edit
                                            </Button>
                                        </div>
                                    </td>
                                </tr>
                                <tr v-if="registrations.data.length === 0">
                                    <td colspan="5" class="px-4 py-8 text-center text-muted-foreground">
                                        Tidak ada data
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <div v-if="registrations.last_page > 1" class="mt-4 flex items-center justify-between">
                        <p class="text-sm text-muted-foreground">
                            Menampilkan {{ registrations.data.length }} dari {{ registrations.total }} data
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
