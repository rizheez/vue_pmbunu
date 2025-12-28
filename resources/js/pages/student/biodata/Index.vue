<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert';
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
import type { StudentBiodata } from '@/types/pmb';
import { Head, Link, usePage } from '@inertiajs/vue3';
import {
    AlertCircle,
    CheckCircle,
    Edit,
    ExternalLink,
    FileText,
    User,
} from 'lucide-vue-next';
import { computed } from 'vue';

interface Props {
    biodata: StudentBiodata | null;
}

const props = defineProps<Props>();
const page = usePage();

const flash = computed(() => page.props.flash as { success?: string; error?: string });

const breadcrumbs = [
    { title: 'Dashboard', href: '/student/dashboard' },
    { title: 'Biodata', href: '/student/biodata' },
];

const isPdf = (url: string | null) => {
    if (!url) return false;
    return url.toLowerCase().endsWith('.pdf') || url.startsWith('data:application/pdf');
};
</script>

<template>

    <Head title="Biodata" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <!-- Flash Messages -->
            <Alert v-if="flash?.success" class="border-green-500 bg-green-50">
                <CheckCircle class="size-4 text-green-600" />
                <AlertTitle class="text-green-800">Berhasil</AlertTitle>
                <AlertDescription class="text-green-700">
                    {{ flash.success }}
                </AlertDescription>
            </Alert>

            <Alert v-if="flash?.error" variant="destructive">
                <AlertCircle class="size-4" />
                <AlertTitle>Error</AlertTitle>
                <AlertDescription>{{ flash.error }}</AlertDescription>
            </Alert>

            <div v-if="props.biodata" class="grid gap-6 lg:grid-cols-2">
                <!-- Personal Info Card -->
                <Card>
                    <CardHeader class="flex flex-row items-center justify-between">
                        <div>
                            <CardTitle class="flex items-center gap-2">
                                <User class="size-5" />
                                Data Pribadi
                            </CardTitle>
                        </div>
                        <Button as-child variant="outline" size="sm"
                            class="border-teal-600 text-teal-600 hover:bg-teal-50">
                            <Link href="/student/biodata/edit">
                                <Edit class="mr-2 size-4" />
                                Edit
                            </Link>
                        </Button>

                    </CardHeader>
                    <CardContent class="space-y-4">
                        <div class="grid gap-4 text-sm">
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Nama</span>
                                <span class="font-medium">{{
                                    props.biodata.name
                                    }}</span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">NIK</span>
                                <span class="font-mono font-medium">{{
                                    props.biodata.nik
                                    }}</span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">NISN</span>
                                <span class="font-medium">{{
                                    props.biodata.nisn || '-'
                                    }}</span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Jenis Kelamin</span>
                                <span class="font-medium">{{
                                    props.biodata.gender
                                    }}</span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Tempat, Tgl Lahir</span>
                                <span class="font-medium">{{ props.biodata.birth_place }},
                                    {{ props.biodata.birth_date }}</span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Agama</span>
                                <span class="font-medium">{{
                                    props.biodata.religion
                                    }}</span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Telepon</span>
                                <span class="font-medium">{{
                                    props.biodata.phone
                                    }}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-gray-500">Alamat</span>
                                <span class="max-w-[200px] text-right font-medium">{{
                                    props.biodata.address
                                    }}</span>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <!-- Education Card -->
                <Card>
                    <CardHeader>
                        <CardTitle class="flex items-center gap-2">
                            <FileText class="size-5" />
                            Data Pendidikan
                        </CardTitle>
                    </CardHeader>
                    <CardContent class="space-y-4">
                        <div class="grid gap-4 text-sm">
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Pendidikan Terakhir</span>
                                <span class="font-medium">{{
                                    props.biodata.last_education || '-'
                                    }}</span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Asal Sekolah</span>
                                <span class="font-medium">{{
                                    props.biodata.school_origin
                                    }}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-gray-500">Jurusan</span>
                                <span class="font-medium">{{
                                    props.biodata.major || '-'
                                    }}</span>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <!-- Documents Card -->
                <Card class="lg:col-span-2">
                    <CardHeader>
                        <CardTitle>Dokumen</CardTitle>
                        <CardDescription>
                            Status verifikasi dokumen Anda
                        </CardDescription>
                    </CardHeader>
                    <CardContent>
                        <div class="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
                            <!-- Photo -->
                            <div class="rounded-lg border p-4">
                                <div class="mb-2 flex items-center justify-between">
                                    <span class="text-sm font-medium">Pas Foto</span>
                                    <Badge v-if="props.biodata.photo_path" variant="default">Uploaded</Badge>
                                    <Badge v-else variant="secondary">Belum</Badge>
                                </div>
                                <a v-if="props.biodata.photo_url" :href="props.biodata.photo_url" target="_blank"
                                    class="relative block aspect-square cursor-pointer overflow-hidden rounded-lg bg-gray-100">
                                    <img :src="props.biodata.photo_url" class="size-full object-cover" />
                                    <div
                                        class="absolute inset-0 flex items-center justify-center bg-black/50 opacity-0 transition hover:opacity-100">
                                        <ExternalLink class="size-6 text-white" />
                                    </div>
                                </a>
                                <p v-if="props.biodata.photo_url" class="mt-1 text-center text-xs text-gray-400">Tekan
                                    file/gambar untuk melihat</p>
                            </div>

                            <!-- KTP -->
                            <div class="rounded-lg border p-4">
                                <div class="mb-2 flex items-center justify-between">
                                    <span class="text-sm font-medium">KTP</span>
                                    <Badge v-if="props.biodata.ktp_path" variant="default">Uploaded</Badge>
                                    <Badge v-else variant="secondary">Belum</Badge>
                                </div>
                                <a v-if="props.biodata.ktp_url" :href="props.biodata.ktp_url" target="_blank"
                                    class="relative block aspect-video cursor-pointer overflow-hidden rounded-lg bg-gray-100">
                                    <div v-if="isPdf(props.biodata.ktp_url)"
                                        class="flex size-full flex-col items-center justify-center gap-2 bg-gray-50 text-gray-500 hover:bg-gray-100">
                                        <FileText class="size-8 text-red-500" />
                                        <span class="text-xs">PDF Document</span>
                                    </div>
                                    <img v-else :src="props.biodata.ktp_url" class="size-full object-cover" />
                                    <div
                                        class="absolute inset-0 flex items-center justify-center bg-black/50 opacity-0 transition hover:opacity-100">
                                        <ExternalLink class="size-6 text-white" />
                                    </div>
                                </a>
                                <p v-if="props.biodata.ktp_url" class="mt-1 text-center text-xs text-gray-400">Tekan
                                    file/gambar untuk melihat</p>
                            </div>

                            <!-- KK -->
                            <div class="rounded-lg border p-4">
                                <div class="mb-2 flex items-center justify-between">
                                    <span class="text-sm font-medium">Kartu Keluarga</span>
                                    <Badge v-if="props.biodata.kk_path" variant="default">Uploaded</Badge>
                                    <Badge v-else variant="secondary">Belum</Badge>
                                </div>
                                <a v-if="props.biodata.kk_url" :href="props.biodata.kk_url" target="_blank"
                                    class="relative block aspect-video cursor-pointer overflow-hidden rounded-lg bg-gray-100">
                                    <div v-if="isPdf(props.biodata.kk_url)"
                                        class="flex size-full flex-col items-center justify-center gap-2 bg-gray-50 text-gray-500 hover:bg-gray-100">
                                        <FileText class="size-8 text-red-500" />
                                        <span class="text-xs">PDF Document</span>
                                    </div>
                                    <img v-else :src="props.biodata.kk_url" class="size-full object-cover" />
                                    <div
                                        class="absolute inset-0 flex items-center justify-center bg-black/50 opacity-0 transition hover:opacity-100">
                                        <ExternalLink class="size-6 text-white" />
                                    </div>
                                </a>
                                <p v-if="props.biodata.kk_url" class="mt-1 text-center text-xs text-gray-400">Tekan
                                    file/gambar untuk melihat</p>
                            </div>

                            <!-- Certificate -->
                            <div class="rounded-lg border p-4">
                                <div class="mb-2 flex items-center justify-between">
                                    <span class="text-sm font-medium">Ijazah</span>
                                    <Badge v-if="props.biodata.certificate_path" variant="default">Uploaded</Badge>
                                    <Badge v-else variant="secondary">Opsional</Badge>
                                </div>
                                <a v-if="props.biodata.certificate_url" :href="props.biodata.certificate_url"
                                    target="_blank"
                                    class="relative block aspect-video cursor-pointer overflow-hidden rounded-lg bg-gray-100">
                                    <div v-if="isPdf(props.biodata.certificate_url)"
                                        class="flex size-full flex-col items-center justify-center gap-2 bg-gray-50 text-gray-500 hover:bg-gray-100">
                                        <FileText class="size-8 text-red-500" />
                                        <span class="text-xs">PDF Document</span>
                                    </div>
                                    <img v-else :src="props.biodata.certificate_url" class="size-full object-cover" />
                                    <div
                                        class="absolute inset-0 flex items-center justify-center bg-black/50 opacity-0 transition hover:opacity-100">
                                        <ExternalLink class="size-6 text-white" />
                                    </div>
                                </a>
                                <p v-if="props.biodata.certificate_url" class="mt-1 text-center text-xs text-gray-400">
                                    Tekan file/gambar untuk melihat</p>
                            </div>
                        </div>
                    </CardContent>
                </Card>
            </div>

            <!-- Empty State -->
            <Card v-else>
                <CardContent class="flex flex-col items-center py-12">
                    <div class="mb-4 flex size-16 items-center justify-center rounded-full bg-gray-100">
                        <User class="size-8 text-gray-400" />
                    </div>
                    <h3 class="mb-2 text-lg font-medium">
                        Biodata Belum Diisi
                    </h3>
                    <p class="mb-6 text-center text-gray-500">
                        Lengkapi biodata Anda untuk melanjutkan proses
                        pendaftaran.
                    </p>
                    <Button as-child>
                        <Link href="/student/biodata/edit">Isi Biodata</Link>
                    </Button>
                </CardContent>
            </Card>
        </div>
    </AppLayout>
</template>
