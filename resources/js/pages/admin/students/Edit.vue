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
import type {
    Fakultas,
    PmbUser,
    RegistrationPath,
    RegistrationPeriod,
    RegistrationType,
} from '@/types/pmb';
import { Head, Link, router } from '@inertiajs/vue3';
import { ArrowLeft, Save, Upload } from 'lucide-vue-next';
import { ref, watch } from 'vue';

interface Props {
    student: PmbUser;
    fakultas: Fakultas[];
    types: RegistrationType[];
    paths: RegistrationPath[];
    periods: RegistrationPeriod[];
}

const props = defineProps<Props>();

const form = ref({
    // Account
    email: props.student.email,
    phone: props.student.phone || '', // User phone
    // Personal (from biodata)
    name: props.student.name, // User name
    nik: props.student.student_biodata?.nik || '',
    nisn: props.student.student_biodata?.nisn || '',
    gender: props.student.student_biodata?.gender || '',
    birth_place: props.student.student_biodata?.birth_place || '',
    birth_date: props.student.student_biodata?.birth_date || '',
    religion: props.student.student_biodata?.religion || '',
    address: props.student.student_biodata?.address || '',
    last_education: props.student.student_biodata?.last_education || '',
    school_origin: props.student.student_biodata?.school_origin || '',
    major: props.student.student_biodata?.major || '',
    // Registration
    period_id: props.student.registration?.registration_period_id
        ? String(props.student.registration.registration_period_id)
        : '',
    type_id: props.student.registration?.registration_type_id
        ? String(props.student.registration.registration_type_id)
        : '',
    path_id: props.student.registration?.registration_path_id
        ? String(props.student.registration.registration_path_id)
        : '',
    program_studi_1: props.student.registration?.choice_1
        ? String(props.student.registration.choice_1)
        : '',
    program_studi_2: props.student.registration?.choice_2
        ? String(props.student.registration.choice_2)
        : '',
    // Referral
    referral_source: props.student.registration?.referral_source || '',
    referral_detail: props.student.registration?.referral_detail || '',
});

// Since user table has phone, and biodata has phone. studentBiodata.phone overrides if needed, or sync?
// Controller update code updates both user.phone and biodata.phone with form.phone.
// We initialized form.phone from props.student.phone (User model).
// Check if student_biodata phone is different? Usually synced.

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

watch(
    () => form.value.referral_source,
    (val) => {
        if (val === 'Dosen/Panitia PMB UNU Kaltim') {
            showReferralDetail.value = true;
            referralDetailLabel.value =
                'Nama Dosen/Panitia PMB (sertakan No. HP)';
        } else if (val === 'Sekolah/Guru') {
            showReferralDetail.value = true;
            referralDetailLabel.value = 'Nama Sekolah/Guru (sertakan No. HP)';
        } else if (val === 'Lainnya') {
            showReferralDetail.value = true;
            referralDetailLabel.value = 'Sebutkan sumber informasi lainnya';
        } else {
            showReferralDetail.value = false;
            // Don't clear detail on edit if it matches current value, but here we are watching changes.
            // If initial value triggers this, we keep detail.
        }
    },
    { immediate: true },
);

const handleFileChange = (
    field: 'photo' | 'ktp' | 'kk' | 'certificate',
    event: Event,
) => {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files[0]) {
        files.value[field] = input.files[0];
    }
};

const submit = () => {
    processing.value = true;
    const formData = new FormData();
    formData.append('_method', 'PUT');

    Object.entries(form.value).forEach(([key, value]) => {
        // Handle null values
        formData.append(key, value === null ? '' : value);
    });

    Object.entries(files.value).forEach(([key, file]) => {
        if (file) {
            formData.append(key, file);
        }
    });

    router.post(`/admin/students/${props.student.hashed_id}`, formData, {
        onError: (errs) => {
            errors.value = errs;
        },
        onFinish: () => {
            processing.value = false;
        },
    });
};

const genderOptions = ['Laki-laki', 'Perempuan'];
const religionOptions = [
    'Islam',
    'Kristen',
    'Katolik',
    'Hindu',
    'Buddha',
    'Konghucu',
];
const educationOptions = ['SMA/SMK Sederajat', 'Paket C', 'D3', 'S1'];
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
    { title: 'Dashboard Admin', href: '/admin/dashboard' },
    { title: 'Calon Mahasiswa', href: '/admin/students' },
    {
        title: 'Edit Mahasiswa',
        href: `/admin/students/${props.student.hashed_id}/edit`,
    },
];
</script>

<template>
    <Head title="Edit Mahasiswa" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <div class="flex items-center justify-between">
                <div class="flex items-center gap-4">
                    <Button variant="ghost" size="sm" as-child>
                        <Link
                            :href="`/admin/students/${props.student.hashed_id}`"
                        >
                            <ArrowLeft class="mr-2 size-4" />
                            Kembali
                        </Link>
                    </Button>
                    <div>
                        <h1 class="text-2xl font-bold">Edit Calon Mahasiswa</h1>
                        <p class="text-sm text-gray-500">
                            Perbarui data calon mahasiswa
                        </p>
                    </div>
                </div>
            </div>

            <form @submit.prevent="submit" class="space-y-6">
                <!-- Data Akun -->
                <Card>
                    <CardHeader>
                        <CardTitle>Data Akun</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div class="grid gap-4 sm:grid-cols-2">
                            <div class="space-y-2">
                                <Label
                                    >Email
                                    <span class="text-red-500">*</span></Label
                                >
                                <Input
                                    v-model="form.email"
                                    type="email"
                                    placeholder="email@example.com"
                                />
                                <p
                                    v-if="errors.email"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.email }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label
                                    >Nomor HP / WhatsApp
                                    <span class="text-red-500">*</span></Label
                                >
                                <Input
                                    v-model="form.phone"
                                    placeholder="08xxxxxxxxxx"
                                />
                                <p
                                    v-if="errors.phone"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.phone }}
                                </p>
                            </div>
                        </div>
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
                                <Label
                                    >Nama Lengkap
                                    <span class="text-red-500">*</span></Label
                                >
                                <Input
                                    v-model="form.name"
                                    placeholder="Nama lengkap sesuai KTP"
                                />
                                <p
                                    v-if="errors.name"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.name }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label
                                    >NIK
                                    <span class="text-red-500">*</span></Label
                                >
                                <Input
                                    v-model="form.nik"
                                    placeholder="16 digit NIK"
                                    maxlength="16"
                                />
                                <p
                                    v-if="errors.nik"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.nik }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label>NISN</Label>
                                <Input
                                    v-model="form.nisn"
                                    placeholder="Nomor Induk Siswa Nasional"
                                />
                                <p
                                    v-if="errors.nisn"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.nisn }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label
                                    >Jenis Kelamin
                                    <span class="text-red-500">*</span></Label
                                >
                                <Select v-model="form.gender">
                                    <SelectTrigger class="w-full">
                                        <SelectValue
                                            placeholder="Pilih jenis kelamin"
                                        />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem
                                            v-for="g in genderOptions"
                                            :key="g"
                                            :value="g"
                                            >{{ g }}</SelectItem
                                        >
                                    </SelectContent>
                                </Select>
                                <p
                                    v-if="errors.gender"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.gender }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label
                                    >Tempat Lahir
                                    <span class="text-red-500">*</span></Label
                                >
                                <Input
                                    v-model="form.birth_place"
                                    placeholder="Kota/Kabupaten"
                                />
                                <p
                                    v-if="errors.birth_place"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.birth_place }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label
                                    >Tanggal Lahir
                                    <span class="text-red-500">*</span></Label
                                >
                                <Input v-model="form.birth_date" type="date" />
                                <p
                                    v-if="errors.birth_date"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.birth_date }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label
                                    >Agama
                                    <span class="text-red-500">*</span></Label
                                >
                                <Select v-model="form.religion">
                                    <SelectTrigger class="w-full">
                                        <SelectValue
                                            placeholder="Pilih agama"
                                        />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem
                                            v-for="r in religionOptions"
                                            :key="r"
                                            :value="r"
                                            >{{ r }}</SelectItem
                                        >
                                    </SelectContent>
                                </Select>
                                <p
                                    v-if="errors.religion"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.religion }}
                                </p>
                            </div>
                            <div class="space-y-2 sm:col-span-2">
                                <Label
                                    >Alamat Lengkap
                                    <span class="text-red-500">*</span></Label
                                >
                                <Textarea
                                    v-model="form.address"
                                    rows="3"
                                    placeholder="Alamat lengkap sesuai KTP"
                                />
                                <p
                                    v-if="errors.address"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.address }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label
                                    >Pendidikan Terakhir
                                    <span class="text-red-500">*</span></Label
                                >
                                <Select v-model="form.last_education">
                                    <SelectTrigger class="w-full">
                                        <SelectValue
                                            placeholder="Pilih pendidikan"
                                        />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem
                                            v-for="e in educationOptions"
                                            :key="e"
                                            :value="e"
                                            >{{ e }}</SelectItem
                                        >
                                    </SelectContent>
                                </Select>
                                <p
                                    v-if="errors.last_education"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.last_education }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label
                                    >Asal Sekolah
                                    <span class="text-red-500">*</span></Label
                                >
                                <Input
                                    v-model="form.school_origin"
                                    placeholder="Nama sekolah asal"
                                />
                                <p
                                    v-if="errors.school_origin"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.school_origin }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label
                                    >Jurusan Sekolah
                                    <span class="text-gray-400"
                                        >(Opsional)</span
                                    ></Label
                                >
                                <Input
                                    v-model="form.major"
                                    placeholder="Contoh: IPA, IPS, TKJ, Akuntansi"
                                />
                                <p class="text-xs text-gray-500">
                                    Kosongkan jika tidak ada jurusan
                                </p>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <!-- Dokumen -->
                <Card>
                    <CardHeader>
                        <CardTitle>Dokumen Pendukung</CardTitle>
                        <CardDescription
                            >Upload ulang jika ingin mengubah file (maks 2MB per
                            file)</CardDescription
                        >
                    </CardHeader>
                    <CardContent>
                        <div class="grid gap-4 sm:grid-cols-2">
                            <div class="space-y-2">
                                <Label>Foto</Label>
                                <div class="flex items-center gap-2">
                                    <label
                                        class="flex cursor-pointer items-center gap-2 rounded-md border border-dashed px-4 py-2 hover:bg-gray-50"
                                    >
                                        <Upload class="size-4" />
                                        <span class="text-sm">{{
                                            files.photo?.name || 'Ganti file...'
                                        }}</span>
                                        <input
                                            type="file"
                                            class="hidden"
                                            accept="image/*"
                                            @change="
                                                handleFileChange(
                                                    'photo',
                                                    $event,
                                                )
                                            "
                                        />
                                    </label>
                                    <span
                                        v-if="
                                            !files.photo &&
                                            props.student.student_biodata
                                                ?.photo_path
                                        "
                                        class="text-xs text-green-600"
                                        >File tersimpan</span
                                    >
                                </div>
                                <p class="text-xs text-gray-500">
                                    Foto 4x6 latar merah, maks 1MB
                                </p>
                                <p
                                    v-if="errors.photo"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.photo }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label>KTP</Label>
                                <div class="flex items-center gap-2">
                                    <label
                                        class="flex cursor-pointer items-center gap-2 rounded-md border border-dashed px-4 py-2 hover:bg-gray-50"
                                    >
                                        <Upload class="size-4" />
                                        <span class="text-sm">{{
                                            files.ktp?.name || 'Ganti file...'
                                        }}</span>
                                        <input
                                            type="file"
                                            class="hidden"
                                            accept="image/*,.pdf"
                                            @change="
                                                handleFileChange('ktp', $event)
                                            "
                                        />
                                    </label>
                                    <span
                                        v-if="
                                            !files.ktp &&
                                            props.student.student_biodata
                                                ?.ktp_path
                                        "
                                        class="text-xs text-green-600"
                                        >File tersimpan</span
                                    >
                                </div>
                                <p class="text-xs text-gray-500">
                                    Maks 2MB (PDF/JPG/PNG)
                                </p>
                                <p
                                    v-if="errors.ktp"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.ktp }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label>Kartu Keluarga</Label>
                                <div class="flex items-center gap-2">
                                    <label
                                        class="flex cursor-pointer items-center gap-2 rounded-md border border-dashed px-4 py-2 hover:bg-gray-50"
                                    >
                                        <Upload class="size-4" />
                                        <span class="text-sm">{{
                                            files.kk?.name || 'Ganti file...'
                                        }}</span>
                                        <input
                                            type="file"
                                            class="hidden"
                                            accept="image/*,.pdf"
                                            @change="
                                                handleFileChange('kk', $event)
                                            "
                                        />
                                    </label>
                                    <span
                                        v-if="
                                            !files.kk &&
                                            props.student.student_biodata
                                                ?.kk_path
                                        "
                                        class="text-xs text-green-600"
                                        >File tersimpan</span
                                    >
                                </div>
                                <p class="text-xs text-gray-500">
                                    Maks 2MB (PDF/JPG/PNG)
                                </p>
                                <p
                                    v-if="errors.kk"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.kk }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label>Ijazah/SKL</Label>
                                <div class="flex items-center gap-2">
                                    <label
                                        class="flex cursor-pointer items-center gap-2 rounded-md border border-dashed px-4 py-2 hover:bg-gray-50"
                                    >
                                        <Upload class="size-4" />
                                        <span class="text-sm">{{
                                            files.certificate?.name ||
                                            'Ganti file...'
                                        }}</span>
                                        <input
                                            type="file"
                                            class="hidden"
                                            accept="image/*,.pdf"
                                            @change="
                                                handleFileChange(
                                                    'certificate',
                                                    $event,
                                                )
                                            "
                                        />
                                    </label>
                                    <span
                                        v-if="
                                            !files.certificate &&
                                            props.student.student_biodata
                                                ?.certificate_path
                                        "
                                        class="text-xs text-green-600"
                                        >File tersimpan</span
                                    >
                                </div>
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
                                <Label
                                    >Periode Pendaftaran
                                    <span class="text-red-500">*</span></Label
                                >
                                <Select v-model="form.period_id">
                                    <SelectTrigger class="w-full">
                                        <SelectValue
                                            placeholder="Pilih periode"
                                        />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem
                                            v-for="p in props.periods"
                                            :key="p.id"
                                            :value="String(p.id)"
                                        >
                                            {{ p.name }}
                                            <template v-if="p.is_active"
                                                >(Aktif)</template
                                            >
                                        </SelectItem>
                                    </SelectContent>
                                </Select>
                                <p
                                    v-if="errors.period_id"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.period_id }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label
                                    >Jenis Pendaftaran
                                    <span class="text-red-500">*</span></Label
                                >
                                <Select v-model="form.type_id">
                                    <SelectTrigger class="w-full">
                                        <SelectValue
                                            placeholder="Pilih jenis"
                                        />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem
                                            v-for="t in props.types"
                                            :key="t.id"
                                            :value="String(t.id)"
                                        >
                                            {{ t.name }}
                                        </SelectItem>
                                    </SelectContent>
                                </Select>
                                <p
                                    v-if="errors.type_id"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.type_id }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label
                                    >Jalur Pendaftaran
                                    <span class="text-red-500">*</span></Label
                                >
                                <Select v-model="form.path_id">
                                    <SelectTrigger class="w-full">
                                        <SelectValue
                                            placeholder="Pilih jalur"
                                        />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem
                                            v-for="pa in props.paths"
                                            :key="pa.id"
                                            :value="String(pa.id)"
                                        >
                                            {{ pa.name }}
                                        </SelectItem>
                                    </SelectContent>
                                </Select>
                                <p
                                    v-if="errors.path_id"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.path_id }}
                                </p>
                            </div>
                        </div>
                        <div class="mt-4 grid gap-4 sm:grid-cols-2">
                            <div class="space-y-2">
                                <Label
                                    >Pilihan 1
                                    <span class="text-red-500">*</span></Label
                                >
                                <Select v-model="form.program_studi_1">
                                    <SelectTrigger class="w-full">
                                        <SelectValue
                                            placeholder="Pilih prodi"
                                        />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectGroup
                                            v-for="fak in props.fakultas"
                                            :key="fak.id"
                                        >
                                            <SelectLabel>{{
                                                fak.name
                                            }}</SelectLabel>
                                            <SelectItem
                                                v-for="prodi in fak.program_studi"
                                                :key="prodi.id"
                                                :value="String(prodi.id)"
                                            >
                                                {{ prodi.jenjang }} -
                                                {{ prodi.name }}
                                            </SelectItem>
                                        </SelectGroup>
                                    </SelectContent>
                                </Select>
                                <p
                                    v-if="errors.program_studi_1"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.program_studi_1 }}
                                </p>
                            </div>
                            <div class="space-y-2">
                                <Label
                                    >Pilihan 2
                                    <span class="text-red-500">*</span></Label
                                >
                                <Select v-model="form.program_studi_2">
                                    <SelectTrigger class="w-full">
                                        <SelectValue
                                            placeholder="Pilih prodi"
                                        />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectGroup
                                            v-for="fak in props.fakultas"
                                            :key="fak.id"
                                        >
                                            <SelectLabel>{{
                                                fak.name
                                            }}</SelectLabel>
                                            <SelectItem
                                                v-for="prodi in fak.program_studi"
                                                :key="prodi.id"
                                                :value="String(prodi.id)"
                                            >
                                                {{ prodi.jenjang }} -
                                                {{ prodi.name }}
                                            </SelectItem>
                                        </SelectGroup>
                                    </SelectContent>
                                </Select>
                                <p
                                    v-if="errors.program_studi_2"
                                    class="text-sm text-red-500"
                                >
                                    {{ errors.program_studi_2 }}
                                </p>
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
                                <Label
                                    >Dari mana calon mahasiswa mengetahui
                                    informasi PMB?</Label
                                >
                                <Select v-model="form.referral_source">
                                    <SelectTrigger class="w-full">
                                        <SelectValue
                                            placeholder="Pilih sumber informasi"
                                        />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem
                                            v-for="r in referralOptions"
                                            :key="r"
                                            :value="r"
                                            >{{ r }}</SelectItem
                                        >
                                    </SelectContent>
                                </Select>
                            </div>
                            <div
                                v-if="showReferralDetail"
                                class="space-y-2 sm:col-span-2"
                            >
                                <Label>{{ referralDetailLabel }}</Label>
                                <Input
                                    v-model="form.referral_detail"
                                    :placeholder="
                                        form.referral_source ===
                                        'Dosen/Panitia PMB UNU Kaltim'
                                            ? 'Dr. Ahmad Zulkifi, M.Pd (081234567890)'
                                            : form.referral_source ===
                                                'Sekolah/Guru'
                                              ? 'Ahmad Galih, S.Pd - SMA Negeri 1 Kaltim (081234567890)'
                                              : 'Sebutkan sumber informasi lainnya'
                                    "
                                />
                                <p class="text-xs text-muted-foreground">
                                    Cantumkan nama lengkap dan nomor telepon
                                    yang dapat dihubungi
                                </p>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <div class="flex justify-end gap-3">
                    <Button type="button" variant="outline" as-child>
                        <Link
                            :href="`/admin/students/${props.student.hashed_id}`"
                            >Batal</Link
                        >
                    </Button>
                    <Button type="submit" :disabled="processing">
                        <Save class="mr-2 size-4" />
                        Simpan Perubahan
                    </Button>
                </div>
            </form>
        </div>
    </AppLayout>
</template>
