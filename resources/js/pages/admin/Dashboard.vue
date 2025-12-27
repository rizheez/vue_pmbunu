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
import AppLayout from '@/layouts/AppLayout.vue';
import type { Registration, RegistrationPeriod, ProgramStudi } from '@/types/pmb';
import { Head, Link, router } from '@inertiajs/vue3';
import {
    CheckCircle,
    Clock,
    FileCheck,
    FileX,
    GraduationCap,
    Megaphone,
    UserPlus,
    Users,
    XCircle,
    Zap,
} from 'lucide-vue-next';

interface ProgramStat {
    choice_1: number;
    total: number;
    program_studi_choice1: ProgramStudi | null;
}

interface Props {
    totalStudents: number;
    totalAnnouncements: number;
    statusStats: {
        draft: number;
        submitted: number;
        verified: number;
        accepted: number;
        rejected: number;
    };
    programStats: ProgramStat[];
    pendingVerifications: number;
    recentRegistrations: Registration[];
    todayRegistrations: number;
    weekRegistrations: number;
    activePeriod: RegistrationPeriod | null;
    allPeriods: RegistrationPeriod[];
    selectedPeriod: RegistrationPeriod | null;
}

const props = defineProps<Props>();

const breadcrumbs = [{ title: 'Admin Dashboard', href: '/admin/dashboard' }];

const filterByPeriod = (periodId: number | string) => {
    router.get('/admin/dashboard', { period_id: periodId }, { preserveState: true });
};

const getStatusLabel = (status: string) => {
    const labels: Record<string, string> = {
        draft: 'Draft',
        submitted: 'Terdaftar',
        verified: 'Terverifikasi',
        accepted: 'Diterima',
        rejected: 'Ditolak',
        re_registration_pending: 'Menunggu Daftar Ulang',
        re_registration_verified: 'Daftar Ulang Terverifikasi',
        enrolled: 'Mahasiswa Aktif',
    };
    return labels[status] || status;
};
</script>

<template>
    <Head title="Admin Dashboard" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <!-- Period Selector -->
            <div class="flex items-center justify-between">
                <h1 class="text-2xl font-bold">Dashboard Admin</h1>
                <select
                    class="rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                    :value="props.selectedPeriod?.id || ''"
                    @change="filterByPeriod(($event.target as HTMLSelectElement).value)"
                >
                    <option value="">Semua Periode</option>
                    <option
                        v-for="p in props.allPeriods"
                        :key="p.id"
                        :value="p.id"
                    >
                        {{ p.name }}
                        <template v-if="p.is_active">(Aktif)</template>
                    </option>
                </select>
            </div>

            <!-- Stats Grid -->
            <div class="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
                <Card>
                    <CardHeader class="flex flex-row items-center justify-between pb-2">
                        <CardTitle class="text-sm font-medium">
                            Total Pendaftar
                        </CardTitle>
                        <Users class="size-4 text-muted-foreground" />
                    </CardHeader>
                    <CardContent>
                        <div class="text-2xl font-bold">
                            {{ props.totalStudents }}
                        </div>
                        <p class="text-xs text-muted-foreground">
                            Hari ini: {{ props.todayRegistrations }} |
                            Minggu ini: {{ props.weekRegistrations }}
                        </p>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader class="flex flex-row items-center justify-between pb-2">
                        <CardTitle class="text-sm font-medium">
                            Menunggu Verifikasi
                        </CardTitle>
                        <Clock class="size-4 text-yellow-500" />
                    </CardHeader>
                    <CardContent>
                        <div class="text-2xl font-bold text-yellow-600">
                            {{ props.pendingVerifications }}
                        </div>
                        <p class="text-xs text-muted-foreground">
                            Perlu ditinjau segera
                        </p>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader class="flex flex-row items-center justify-between pb-2">
                        <CardTitle class="text-sm font-medium">Diterima</CardTitle>
                        <CheckCircle class="size-4 text-green-500" />
                    </CardHeader>
                    <CardContent>
                        <div class="text-2xl font-bold text-green-600">
                            {{ props.statusStats.accepted }}
                        </div>
                        <p class="text-xs text-muted-foreground">
                            Dari {{ props.statusStats.verified }} terverifikasi
                        </p>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader class="flex flex-row items-center justify-between pb-2">
                        <CardTitle class="text-sm font-medium">Ditolak</CardTitle>
                        <XCircle class="size-4 text-red-500" />
                    </CardHeader>
                    <CardContent>
                        <div class="text-2xl font-bold text-red-600">
                            {{ props.statusStats.rejected }}
                        </div>
                    </CardContent>
                </Card>
            </div>

            <!-- Quick Actions -->
            <Card>
                <CardHeader>
                    <CardTitle class="flex items-center gap-2">
                        <Zap class="size-5 text-yellow-500" />
                        Aksi Cepat
                    </CardTitle>
                </CardHeader>
                <CardContent class="flex flex-col gap-4 sm:flex-row">
                    <Button as-child variant="outline" class="flex-1">
                        <Link href="/admin/students/create">
                            <UserPlus class="mr-2 size-4" />
                            Tambah Mahasiswa
                        </Link>
                    </Button>
                    <Button as-child variant="outline" class="flex-1">
                        <Link href="/admin/students">
                            <FileCheck class="mr-2 size-4" />
                            Verifikasi Dokumen
                        </Link>
                    </Button>
                    <Button as-child variant="outline" class="flex-1">
                        <Link href="/admin/announcements">
                            <Megaphone class="mr-2 size-4" />
                            Kelola Pengumuman
                        </Link>
                    </Button>
                </CardContent>
            </Card>

            <!-- Status Breakdown -->
            <Card>
                <CardHeader>
                    <CardTitle>Status Pendaftaran</CardTitle>
                    <CardDescription>
                        {{ props.selectedPeriod?.name || 'Semua Periode' }}
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <div class="grid gap-4 md:grid-cols-5">
                        <div class="flex items-center gap-3 rounded-lg border p-4">
                            <FileCheck class="size-8 text-gray-400" />
                            <div>
                                <p class="text-2xl font-bold">
                                    {{ props.statusStats.draft }}
                                </p>
                                <p class="text-sm text-gray-500">Draft</p>
                            </div>
                        </div>
                        <div class="flex items-center gap-3 rounded-lg border p-4">
                            <Clock class="size-8 text-blue-500" />
                            <div>
                                <p class="text-2xl font-bold">
                                    {{ props.statusStats.submitted }}
                                </p>
                                <p class="text-sm text-gray-500">Terdaftar</p>
                            </div>
                        </div>
                        <div class="flex items-center gap-3 rounded-lg border p-4">
                            <FileCheck class="size-8 text-teal-500" />
                            <div>
                                <p class="text-2xl font-bold">
                                    {{ props.statusStats.verified }}
                                </p>
                                <p class="text-sm text-gray-500">Terverifikasi</p>
                            </div>
                        </div>
                        <div class="flex items-center gap-3 rounded-lg border p-4">
                            <CheckCircle class="size-8 text-green-500" />
                            <div>
                                <p class="text-2xl font-bold">
                                    {{ props.statusStats.accepted }}
                                </p>
                                <p class="text-sm text-gray-500">Diterima</p>
                            </div>
                        </div>
                        <div class="flex items-center gap-3 rounded-lg border p-4">
                            <FileX class="size-8 text-red-500" />
                            <div>
                                <p class="text-2xl font-bold">
                                    {{ props.statusStats.rejected }}
                                </p>
                                <p class="text-sm text-gray-500">Ditolak</p>
                            </div>
                        </div>
                    </div>
                </CardContent>
            </Card>

            <div class="grid gap-6 lg:grid-cols-2">
                <!-- Top Programs -->
                <Card>
                    <CardHeader>
                        <CardTitle class="flex items-center gap-2">
                            <GraduationCap class="size-5" />
                            Program Studi Favorit
                        </CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div v-if="props.programStats.length > 0" class="space-y-4">
                            <div
                                v-for="(stat, index) in props.programStats"
                                :key="stat.choice_1"
                                class="flex items-center justify-between"
                            >
                                <div class="flex items-center gap-3">
                                    <span
                                        class="flex size-8 items-center justify-center rounded-full bg-teal-100 text-sm font-bold text-teal-600"
                                    >
                                        {{ index + 1 }}
                                    </span>
                                    <span class="font-medium">
                                        {{
                                            stat.program_studi_choice1?.name ||
                                            'Unknown'
                                        }}
                                    </span>
                                </div>
                                <Badge>{{ stat.total }} pendaftar</Badge>
                            </div>
                        </div>
                        <p v-else class="text-center text-gray-500">
                            Belum ada data
                        </p>
                    </CardContent>
                </Card>

                <!-- Recent Registrations -->
                <Card>
                    <CardHeader>
                        <CardTitle>Pendaftaran Terbaru</CardTitle>
                        <CardDescription>7 hari terakhir</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <div
                            v-if="props.recentRegistrations.length > 0"
                            class="max-h-64 space-y-3 overflow-y-auto"
                        >
                            <div
                                v-for="reg in props.recentRegistrations"
                                :key="reg.id"
                                class="flex items-center justify-between rounded-lg border p-3"
                            >
                                <div>
                                    <p class="font-medium">
                                        {{
                                            reg.user?.student_biodata?.name ||
                                            reg.user?.name ||
                                            'N/A'
                                        }}
                                    </p>
                                    <p class="text-sm text-gray-500">
                                        {{
                                            reg.program_studi_choice1?.name ||
                                            '-'
                                        }}
                                    </p>
                                </div>
                                <Badge
                                    :variant="
                                        reg.status === 'accepted'
                                            ? 'default'
                                            : reg.status === 'rejected'
                                              ? 'destructive'
                                              : 'secondary'
                                    "
                                >
                                    {{ getStatusLabel(reg.status) }}
                                </Badge>
                            </div>
                        </div>
                        <p v-else class="text-center text-gray-500">
                            Belum ada pendaftaran minggu ini
                        </p>
                    </CardContent>
                </Card>
            </div>
        </div>
    </AppLayout>
</template>
