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
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import type {
    ProgramStudi,
    Registration,
    RegistrationPath,
    RegistrationPeriod,
} from '@/types/pmb';
import { Deferred, Head, Link, router } from '@inertiajs/vue3';
import { computed, ref } from 'vue';
import VueApexCharts from 'vue3-apexcharts';
import {
    BookOpen,
    CalendarDays,
    CheckCircle,
    Clock,
    FileCheck,
    FileX,
    GraduationCap,
    Layers,
    Megaphone,
    RefreshCw,
    TrendingUp,
    UserCheck,
    UserPlus,
    Users,
    XCircle,
    Zap,
    Sparkles,
} from 'lucide-vue-next';

interface ProgramStat {
    total: number;
    program_studi: ProgramStudi;
}

interface WaveStat {
    name: string;
    wave_number: number;
    academic_year: string;
    total: number;
    is_active: boolean;
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
        re_registration_pending: number;
        re_registration_verified: number;
        enrolled: number;
        cancelled: number;
    };
    programStats: ProgramStat[];
    programStatsEnrolled: ProgramStat[];
    pendingVerifications: number;
    pendingPaymentVerifications: number;
    recentRegistrations: Registration[];
    todayRegistrations: number;
    weekRegistrations: number;
    monthRegistrations: number;
    waveStats: WaveStat[];
    activePeriod: RegistrationPeriod | null;
    allPeriods: RegistrationPeriod[];
    selectedPeriod: RegistrationPeriod | null;
    registrationTrend: {
        labels: string[];
        data: number[];
    };
    registrationPaths: RegistrationPath[];
    selectedPathId: number | null;
    aiInsight?: string;
}

const props = defineProps<Props>();

const breadcrumbs = [{ title: 'Admin Dashboard', href: '/admin/dashboard' }];

const filterByPeriod = (periodId: number | string) => {
    router.get(
        '/admin/dashboard',
        {
            period_id: periodId,
            ...(selectedPathId.value ? { registration_path_id: selectedPathId.value } : {}),
        },
        { preserveState: true },
    );
};

const selectedPathId = ref<number | string>(props.selectedPathId || '');

const filterByPath = (pathId: number | string) => {
    selectedPathId.value = pathId;
    router.get(
        '/admin/dashboard',
        {
            ...(props.selectedPeriod?.id ? { period_id: props.selectedPeriod.id } : {}),
            ...(pathId ? { registration_path_id: pathId } : {}),
        },
        { preserveState: true },
    );
};

const getStatusLabel = (status: string) => {
    const labels: Record<string, string> = {
        draft: 'Draft',
        submitted: 'Terdaftar',
        verified: 'Terverifikasi',
        accepted: 'Diterima',
        rejected: 'Ditolak',
        re_registration_pending: 'Finalisasi Data',
        re_registration_verified: 'Daftar Ulang Terverifikasi',
        enrolled: 'Mahasiswa Aktif',
        cancelled: 'Mahasiswa Dibatalkan',
    };
    return labels[status] || status;
};

const chartOptions = computed(() => ({
    chart: {
        type: 'area',
        height: 350,
        fontFamily: 'inherit',
        toolbar: { show: false },
        zoom: { enabled: false },
    },
    colors: ['#0d9488'], // Teal-600
    dataLabels: { enabled: false },
    stroke: { curve: 'smooth', width: 2 },
    xaxis: {
        categories: props.registrationTrend.labels,
        tooltip: { enabled: false },
    },
    yaxis: {
        labels: {
            formatter: (val: number) => Math.floor(val),
        },
    },
    fill: {
        type: 'gradient',
        gradient: {
            shadeIntensity: 1,
            opacityFrom: 0.4,
            opacityTo: 0.05,
            stops: [0, 100],
        },
    },
    tooltip: {
        y: {
            formatter: (val: number) => `${val} pendaftar`,
        },
    },
}));

const chartSeries = computed(() => [
    {
        name: 'Pendaftar Baru',
        data: props.registrationTrend.data,
    },
]);
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
                    @change="
                        filterByPeriod(
                            ($event.target as HTMLSelectElement).value,
                        )
                    "
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

            <!-- AI Insight -->
            <Deferred data="aiInsight">
                <template #fallback>
                    <Card class="border-purple-200 bg-purple-50/30">
                        <CardContent class="flex items-center gap-4 p-4">
                            <div class="size-6 animate-pulse rounded-full bg-purple-200"></div>
                            <div class="flex-1 space-y-2">
                                <div class="h-4 w-full animate-pulse rounded bg-purple-200"></div>
                                <div class="h-4 w-3/4 animate-pulse rounded bg-purple-200"></div>
                            </div>
                        </CardContent>
                    </Card>
                </template>
                <Card class="border-purple-200 bg-gradient-to-r from-purple-50 to-white shadow-sm">
                    <CardContent class="flex items-start gap-4 p-4">
                        <div class="mt-1">
                            <Sparkles class="size-6 text-purple-500" />
                        </div>
                        <div>
                            <h3 class="mb-1 font-semibold text-purple-900">✨ Insight AI</h3>
                            <p class="text-sm leading-relaxed text-purple-800">
                                {{ props.aiInsight }}
                            </p>
                        </div>
                    </CardContent>
                </Card>
            </Deferred>

            <!-- Stats Grid - Row 1: Pendaftaran -->
            <div class="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
                <Card>
                    <CardHeader
                        class="flex flex-row items-center justify-between pb-2"
                    >
                        <CardTitle class="text-sm font-medium">
                            Total Pendaftar
                        </CardTitle>
                        <Users class="size-4 text-muted-foreground" />
                    </CardHeader>
                    <CardContent>
                        <div class="text-2xl font-bold">
                            {{ props.totalStudents }}
                        </div>
                        <div class="mt-1 space-y-0.5 text-xs text-muted-foreground">
                            <p>Hari ini: {{ props.todayRegistrations }} · Minggu ini: {{ props.weekRegistrations }}</p>
                            <p>Bulan ini: {{ props.monthRegistrations }}</p>
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader
                        class="flex flex-row items-center justify-between pb-2"
                    >
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
                            <Link
                                href="/admin/students?status=submitted"
                                class="underline hover:text-teal-600"
                            >
                                Perlu ditinjau segera
                            </Link>
                        </p>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader
                        class="flex flex-row items-center justify-between pb-2"
                    >
                        <CardTitle class="text-sm font-medium"
                            >Diterima</CardTitle
                        >
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
                    <CardHeader
                        class="flex flex-row items-center justify-between pb-2"
                    >
                        <CardTitle class="text-sm font-medium"
                            >Ditolak</CardTitle
                        >
                        <XCircle class="size-4 text-red-500" />
                    </CardHeader>
                    <CardContent>
                        <div class="text-2xl font-bold text-red-600">
                            {{ props.statusStats.rejected }}
                        </div>
                    </CardContent>
                </Card>
            </div>

            <!-- Stats Grid - Row 2: Daftar Ulang -->
            <div class="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
                <Card class="border-purple-200 bg-purple-50/50">
                    <CardHeader
                        class="flex flex-row items-center justify-between pb-2"
                    >
                        <CardTitle class="text-sm font-medium">
                            Perlu Finalisasi Data
                        </CardTitle>
                        <RefreshCw class="size-4 text-purple-500" />
                    </CardHeader>
                    <CardContent>
                        <div class="text-2xl font-bold text-purple-600">
                            {{ props.statusStats.accepted }}
                        </div>
                        <p class="text-xs text-muted-foreground">
                            <Link
                                href="/admin/reregistration"
                                class="underline hover:text-purple-600"
                            >
                                Lihat daftar ulang
                            </Link>
                        </p>
                    </CardContent>
                </Card>

                <Card class="border-teal-200 bg-teal-50/50">
                    <CardHeader
                        class="flex flex-row items-center justify-between pb-2"
                    >
                        <CardTitle class="text-sm font-medium">
                            Daftar Ulang Terverifikasi
                        </CardTitle>
                        <UserCheck class="size-4 text-teal-500" />
                    </CardHeader>
                    <CardContent>
                        <div class="text-2xl font-bold text-teal-600">
                            {{ props.statusStats.re_registration_verified }}
                        </div>
                        <p class="text-xs text-muted-foreground">
                            Siap generate NIM
                        </p>
                    </CardContent>
                </Card>

                <Card class="border-emerald-200 bg-emerald-50/50">
                    <CardHeader
                        class="flex flex-row items-center justify-between pb-2"
                    >
                        <CardTitle class="text-sm font-medium">
                            Mahasiswa Aktif
                        </CardTitle>
                        <GraduationCap class="size-4 text-emerald-500" />
                    </CardHeader>
                    <CardContent>
                        <div class="text-2xl font-bold text-emerald-600">
                            {{ props.statusStats.enrolled }}
                        </div>
                        <p class="text-xs text-muted-foreground">
                            <Link
                                href="/admin/enrolled-students"
                                class="underline hover:text-emerald-600"
                            >
                                Lihat mahasiswa
                            </Link>
                        </p>
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
                <CardContent
                    class="flex flex-col gap-4 sm:flex-row sm:flex-wrap"
                >
                    <Button as-child variant="outline" class="flex-1">
                        <Link href="/admin/students/create">
                            <UserPlus class="mr-2 size-4" />
                            Tambah Calon Mahasiswa
                        </Link>
                    </Button>
                    <Button as-child variant="outline" class="flex-1">
                        <Link href="/admin/students?status=submitted">
                            <FileCheck class="mr-2 size-4" />
                            Verifikasi Dokumen
                        </Link>
                    </Button>
                    <Button as-child variant="outline" class="flex-1">
                        <Link href="/admin/nim-generation">
                            <GraduationCap class="mr-2 size-4" />
                            Generate NIM
                        </Link>
                    </Button>
                    <Button as-child variant="outline" class="flex-1">
                        <Link href="/admin/announcements">
                            <Megaphone class="mr-2 size-4" />
                            Kelola Pengumuman
                        </Link>
                    </Button>
                    <Button as-child variant="outline" class="flex-1">
                        <Link href="/admin/dokumentasi">
                            <BookOpen class="mr-2 size-4" />
                            Dokumentasi
                        </Link>
                    </Button>
                </CardContent>
            </Card>

            <!-- Trend Chart -->
            <Card>
                <CardHeader>
                    <CardTitle class="flex items-center gap-2">
                        Tren Pendaftaran 14 Hari Terakhir
                    </CardTitle>
                    <CardDescription>
                        Grafik jumlah pendaftar baru per hari
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <VueApexCharts
                        type="area"
                        height="350"
                        :options="chartOptions"
                        :series="chartSeries"
                    />
                </CardContent>
            </Card>

            <!-- Per-Wave Comparison -->
            <Card v-if="props.waveStats && props.waveStats.length > 0">
                <CardHeader>
                    <CardTitle class="flex items-center gap-2">
                        <Layers class="size-5 text-indigo-500" />
                        Perbandingan Per Gelombang
                    </CardTitle>
                    <CardDescription>
                        Jumlah pendaftar per gelombang pendaftaran
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <div class="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
                        <div
                            v-for="wave in props.waveStats"
                            :key="wave.name"
                            class="relative overflow-hidden rounded-lg border p-4 transition-all hover:shadow-md"
                            :class="wave.is_active ? 'border-indigo-300 bg-indigo-50/50 ring-1 ring-indigo-200' : ''"
                        >
                            <div class="flex items-center justify-between">
                                <div>
                                    <p class="text-sm font-medium text-muted-foreground">
                                        {{ wave.name }}
                                    </p>
                                    <p class="mt-1 text-2xl font-bold">
                                        {{ wave.total }}
                                        <span class="text-sm font-normal text-muted-foreground">pendaftar</span>
                                    </p>
                                </div>
                                <Badge
                                    v-if="wave.is_active"
                                    class="bg-indigo-100 text-indigo-700"
                                >
                                    Aktif
                                </Badge>
                            </div>
                            <!-- Progress bar relative to max -->
                            <div class="mt-3 h-2 w-full overflow-hidden rounded-full bg-gray-100">
                                <div
                                    class="h-full rounded-full transition-all"
                                    :class="wave.is_active ? 'bg-indigo-500' : 'bg-gray-300'"
                                    :style="{
                                        width: Math.max(
                                            (wave.total / Math.max(...props.waveStats.map(w => w.total), 1)) * 100,
                                            wave.total > 0 ? 5 : 0
                                        ) + '%',
                                    }"
                                ></div>
                            </div>
                        </div>
                    </div>
                </CardContent>
            </Card>
            <div class="grid gap-6 lg:grid-cols-2">
                <!-- Top Programs -->
                <Card>
                    <CardHeader class="pb-2">
                        <CardTitle class="flex items-center gap-2">
                            <GraduationCap class="size-5" />
                            Program Studi Favorit
                        </CardTitle>
                    </CardHeader>
                    <CardContent>
                        <!-- Jalur Pendaftaran Filter -->
                        <div v-if="props.registrationPaths.length > 0" class="mb-4">
                            <select
                                class="w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                                :value="selectedPathId"
                                @change="filterByPath(($event.target as HTMLSelectElement).value)"
                            >
                                <option value="">Semua Jalur Pendaftaran</option>
                                <option
                                    v-for="path in props.registrationPaths"
                                    :key="path.id"
                                    :value="path.id"
                                >
                                    {{ path.name }}
                                </option>
                            </select>
                        </div>
                        <Tabs defaultValue="pendaftar" class="w-full">
                            <TabsList class="mb-4 grid w-full grid-cols-2">
                                <TabsTrigger value="pendaftar">
                                    Pendaftar
                                </TabsTrigger>
                                <TabsTrigger value="mahasiswa-aktif">
                                    Mahasiswa Aktif
                                </TabsTrigger>
                            </TabsList>
                            <TabsContent value="pendaftar">
                                <div
                                    v-if="props.programStats.length > 0"
                                    class="space-y-4"
                                >
                                    <div
                                        v-for="(stat, index) in props.programStats"
                                        :key="stat.program_studi.id"
                                        class="flex items-center justify-between"
                                    >
                                        <div class="flex items-center gap-3">
                                            <span
                                                class="flex size-8 items-center justify-center rounded-full bg-teal-100 text-sm font-bold text-teal-600"
                                            >
                                                {{ index + 1 }}
                                            </span>
                                            <span class="font-medium">
                                                {{ stat.program_studi.jenjang }}
                                                {{ stat.program_studi.name }}
                                            </span>
                                        </div>
                                        <Badge>{{ stat.total }} pendaftar</Badge>
                                    </div>
                                </div>
                                <p v-else class="text-center text-gray-500">
                                    Belum ada data pendaftar
                                </p>
                            </TabsContent>
                            <TabsContent value="mahasiswa-aktif">
                                <div
                                    v-if="props.programStatsEnrolled.length > 0"
                                    class="space-y-4"
                                >
                                    <div
                                        v-for="(stat, index) in props.programStatsEnrolled"
                                        :key="stat.program_studi.id"
                                        class="flex items-center justify-between"
                                    >
                                        <div class="flex items-center gap-3">
                                            <span
                                                class="flex size-8 items-center justify-center rounded-full bg-emerald-100 text-sm font-bold text-emerald-600"
                                            >
                                                {{ index + 1 }}
                                            </span>
                                            <span class="font-medium">
                                                {{ stat.program_studi.jenjang }}
                                                {{ stat.program_studi.name }}
                                            </span>
                                        </div>
                                        <Badge variant="outline" class="border-emerald-200 bg-emerald-50 text-emerald-700">{{ stat.total }} mahasiswa</Badge>
                                    </div>
                                </div>
                                <p v-else class="text-center text-gray-500">
                                    Belum ada data mahasiswa aktif
                                </p>
                            </TabsContent>
                        </Tabs>
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
                            class="max-h-96 space-y-3 overflow-y-auto"
                        >
                            <div
                                v-for="reg in props.recentRegistrations"
                                :key="reg.id"
                                class="flex items-center justify-between rounded-lg border p-3"
                            >
                                <div class="flex-1">
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
                                    <p class="mt-0.5 text-xs text-muted-foreground">
                                        {{ new Date(reg.created_at).toLocaleDateString('id-ID', { day: 'numeric', month: 'long', year: 'numeric' }) }}
                                        {{ new Date(reg.created_at).toLocaleTimeString('id-ID', { hour: '2-digit', minute: '2-digit' }) }}
                                    </p>
                                </div>
                                <Badge
                                    :variant="
                                        reg.status === 'accepted' ||
                                        reg.status === 'enrolled'
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
