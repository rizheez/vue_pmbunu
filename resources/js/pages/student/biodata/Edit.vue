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
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import AppLayout from '@/layouts/AppLayout.vue';
import type { RegistrationPeriod, StudentBiodata } from '@/types/pmb';
import { Head, useForm } from '@inertiajs/vue3';
import { Upload } from 'lucide-vue-next';
import { ref } from 'vue';

interface Props {
    biodata: StudentBiodata | null;
    activePeriod: RegistrationPeriod;
}

const props = defineProps<Props>();

const form = useForm({
    name: props.biodata?.name ?? '',
    nik: props.biodata?.nik ?? '',
    nisn: props.biodata?.nisn ?? '',
    phone: props.biodata?.phone ?? '',
    gender: props.biodata?.gender ?? '',
    birth_place: props.biodata?.birth_place ?? '',
    birth_date: props.biodata?.birth_date ?? '',
    religion: props.biodata?.religion ?? '',
    address: props.biodata?.address ?? '',
    last_education: props.biodata?.last_education ?? 'SMA/SMK',
    school_origin: props.biodata?.school_origin ?? '',
    major: props.biodata?.major ?? '',
    photo: null as File | null,
    ktp: null as File | null,
    kk: null as File | null,
    certificate: null as File | null,
});

const photoPreview = ref<string | null>(props.biodata?.photo_url ?? null);
const ktpPreview = ref<string | null>(props.biodata?.ktp_url ?? null);
const kkPreview = ref<string | null>(props.biodata?.kk_url ?? null);
const certificatePreview = ref<string | null>(
    props.biodata?.certificate_url ?? null
);

const handleFileChange = (
    event: Event,
    field: 'photo' | 'ktp' | 'kk' | 'certificate'
) => {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files[0]) {
        const file = input.files[0];
        form[field] = file;

        // Create preview
        const reader = new FileReader();
        reader.onload = (e) => {
            const result = e.target?.result as string;
            if (field === 'photo') photoPreview.value = result;
            else if (field === 'ktp') ktpPreview.value = result;
            else if (field === 'kk') kkPreview.value = result;
            else if (field === 'certificate') certificatePreview.value = result;
        };
        reader.readAsDataURL(file);
    }
};

const religions = [
    'Islam',
    'Kristen',
    'Katolik',
    'Hindu',
    'Buddha',
    'Konghucu',
];

const educations = ['SMA/SMK Sederajat','Paket C', 'D3', 'S1'];

const submit = () => {
    form.post('/student/biodata', {
        forceFormData: true,
    });
};

const breadcrumbs = [
    { title: 'Dashboard', href: '/student/dashboard' },
    { title: 'Biodata', href: '/student/biodata' },
    { title: 'Edit', href: '/student/biodata/edit' },
];
</script>

<template>
    <Head title="Edit Biodata" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Card>
                <CardHeader>
                    <CardTitle>Edit Biodata</CardTitle>
                    <CardDescription>
                        Lengkapi data diri Anda untuk proses pendaftaran.
                        Periode: {{ props.activePeriod.name }}
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <form @submit.prevent="submit" class="space-y-6">
                        <!-- Personal Info Section -->
                        <div class="space-y-4">
                            <h3 class="text-lg font-medium">Data Pribadi</h3>

                            <div class="grid gap-4 md:grid-cols-2">
                                <div class="space-y-2">
                                    <Label for="name">Nama Lengkap *</Label>
                                    <Input
                                        id="name"
                                        v-model="form.name"
                                        placeholder="Nama lengkap sesuai KTP"
                                    />
                                    <p
                                        v-if="form.errors.name"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.name }}
                                    </p>
                                </div>

                                <div class="space-y-2">
                                    <Label for="nik">NIK *</Label>
                                    <Input
                                        id="nik"
                                        v-model="form.nik"
                                        placeholder="16 digit NIK"
                                        maxlength="16"
                                    />
                                    <p
                                        v-if="form.errors.nik"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.nik }}
                                    </p>
                                </div>

                                <div class="space-y-2">
                                    <Label for="nisn">NISN</Label>
                                    <Input
                                        id="nisn"
                                        v-model="form.nisn"
                                        placeholder="Nomor Induk Siswa Nasional"
                                    />
                                    <p
                                        v-if="form.errors.nisn"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.nisn }}
                                    </p>
                                </div>

                                <div class="space-y-2">
                                    <Label for="phone">No. HP / WhatsApp *</Label>
                                    <Input
                                        id="phone"
                                        v-model="form.phone"
                                        placeholder="08xxxxxxxxxx"
                                    />
                                    <p
                                        v-if="form.errors.phone"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.phone }}
                                    </p>
                                </div>

                                <div class="space-y-2">
                                    <Label>Jenis Kelamin *</Label>
                                    <Select v-model="form.gender">
                                        <SelectTrigger class="w-full">
                                            <SelectValue placeholder="Pilih jenis kelamin" />
                                        </SelectTrigger>
                                        <SelectContent>
                                            <SelectItem value="Laki-laki">Laki-laki</SelectItem>
                                            <SelectItem value="Perempuan">Perempuan</SelectItem>
                                        </SelectContent>
                                    </Select>
                                    <p
                                        v-if="form.errors.gender"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.gender }}
                                    </p>
                                </div>

                                <div class="space-y-2">
                                    <Label for="birth_place">Tempat Lahir *</Label>
                                    <Input
                                        id="birth_place"
                                        v-model="form.birth_place"
                                        placeholder="Kota tempat lahir"
                                    />
                                    <p
                                        v-if="form.errors.birth_place"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.birth_place }}
                                    </p>
                                </div>

                                <div class="space-y-2">
                                    <Label for="birth_date">Tanggal Lahir *</Label>
                                    <Input
                                        id="birth_date"
                                        type="date"
                                        v-model="form.birth_date"
                                    />
                                    <p
                                        v-if="form.errors.birth_date"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.birth_date }}
                                    </p>
                                </div>

                                <div class="space-y-2">
                                    <Label>Agama *</Label>
                                    <Select v-model="form.religion">
                                        <SelectTrigger class="w-full">
                                            <SelectValue placeholder="Pilih agama" />
                                        </SelectTrigger>
                                        <SelectContent>
                                            <SelectItem
                                                v-for="r in religions"
                                                :key="r"
                                                :value="r"
                                            >
                                                {{ r }}
                                            </SelectItem>
                                        </SelectContent>
                                    </Select>
                                    <p
                                        v-if="form.errors.religion"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.religion }}
                                    </p>
                                </div>
                            </div>

                            <div class="space-y-2">
                                <Label for="address">Alamat Lengkap *</Label>
                                <textarea
                                    id="address"
                                    v-model="form.address"
                                    rows="3"
                                    class="flex min-h-[60px] w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm shadow-xs placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring"
                                    placeholder="Alamat lengkap sesuai KTP"
                                ></textarea>
                                <p
                                    v-if="form.errors.address"
                                    class="text-sm text-red-500"
                                >
                                    {{ form.errors.address }}
                                </p>
                            </div>
                        </div>

                        <!-- Education Section -->
                        <div class="space-y-4">
                            <h3 class="text-lg font-medium">Data Pendidikan</h3>

                            <div class="grid gap-4 md:grid-cols-2">
                                <div class="space-y-2">
                                    <Label>Pendidikan Terakhir</Label>
                                    <Select v-model="form.last_education">
                                        <SelectTrigger class="w-full">
                                            <SelectValue placeholder="Pilih pendidikan" />
                                        </SelectTrigger>
                                        <SelectContent>
                                            <SelectItem
                                                v-for="ed in educations"
                                                :key="ed"
                                                :value="ed"
                                            >
                                                {{ ed }}
                                            </SelectItem>
                                        </SelectContent>
                                    </Select>
                                </div>

                                <div class="space-y-2">
                                    <Label for="school_origin">Asal Sekolah *</Label>
                                    <Input
                                        id="school_origin"
                                        v-model="form.school_origin"
                                        placeholder="Nama sekolah asal"
                                    />
                                    <p
                                        v-if="form.errors.school_origin"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.school_origin }}
                                    </p>
                                </div>

                                <div class="space-y-2">
                                    <Label for="major">Jurusan</Label>
                                    <Input
                                        id="major"
                                        v-model="form.major"
                                        placeholder="Jurusan di sekolah"
                                    />
                                </div>
                            </div>
                        </div>

                        <!-- Documents Section -->
                        <div class="space-y-4">
                            <h3 class="text-lg font-medium">Upload Dokumen</h3>

                            <div class="grid gap-6 md:grid-cols-2">
                                <!-- Photo -->
                                <div class="space-y-2">
                                    <Label>Pas Foto *</Label>
                                    <div
                                        class="flex items-center gap-4 rounded-lg border border-dashed p-4"
                                    >
                                        <div
                                            v-if="photoPreview"
                                            class="size-24 overflow-hidden rounded-lg bg-gray-100"
                                        >
                                            <img
                                                :src="photoPreview"
                                                class="size-full object-cover"
                                            />
                                        </div>
                                        <div class="flex-1">
                                            <label
                                                class="flex cursor-pointer flex-col items-center gap-2 text-sm text-gray-500"
                                            >
                                                <Upload class="size-8" />
                                                <span>Klik untuk upload</span>
                                                <span class="text-xs"
                                                    >Max 1MB, format JPG/PNG</span
                                                >
                                                <input
                                                    type="file"
                                                    accept="image/*"
                                                    class="hidden"
                                                    @change="
                                                        handleFileChange(
                                                            $event,
                                                            'photo'
                                                        )
                                                    "
                                                />
                                            </label>
                                        </div>
                                    </div>
                                    <p
                                        v-if="form.errors.photo"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.photo }}
                                    </p>
                                </div>

                                <!-- KTP -->
                                <div class="space-y-2">
                                    <Label>KTP *</Label>
                                    <div
                                        class="flex items-center gap-4 rounded-lg border border-dashed p-4"
                                    >
                                        <div
                                            v-if="ktpPreview"
                                            class="size-24 overflow-hidden rounded-lg bg-gray-100"
                                        >
                                            <img
                                                :src="ktpPreview"
                                                class="size-full object-cover"
                                            />
                                        </div>
                                        <div class="flex-1">
                                            <label
                                                class="flex cursor-pointer flex-col items-center gap-2 text-sm text-gray-500"
                                            >
                                                <Upload class="size-8" />
                                                <span>Klik untuk upload</span>
                                                <span class="text-xs"
                                                    >Max 2MB, format
                                                    JPG/PNG/PDF</span
                                                >
                                                <input
                                                    type="file"
                                                    accept=".pdf,.jpg,.jpeg,.png"
                                                    class="hidden"
                                                    @change="
                                                        handleFileChange(
                                                            $event,
                                                            'ktp'
                                                        )
                                                    "
                                                />
                                            </label>
                                        </div>
                                    </div>
                                    <p
                                        v-if="form.errors.ktp"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.ktp }}
                                    </p>
                                </div>

                                <!-- KK -->
                                <div class="space-y-2">
                                    <Label>Kartu Keluarga *</Label>
                                    <div
                                        class="flex items-center gap-4 rounded-lg border border-dashed p-4"
                                    >
                                        <div
                                            v-if="kkPreview"
                                            class="size-24 overflow-hidden rounded-lg bg-gray-100"
                                        >
                                            <img
                                                :src="kkPreview"
                                                class="size-full object-cover"
                                            />
                                        </div>
                                        <div class="flex-1">
                                            <label
                                                class="flex cursor-pointer flex-col items-center gap-2 text-sm text-gray-500"
                                            >
                                                <Upload class="size-8" />
                                                <span>Klik untuk upload</span>
                                                <span class="text-xs"
                                                    >Max 2MB, format
                                                    JPG/PNG/PDF</span
                                                >
                                                <input
                                                    type="file"
                                                    accept=".pdf,.jpg,.jpeg,.png"
                                                    class="hidden"
                                                    @change="
                                                        handleFileChange(
                                                            $event,
                                                            'kk'
                                                        )
                                                    "
                                                />
                                            </label>
                                        </div>
                                    </div>
                                    <p
                                        v-if="form.errors.kk"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.kk }}
                                    </p>
                                </div>

                                <!-- Certificate -->
                                <div class="space-y-2">
                                    <Label>Ijazah (Opsional)</Label>
                                    <div
                                        class="flex items-center gap-4 rounded-lg border border-dashed p-4"
                                    >
                                        <div
                                            v-if="certificatePreview"
                                            class="size-24 overflow-hidden rounded-lg bg-gray-100"
                                        >
                                            <img
                                                :src="certificatePreview"
                                                class="size-full object-cover"
                                            />
                                        </div>
                                        <div class="flex-1">
                                            <label
                                                class="flex cursor-pointer flex-col items-center gap-2 text-sm text-gray-500"
                                            >
                                                <Upload class="size-8" />
                                                <span>Klik untuk upload</span>
                                                <span class="text-xs"
                                                    >Max 2MB, format
                                                    JPG/PNG/PDF</span
                                                >
                                                <input
                                                    type="file"
                                                    accept=".pdf,.jpg,.jpeg,.png"
                                                    class="hidden"
                                                    @change="
                                                        handleFileChange(
                                                            $event,
                                                            'certificate'
                                                        )
                                                    "
                                                />
                                            </label>
                                        </div>
                                    </div>
                                    <p
                                        v-if="form.errors.certificate"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.certificate }}
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!-- Submit -->
                        <div class="flex justify-end gap-4">
                            <Button
                                type="submit"
                                :disabled="form.processing"
                                class="w-full md:w-auto"
                            >
                                {{ form.processing ? 'Menyimpan...' : 'Simpan Biodata' }}
                            </Button>
                        </div>
                    </form>
                </CardContent>
            </Card>
        </div>
    </AppLayout>
</template>
