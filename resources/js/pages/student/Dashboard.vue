<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { formatDate } from '@/composables/useFormat';
import {
    Card,
    CardContent,
    CardHeader,
    CardTitle,
} from '@/components/ui/card';
import AppLayout from '@/layouts/AppLayout.vue';
import type {
    Announcement,
    DocumentVerification,
    Registration,
    RegistrationPeriod,
    StudentBiodata,
} from '@/types/pmb';
import { Head, Link } from '@inertiajs/vue3';
import {
    AlertCircle,
    AlertTriangle,
    BookOpen,
    Calendar,
    Check,
    FileText,
    Inbox,
    Megaphone,
    PartyPopper,
    Printer,
    X,
    XCircle,
} from 'lucide-vue-next';

interface Step {
    name: string;
    completed: boolean;
    active: boolean;
    failed: boolean;
}

interface Props {
    biodata: StudentBiodata | null;
    registration: Registration | null;
    steps: Step[];
    announcements: Announcement[];
    activePeriod: RegistrationPeriod | null;
    rejectedVerifications: DocumentVerification[];
}

const props = defineProps<Props>();
</script>

<template>
    <Head title="Dashboard Mahasiswa" />

    <AppLayout
        :breadcrumbs="[{ title: 'Dashboard', href: '/student/dashboard' }]"
    >
        <div class="flex flex-col gap-6 p-4">
            <!-- Welcome Banner -->
            <div
                class="relative overflow-hidden rounded-xl bg-gradient-to-r from-teal-500 to-cyan-600 p-6 text-white shadow-lg"
            >
                <div class="relative z-10">
                    <h2 class="mb-2 text-2xl font-bold">
                        Selamat Datang di Website PMB UNUKALTIM
                    </h2>
                    <p class="mb-4 max-w-2xl text-teal-100">
                        Sistem Penerimaan Mahasiswa Baru Universitas Nahdlatul
                        Ulama Kalimantan Timur. Silakan lengkapi biodata dan
                        ikuti alur pendaftaran yang tersedia.
                    </p>
                    <a
                        href="/panduan-lengkap"
                        target="_blank"
                        class="inline-flex items-center gap-2 rounded-full bg-white/20 px-4 py-2 text-sm font-medium backdrop-blur-sm transition hover:bg-white/30"
                    >
                        <BookOpen class="size-4" />
                        Lihat Panduan Lengkap
                    </a>
                </div>
                <!-- Decorative Element -->
                <div
                    class="absolute right-0 top-0 h-full w-1/3 translate-x-10 -translate-y-10 opacity-10"
                >
                    <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
                        <path
                            fill="currentColor"
                            d="M44.7,-76.4C58.9,-69.2,71.8,-59.1,81.6,-46.6C91.4,-34.1,98.1,-19.2,95.8,-4.9C93.5,9.3,82.3,22.9,71.3,35.1C60.3,47.3,49.5,58.1,36.9,64.9C24.3,71.7,9.9,74.5,-3.3,80.2C-16.5,85.9,-28.5,94.5,-39.2,87.3C-49.9,80.1,-59.3,57.1,-65.8,38.3C-72.3,19.5,-75.9,4.9,-73.4,-8.6C-70.9,-22.1,-62.3,-34.5,-52,-44.9C-41.7,-55.3,-29.7,-63.7,-16.8,-68.2C-3.9,-72.7,10,-73.3,23.5,-73.8L37,-74.3Z"
                            transform="translate(100 100)"
                        />
                    </svg>
                </div>
            </div>

            <!-- Period Info -->
            <Alert
                v-if="props.activePeriod"
                class="border-l-4 border-blue-500 bg-blue-50"
            >
                <Calendar class="size-4 text-blue-600" />
                <AlertTitle class="text-blue-800">{{
                    props.activePeriod.name
                }}</AlertTitle>
                <AlertDescription class="text-blue-700">
                    <p>
                        Periode: {{ formatDate(props.activePeriod.start_date) }}
                        -
                        {{ formatDate(props.activePeriod.end_date) }}
                    </p>
                </AlertDescription>
            </Alert>
            <Alert
                v-else
                variant="destructive"
                class="border-l-4 border-yellow-500 bg-yellow-50"
            >
                <AlertTriangle class="size-4 text-yellow-600" />
                <AlertTitle class="text-yellow-800"
                    >Periode Pendaftaran Belum Dibuka</AlertTitle
                >
                <AlertDescription class="text-yellow-700">
                    Saat ini tidak ada periode pendaftaran yang aktif. Silakan
                    tunggu pengumuman lebih lanjut.
                </AlertDescription>
            </Alert>

            <!-- Rejected Verifications Alert -->
            <Alert
                v-if="props.rejectedVerifications.length > 0"
                variant="destructive"
                class="border-l-4 border-red-500"
            >
                <AlertCircle class="size-4" />
                <AlertTitle>Pemberitahuan Verifikasi Berkas</AlertTitle>
                <AlertDescription>
                    <p class="mb-2">
                        Beberapa dokumen/data Anda memerlukan perbaikan:
                    </p>
                    <ul class="list-inside list-disc space-y-1">
                        <li
                            v-for="v in props.rejectedVerifications"
                            :key="v.id"
                        >
                            <strong>{{ v.document_type }}</strong>
                            <span v-if="v.notes" class="ml-2 text-xs">
                                Catatan: {{ v.notes }}
                            </span>
                        </li>
                    </ul>
                    <Link
                        href="/student/biodata/edit"
                        class="mt-3 font-medium underline"
                    >
                        Perbaiki sekarang →
                    </Link>
                </AlertDescription>
            </Alert>

            <div class="grid grid-cols-1 gap-6 lg:grid-cols-2">
                <!-- Announcements -->
                <Card class="lg:col-span-2">
                    <CardHeader>
                        <CardTitle>Pengumuman</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div
                            v-if="props.announcements.length > 0"
                            class="max-h-64 space-y-4 overflow-y-auto lg:max-h-96"
                        >
                            <div
                                v-for="ann in props.announcements"
                                :key="ann.id"
                                class="rounded border-l-4 border-teal-500 bg-teal-50 p-4"
                            >
                                <div class="flex gap-3">
                                    <Megaphone
                                        class="size-5 shrink-0 text-teal-600"
                                    />
                                    <div class="flex-1">
                                        <h4
                                            class="text-sm font-medium text-teal-800"
                                        >
                                            {{ ann.title }}
                                        </h4>
                                        <p class="mt-2 text-sm md:text-justify text-teal-700">
                                            {{ ann.content }}
                                        </p>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div
                            v-else
                            class="flex h-48 flex-col items-center justify-center text-gray-400"
                        >
                            <Inbox class="mb-2 size-10 opacity-50" />
                            <p>Belum ada pengumuman :(</p>
                        </div>
                    </CardContent>
                </Card>

                <!-- Biodata Card -->
                <Card class="border-t-4 border-teal-600">
                    <CardHeader>
                        <CardTitle>Biodata Wajib</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div
                            v-if="props.biodata"
                            class="space-y-3 text-sm"
                        >
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Nama Lengkap</span>
                                <span class="font-medium">{{
                                    props.biodata.name
                                }}</span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">NIK</span>
                                <span class="font-medium">{{
                                    props.biodata.nik || '-'
                                }}</span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">NISN</span>
                                <span class="font-medium">{{
                                    props.biodata.nisn || '-'
                                }}</span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Asal Sekolah</span>
                                <span class="font-medium">{{
                                    props.biodata.school_origin || '-'
                                }}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-gray-500">Telepon</span>
                                <span class="font-medium">{{
                                    props.biodata.phone || '-'
                                }}</span>
                            </div>
                        </div>
                        <div v-else class="py-4 text-center">
                            <div
                                class="mx-auto mb-3 flex size-12 items-center justify-center rounded-full bg-red-100"
                            >
                                <AlertCircle class="size-6 text-red-600" />
                            </div>
                            <p class="mb-3 text-sm text-gray-500">
                                Biodata belum diisi.
                            </p>
                            <Button
                                as-child
                                :disabled="!props.activePeriod"
                            >
                                <Link href="/student/biodata">Isi Biodata</Link>
                            </Button>
                        </div>
                    </CardContent>
                </Card>

                <!-- Registration Status Card -->
                <Card class="border-t-4 border-teal-600">
                    <CardHeader>
                        <CardTitle>Status Pendaftaran</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div v-if="props.registration" class="space-y-3 text-sm">
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">No. Pendaftaran</span>
                                <span class="font-mono font-medium">{{
                                    props.registration.registration_number ||
                                    '-'
                                }}</span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500"
                                    >Jenis Pendaftaran</span
                                >
                                <span class="font-medium">{{
                                    props.registration.registration_type
                                        ?.name || '-'
                                }}</span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Pilihan 1</span>
                                <span class="font-medium">{{
                                    props.registration.program_studi_choice1
                                        ?.name || '-'
                                }}</span>
                            </div>
                            <div
                                v-if="props.registration.choice_2"
                                class="flex justify-between border-b pb-2"
                            >
                                <span class="text-gray-500">Pilihan 2</span>
                                <span class="font-medium">{{
                                    props.registration.program_studi_choice2
                                        ?.name || '-'
                                }}</span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Status</span>
                                <Badge :class="props.registration?.status_badge_class">{{
                                    props.registration?.status_label ||
                                    props.registration?.status
                                }} </Badge>

                            </div>

                            <!-- Accepted -->
                            <div
                                v-if="
                                    props.registration?.status === 'accepted' &&
                                    props.registration?.accepted_program_studi
                                "
                                class="mt-4 rounded-lg border border-green-200 bg-green-50 p-4"
                            >
                                <div class="mb-2 flex items-center gap-2">
                                    <PartyPopper class="size-5 text-green-600" />
                                    <span class="font-semibold text-green-800"
                                        >Selamat! Anda Diterima</span
                                    >
                                </div>
                                <div class="text-sm text-green-700">
                                    <span class="text-gray-600"
                                        >Diterima di Program Studi:</span
                                    >
                                    <p
                                        class="mt-1 text-base font-bold text-green-900"
                                    >
                                        {{
                                            props.registration
                                                .accepted_program_studi?.name
                                        }}
                                    </p>
                                    <span
                                        >Segera lakukan pendaftaran ulang di
                                        <Link
                                            href="/student/reregistration"
                                            class="font-semibold text-blue-600 hover:underline"
                                            >Daftar Ulang</Link
                                        ></span
                                    >
                                </div>
                            </div>

                            <!-- Enrolled - Show NIM -->
                            <div
                                v-if="props.registration?.status === 'enrolled'"
                                class="mt-4 rounded-lg border border-emerald-200 bg-gradient-to-r from-emerald-50 to-teal-50 p-4"
                            >
                                <div class="mb-3 flex items-center gap-2">
                                    <PartyPopper class="size-5 text-emerald-600" />
                                    <span class="font-semibold text-emerald-800"
                                        >Anda Resmi Menjadi Mahasiswa!</span
                                    >
                                </div>
                                <div class="space-y-2 text-sm">
                                    <div class="flex justify-between">
                                        <span class="text-gray-600">Program Studi:</span>
                                        <span class="font-medium text-emerald-900">
                                            {{ props.registration.accepted_program_studi?.name }}
                                        </span>
                                    </div>
                                    <div class="flex justify-between border-t border-emerald-200 pt-2">
                                        <span class="text-gray-600">NIM:</span>
                                        <span class="font-mono text-lg font-bold text-emerald-700">
                                            {{ props.registration.user?.nim || '-' }}
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <!-- Rejected -->
                            <div
                                v-if="props.registration?.status === 'rejected'"
                                class="mt-4 rounded-lg border border-red-200 bg-red-50 p-4"
                            >
                                <div class="mb-2 flex items-center gap-2">
                                    <XCircle class="size-5 text-red-600" />
                                    <span class="font-semibold text-red-800"
                                        >Pendaftaran Ditolak</span
                                    >
                                </div>
                                <div
                                    v-if="props.registration?.rejection_reason"
                                    class="text-sm text-red-700"
                                >
                                    <span class="text-gray-600">Alasan:</span>
                                    <p class="mt-1 text-red-900">
                                        {{
                                            props.registration?.rejection_reason
                                        }}
                                    </p>
                                </div>
                            </div>

                            <!-- Print Registration Card Button -->
                            <div class="mt-4 pt-4 border-t">
                                <Button
                                    as-child
                                    variant="outline"
                                    class="w-full border-teal-500 text-teal-700 hover:bg-teal-50"
                                >
                                    <a
                                        href="/student/registration-card"
                                        target="_blank"
                                    >
                                        <Printer class="mr-2 size-4" />
                                        Cetak Kartu Peserta
                                    </a>
                                </Button>
                            </div>
                        </div>
                        <div v-else class="py-4 text-center">
                            <div
                                class="mx-auto mb-3 flex size-12 items-center justify-center rounded-full bg-gray-100"
                            >
                                <FileText class="size-6 text-gray-400" />
                            </div>
                            <p class="mb-3 text-sm text-gray-500">
                                Belum mendaftar.
                            </p>
                            <Button
                                as-child
                                :disabled="!props.activePeriod || !props.biodata"
                            >
                                <Link href="/student/pendaftaran"
                                    >Daftar Sekarang</Link
                                >
                            </Button>
                            <p
                                v-if="!props.biodata"
                                class="mt-2 text-xs text-gray-400"
                            >
                                Lengkapi biodata terlebih dahulu
                            </p>
                        </div>
                    </CardContent>
                </Card>
            </div>

            <!-- Progress Steps -->
            <Card>
                <CardHeader>
                    <CardTitle>Alur Pendaftaran</CardTitle>
                </CardHeader>
                <CardContent>
                    <div class="relative">
                        <div
                            class="absolute inset-0 flex items-center"
                            aria-hidden="true"
                        >
                            <div class="w-full border-t border-gray-200"></div>
                        </div>
                        <div class="relative flex justify-between">
                            <div
                                v-for="(step, index) in props.steps"
                                :key="step.name"
                                class="group flex flex-col items-center"
                            >
                                <span
                                    class="flex size-8 items-center justify-center rounded-full ring-4 ring-white"
                                    :class="{
                                        'bg-red-600': step.failed,
                                        'bg-teal-600':
                                            step.completed && !step.failed,
                                        'bg-blue-600':
                                            step.active &&
                                            !step.completed &&
                                            !step.failed,
                                        'bg-gray-200':
                                            !step.failed &&
                                            !step.completed &&
                                            !step.active,
                                    }"
                                >
                                    <X
                                        v-if="step.failed"
                                        class="size-5 text-white"
                                    />
                                    <Check
                                        v-else-if="step.completed"
                                        class="size-5 text-white"
                                    />
                                    <span v-else class="text-xs text-white">{{
                                        index + 1
                                    }}</span>
                                </span>
                                <span
                                    class="mt-2 text-xs font-medium"
                                    :class="{
                                        'text-red-600': step.failed,
                                        'text-gray-900':
                                            step.active || step.completed,
                                        'text-gray-500':
                                            !step.failed &&
                                            !step.active &&
                                            !step.completed,
                                    }"
                                    >{{ step.name }}</span
                                >
                            </div>
                        </div>
                    </div>
                </CardContent>
            </Card>
        </div>
    </AppLayout>
</template>
