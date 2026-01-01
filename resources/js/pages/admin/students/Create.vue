<script setup lang="ts">
import { Alert, AlertDescription } from '@/components/ui/alert';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Checkbox } from '@/components/ui/checkbox';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import {
    Select,
    SelectContent,
    SelectGroup,
    SelectItem,
    SelectLabel,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import { Textarea } from '@/components/ui/textarea';
import AppLayout from '@/layouts/AppLayout.vue';
import type { Fakultas, RegistrationPath, RegistrationPeriod, RegistrationType } from '@/types/pmb';
import { Head, Link, router } from '@inertiajs/vue3';
import { ArrowLeft, Info, Save, Upload } from 'lucide-vue-next';
import { computed, ref, watch } from 'vue';

interface Props {
    activePeriod: RegistrationPeriod;
    fakultas: Fakultas[];
    types: RegistrationType[];
    paths: RegistrationPath[];
}

const props = defineProps<Props>();

const form = ref({
    // Account
    email: '',
    phone: '',
    // Personal
    name: '',
    nik: '',
    nisn: '',
    gender: '',
    birth_place: '',
    birth_date: '',
    religion: '',
    address: '',
    last_education: '',
    school_origin: '',
    major: '',
    // Registration (period_id auto-set from activePeriod)
    period_id: props.activePeriod?.id ? String(props.activePeriod.id) : '',
    type_id: '',
    path_id: '',
    program_studi_1: '',
    program_studi_2: '',
    // Referral
    referral_source: '',
    referral_detail: '',
    // Status options (admin only)
    set_verified: false,
});

// Computed for active period display
const activePeriodName = computed(() => props.activePeriod?.name || 'Tidak ada periode aktif');

const files = ref<{
    photo: File | null;
    ktp: File | null;
    kk: File | null;
    certificate: File | null;
}>({
    photo: null,
    ktp: null,
    kk: null,
    certificate: null,
});

const errors = ref<Record<string, string>>({});
const processing = ref(false);

const showReferralDetail = ref(false);
const referralDetailLabel = ref('');

watch(() => form.value.referral_source, (val) => {
    if (val === 'Dosen/Panitia PMB UNU Kaltim') {
        showReferralDetail.value = true;
        referralDetailLabel.value = 'Nama Dosen/Panitia PMB';
    } else if (val === 'Lainnya') {
        showReferralDetail.value = true;
        referralDetailLabel.value = 'Sebutkan sumber informasi lainnya';
    } else {
        showReferralDetail.value = false;
        form.value.referral_detail = '';
    }
});

const handleFileChange = (field: 'photo' | 'ktp' | 'kk' | 'certificate', event: Event) => {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files[0]) {
        files.value[field] = input.files[0];
    }
};

const submit = () => {
    processing.value = true;
    const formData = new FormData();

    Object.entries(form.value).forEach(([key, value]) => {
        formData.append(key, value);
    });

    Object.entries(files.value).forEach(([key, file]) => {
        if (file) {
            formData.append(key, file);
        }
    });

    router.post('/admin/students', formData, {
        onError: (errs) => {
            errors.value = errs;
        },
        onFinish: () => {
            processing.value = false;
        },
    });
};

const genderOptions = ['Laki-laki', 'Perempuan'];
const religionOptions = ['Islam', 'Kristen', 'Katolik', 'Hindu', 'Buddha', 'Konghucu'];
const educationOptions = ['SMA/SMK Sederajat','Paket C', 'D3', 'S1'];
const referralOptions = [
    'Dosen/Panitia PMB UNU Kaltim',
    'Media Sosial (Instagram/Facebook/Twitter)',
    'Website Resmi UNU Kaltim',
    'Teman/Keluarga',
    'Sekolah/Guru',
    'Brosur/Spanduk',
    'Event/Pameran Pendidikan',
    'Lainnya',
];

const breadcrumbs = [
    { title: 'Admin Dashboard', href: '/admin/dashboard' },
    { title: 'Calon Mahasiswa', href: '/admin/students' },
    { title: 'Daftarkan Manual', href: '/admin/students/create' },
];

const hasAvailableOptions = (fak: Fakultas) => {
    if (!form.value.program_studi_1) return true;
    return fak?.program_studi?.some((p) => String(p.id) !== form.value.program_studi_1);
};
</script>

<template>
    <Head title="Daftarkan Mahasiswa Manual" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <div class="flex items-center justify-between">
                <div class="flex items-center gap-4">
                    <Button variant="ghost" size="sm" as-child>
                        <Link href="/admin/students">
                            <ArrowLeft class="mr-2 size-4" />
                            Kembali
                        </Link>
                    </Button>
                    <div>
                        <h1 class="text-2xl font-bold">Daftarkan Calon Mahasiswa Manual</h1>
                        <p class="text-sm text-gray-500">Bantu calon mahasiswa yang kesulitan mendaftar secara online</p>
                    </div>
                </div>
            </div>

            <!-- Period Info -->
            <Alert class="border-teal-200 bg-teal-50">
                <Info class="size-4 text-teal-600" />
                <AlertDescription class="text-teal-700">
                    <span class="font-semibold">Periode Pendaftaran Aktif:</span> {{ activePeriodName }}
                </AlertDescription>
            </Alert>

            <form @submit.prevent="submit" class="space-y-6">
                <!-- Data Akun -->
                <Card>
                    <CardHeader>
                        <CardTitle>Data Akun</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div class="grid gap-4 sm:grid-cols-2">
                            <div class="space-y-2">
                                <Label>Email <span class="text-red-500">*</span></Label>
                                <Input v-model="form.email" type="email" placeholder="email@example.com" />
                                <p v-if="errors.email" class="text-sm text-red-500">{{ errors.email }}</p>
                            </div>
                            <div class="space-y-2">
                                <Label>Nomor HP / WhatsApp <span class="text-red-500">*</span></Label>
                                <Input v-model="form.phone" placeholder="08xxxxxxxxxx" />
                                <p v-if="errors.phone" class="text-sm text-red-500">{{ errors.phone }}</p>
                            </div>
                        </div>
                        <Alert class="mt-4 border-blue-200 bg-blue-50">
                            <Info class="size-4 text-blue-600" />
                            <AlertDescription class="text-blue-700">
                                Password akan digenerate otomatis dan dikirim ke email calon mahasiswa
                            </AlertDescription>
                        </Alert>
                    </CardContent>
                </Card>

                <!-- Data Pribadi -->
                <Card>
                    <CardHeader>
                        <CardTitle>Data Pribadi</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div class="grid gap-4 sm:grid-cols-2">
                            <div class="space-y-2 sm:col-span-2">
                                <Label>Nama Lengkap <span class="text-red-500">*</span></Label>
                                <Input v-model="form.name" placeholder="Nama lengkap sesuai KTP" />
                                <p v-if="errors.name" class="text-sm text-red-500">{{ errors.name }}</p>
                            </div>
                            <div class="space-y-2">
                                <Label>NIK <span class="text-red-500">*</span></Label>
                                <Input v-model="form.nik" placeholder="16 digit NIK" maxlength="16" />
                                <p v-if="errors.nik" class="text-sm text-red-500">{{ errors.nik }}</p>
                            </div>
                            <div class="space-y-2">
                                <Label>NISN</Label>
                                <Input v-model="form.nisn" placeholder="Nomor Induk Siswa Nasional" />
                                <p v-if="errors.nisn" class="text-sm text-red-500">{{ errors.nisn }}</p>
                            </div>
                            <div class="space-y-2">
                                <Label>Jenis Kelamin <span class="text-red-500">*</span></Label>
                                <Select v-model="form.gender">
                                    <SelectTrigger class="w-full">
                                        <SelectValue placeholder="Pilih jenis kelamin" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem v-for="g in genderOptions" :key="g" :value="g">{{ g }}</SelectItem>
                                    </SelectContent>
                                </Select>
                                <p v-if="errors.gender" class="text-sm text-red-500">{{ errors.gender }}</p>
                            </div>
                            <div class="space-y-2">
                                <Label>Tempat Lahir <span class="text-red-500">*</span></Label>
                                <Input v-model="form.birth_place" placeholder="Kota/Kabupaten" />
                                <p v-if="errors.birth_place" class="text-sm text-red-500">{{ errors.birth_place }}</p>
                            </div>
                            <div class="space-y-2">
                                <Label>Tanggal Lahir <span class="text-red-500">*</span></Label>
                                <Input v-model="form.birth_date" type="date" />
                                <p v-if="errors.birth_date" class="text-sm text-red-500">{{ errors.birth_date }}</p>
                            </div>
                            <div class="space-y-2">
                                <Label>Agama <span class="text-red-500">*</span></Label>
                                <Select v-model="form.religion">
                                    <SelectTrigger class="w-full">
                                        <SelectValue placeholder="Pilih agama" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem v-for="r in religionOptions" :key="r" :value="r">{{ r }}</SelectItem>
                                    </SelectContent>
                                </Select>
                                <p v-if="errors.religion" class="text-sm text-red-500">{{ errors.religion }}</p>
                            </div>
                            <div class="space-y-2 sm:col-span-2">
                                <Label>Alamat Lengkap <span class="text-red-500">*</span></Label>
                                <Textarea v-model="form.address" rows="3" placeholder="Alamat lengkap sesuai KTP" />
                                <p v-if="errors.address" class="text-sm text-red-500">{{ errors.address }}</p>
                            </div>
                            <div class="space-y-2">
                                <Label>Pendidikan Terakhir <span class="text-red-500">*</span></Label>
                                <Select v-model="form.last_education">
                                    <SelectTrigger class="w-full">
                                        <SelectValue placeholder="Pilih pendidikan" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem v-for="e in educationOptions" :key="e" :value="e">{{ e }}</SelectItem>
                                    </SelectContent>
                                </Select>
                                <p v-if="errors.last_education" class="text-sm text-red-500">{{ errors.last_education }}</p>
                            </div>
                            <div class="space-y-2">
                                <Label>Asal Sekolah <span class="text-red-500">*</span></Label>
                                <Input v-model="form.school_origin" placeholder="Nama sekolah asal" />
                                <p v-if="errors.school_origin" class="text-sm text-red-500">{{ errors.school_origin }}</p>
                            </div>
                            <div class="space-y-2">
                                <Label>Jurusan Sekolah <span class="text-gray-400">(Opsional)</span></Label>
                                <Input v-model="form.major" placeholder="Contoh: IPA, IPS, TKJ, Akuntansi" />
                                <p class="text-xs text-gray-500">Kosongkan jika tidak ada jurusan</p>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <!-- Dokumen -->
                <Card>
                    <CardHeader>
                        <CardTitle>Dokumen Pendukung</CardTitle>
                        <CardDescription>Upload dokumen yang diperlukan (maks 2MB per file)</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <div class="grid gap-4 sm:grid-cols-2">
                            <div class="space-y-2">
                                <Label>Foto <span class="text-red-500">*</span></Label>
                                <div class="flex items-center gap-2">
                                    <label class="flex cursor-pointer items-center gap-2 rounded-md border border-dashed px-4 py-2 hover:bg-gray-50">
                                        <Upload class="size-4" />
                                        <span class="text-sm">{{ files.photo?.name || 'Pilih file...' }}</span>
                                        <input type="file" class="hidden" accept="image/*" @change="handleFileChange('photo', $event)" />
                                    </label>
                                </div>
                                <p class="text-xs text-gray-500">Foto 4x6 latar merah, maks 1MB</p>
                                <p v-if="errors.photo" class="text-sm text-red-500">{{ errors.photo }}</p>
                            </div>
                            <div class="space-y-2">
                                <Label>KTP <span class="text-red-500">*</span></Label>
                                <div class="flex items-center gap-2">
                                    <label class="flex cursor-pointer items-center gap-2 rounded-md border border-dashed px-4 py-2 hover:bg-gray-50">
                                        <Upload class="size-4" />
                                        <span class="text-sm">{{ files.ktp?.name || 'Pilih file...' }}</span>
                                        <input type="file" class="hidden" accept="image/*,.pdf" @change="handleFileChange('ktp', $event)" />
                                    </label>
                                </div>
                                <p class="text-xs text-gray-500">Maks 2MB (PDF/JPG/PNG)</p>
                                <p v-if="errors.ktp" class="text-sm text-red-500">{{ errors.ktp }}</p>
                            </div>
                            <div class="space-y-2">
                                <Label>Kartu Keluarga <span class="text-red-500">*</span></Label>
                                <div class="flex items-center gap-2">
                                    <label class="flex cursor-pointer items-center gap-2 rounded-md border border-dashed px-4 py-2 hover:bg-gray-50">
                                        <Upload class="size-4" />
                                        <span class="text-sm">{{ files.kk?.name || 'Pilih file...' }}</span>
                                        <input type="file" class="hidden" accept="image/*,.pdf" @change="handleFileChange('kk', $event)" />
                                    </label>
                                </div>
                                <p class="text-xs text-gray-500">Maks 2MB (PDF/JPG/PNG)</p>
                                <p v-if="errors.kk" class="text-sm text-red-500">{{ errors.kk }}</p>
                            </div>
                            <div class="space-y-2">
                                <Label>Ijazah/SKL <span class="text-gray-400">(Opsional)</span></Label>
                                <div class="flex items-center gap-2">
                                    <label class="flex cursor-pointer items-center gap-2 rounded-md border border-dashed px-4 py-2 hover:bg-gray-50">
                                        <Upload class="size-4" />
                                        <span class="text-sm">{{ files.certificate?.name || 'Pilih file...' }}</span>
                                        <input type="file" class="hidden" accept="image/*,.pdf" @change="handleFileChange('certificate', $event)" />
                                    </label>
                                </div>
                                <p class="text-xs text-gray-500">Bisa diupload nanti jika belum lulus</p>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <!-- Data Pendaftaran -->
                <Card>
                    <CardHeader>
                        <CardTitle>Data Pendaftaran</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div class="grid gap-4 sm:grid-cols-2">
                            <div class="space-y-2">
                                <Label>Jenis Pendaftaran <span class="text-red-500">*</span></Label>
                                <Select v-model="form.type_id">
                                    <SelectTrigger class="w-full">
                                        <SelectValue placeholder="Pilih jenis" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem v-for="t in props.types" :key="t.id" :value="String(t.id)">
                                            {{ t.name }}
                                        </SelectItem>
                                    </SelectContent>
                                </Select>
                                <p v-if="errors.type_id" class="text-sm text-red-500">{{ errors.type_id }}</p>
                            </div>
                            <div class="space-y-2">
                                <Label>Jalur Pendaftaran <span class="text-red-500">*</span></Label>
                                <Select v-model="form.path_id">
                                    <SelectTrigger class="w-full">
                                        <SelectValue placeholder="Pilih jalur" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem v-for="pa in props.paths" :key="pa.id" :value="String(pa.id)">
                                            {{ pa.name }}
                                        </SelectItem>
                                    </SelectContent>
                                </Select>
                                <p v-if="errors.path_id" class="text-sm text-red-500">{{ errors.path_id }}</p>
                            </div>
                        </div>
                        <div class="mt-4 grid gap-4 sm:grid-cols-2">
                            <div class="space-y-2">
                                <Label>Pilihan 1 <span class="text-red-500">*</span></Label>
                                <Select v-model="form.program_studi_1">
                                    <SelectTrigger class="w-full">
                                        <SelectValue placeholder="Pilih prodi" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectGroup v-for="fak in props.fakultas" :key="fak.id">
                                            <SelectLabel>{{ fak.name }}</SelectLabel>
                                            <SelectItem v-for="prodi in fak.program_studi" :key="prodi.id" :value="String(prodi.id)">
                                                {{ prodi.jenjang }} - {{ prodi.name }}
                                            </SelectItem>
                                        </SelectGroup>
                                    </SelectContent>
                                </Select>
                                <p v-if="errors.program_studi_1" class="text-sm text-red-500">{{ errors.program_studi_1 }}</p>
                            </div>
                            <div class="space-y-2" v-if="form.program_studi_1">
                                <Label>Pilihan 2 <span class="text-red-500">*</span></Label>
                                <Select v-model="form.program_studi_2">
                                    <SelectTrigger class="w-full">
                                        <SelectValue placeholder="Pilih prodi" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <template v-for="fak in props.fakultas" :key="fak.id">
                                            <SelectGroup v-if="hasAvailableOptions(fak)">
                                                <SelectLabel>{{ fak.name }}</SelectLabel>
                                                <template v-for="prodi in fak.program_studi" :key="prodi.id">
                                                    <SelectItem
                                                        v-if="String(prodi.id) !== form.program_studi_1"
                                                        :value="String(prodi.id)"
                                                    >
                                                        {{ prodi.jenjang }} - {{ prodi.name }}
                                                    </SelectItem>
                                                </template>
                                            </SelectGroup>
                                        </template>
                                    </SelectContent>
                                </Select>
                                <p v-if="errors.program_studi_2" class="text-sm text-red-500">{{ errors.program_studi_2 }}</p>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <!-- Informasi Referral -->
                <Card>
                    <CardHeader>
                        <CardTitle>Informasi Referral</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div class="grid gap-4 sm:grid-cols-2">
                            <div class="space-y-2 sm:col-span-2">
                                <Label>Dari mana calon mahasiswa mengetahui informasi PMB?</Label>
                                <Select v-model="form.referral_source">
                                    <SelectTrigger class="w-full">
                                        <SelectValue placeholder="Pilih sumber informasi" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem v-for="r in referralOptions" :key="r" :value="r">{{ r }}</SelectItem>
                                    </SelectContent>
                                </Select>
                            </div>
                            <div v-if="showReferralDetail" class="space-y-2 sm:col-span-2">
                                <Label>{{ referralDetailLabel }}</Label>
                                <Input
                                    v-model="form.referral_detail"
                                    :placeholder="form.referral_source === 'Dosen/Panitia PMB UNU Kaltim' ? 'Contoh: Dr. Ahmad Fauzi, M.Pd' : 'Contoh: Radio, Iklan Google, dll'"
                                />
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <!-- Status Options (Admin Only) -->
                <Card class="border-amber-200 bg-amber-50/50 dark:border-amber-800 dark:bg-amber-950/30">
                    <CardHeader>
                        <CardTitle class="text-amber-800 dark:text-amber-200">Opsi Status (Khusus Admin)</CardTitle>
                        <CardDescription class="text-amber-700 dark:text-amber-400">Langsung set status tanpa perlu verifikasi manual</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <div class="flex items-center space-x-2">
                            <Checkbox id="set_verified" v-model="form.set_verified" />
                            <Label for="set_verified" class="cursor-pointer">
                                Langsung set status ke <strong>Terverifikasi</strong> (skip verifikasi dokumen)
                            </Label>
                        </div>
                    </CardContent>
                </Card>

                <div class="flex justify-end gap-3">
                    <Button type="button" variant="outline" as-child>
                        <Link href="/admin/students">Batal</Link>
                    </Button>
                    <Button type="submit" :disabled="processing">
                        <Save class="mr-2 size-4" />
                        Daftarkan Mahasiswa
                    </Button>
                </div>
            </form>
        </div>
    </AppLayout>
</template>
