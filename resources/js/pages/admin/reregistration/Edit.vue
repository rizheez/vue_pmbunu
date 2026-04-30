<script setup lang="ts">
import { Button } from '@/components/ui/button';
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from '@/components/ui/card';
import { Checkbox } from '@/components/ui/checkbox';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import AppLayout from '@/layouts/AppLayout.vue';
import type {
    Registration,
    StudentBiodata,
    StudentParent,
    StudentSpecialNeed,
} from '@/types/pmb';
import { Head, useForm } from '@inertiajs/vue3';
import {
    Accessibility,
    ArrowLeft,
    FileText,
    MapPin,
    Plus,
    Save,
    Trash2,
    Users,
} from 'lucide-vue-next';
import { computed, ref, watch } from 'vue';

interface Options {
    residenceTypes: Record<string, string>;
    transportations: Record<string, string>;
    religions: Record<string, string>;
    parentTypes: Record<string, string>;
    educations: Record<string, string>;
    incomes: Record<string, string>;
    specialNeedTypes: Record<string, string>;
}

interface Student {
    id: number;
    hashed_id: string;
    name: string;
    email: string;
}

interface Props {
    student: Student;
    biodata: StudentBiodata | null;
    parents: StudentParent[];
    specialNeeds: StudentSpecialNeed | null;
    registration: Registration;
    options: Options;
}

const props = defineProps<Props>();

const breadcrumbs = [
    { title: 'Dashboard', href: '/admin/dashboard' },
    { title: 'Daftar Ulang Manual', href: '/admin/reregistration' },
    { title: 'Edit', href: '#' },
];

const defaultParent = (): Partial<StudentParent> => ({
    type: '',
    name: '',
    nik: '',
    birth_date: null,
    is_alive: true,
    education: '',
    occupation: '',
    income: '',
    phone: '',
    address: '',
});

const getInitialParents = () => {
    if (props.parents && props.parents.length > 0) {
        return props.parents.map((p) => ({
            type: p.type || '',
            name: p.name || '',
            nik: p.nik || '',
            birth_date: p.birth_date || null,
            is_alive: p.is_alive ?? true,
            education: p.education || '',
            occupation: p.occupation || '',
            income: p.income || '',
            phone: p.phone || '',
            address: p.address || '',
        }));
    }
    return [
        { ...defaultParent(), type: 'ayah' },
        { ...defaultParent(), type: 'ibu' },
    ];
};

const form = useForm({
    npwp: props.biodata?.npwp ?? '',
    dusun: props.biodata?.dusun ?? '',
    rt: props.biodata?.rt ?? '',
    rw: props.biodata?.rw ?? '',
    kelurahan: props.biodata?.kelurahan ?? '',
    kode_pos: props.biodata?.kode_pos ?? '',
    kecamatan: props.biodata?.kecamatan ?? '',
    kabupaten: props.biodata?.kabupaten ?? '',
    provinsi: props.biodata?.provinsi ?? '',
    kps_recipient: props.biodata?.kps_recipient ?? false,
    kps_number: props.biodata?.kps_number ?? '',
    residence_type: props.biodata?.residence_type ?? '',
    transportation: props.biodata?.transportation ?? '',
    parents: getInitialParents(),
    special_need_type: props.specialNeeds?.type ?? 'tidak_ada',
    special_need_description: props.specialNeeds?.description ?? '',
    special_need_assistance: props.specialNeeds?.assistance_needed ?? '',
    color_blind_certificate: null as File | null,
});

const activeTab = ref('alamat');
const isPharmacy = computed(() =>
    (props.registration.accepted_program_studi?.name || '')
        .toLowerCase()
        .includes('farmasi'),
);

const addParent = () => {
    form.parents.push({ ...defaultParent(), type: 'wali' });
};

const removeParent = (index: number) => {
    if (form.parents.length > 1) {
        form.parents.splice(index, 1);
    }
};

const submit = () => {
    form.transform((data) => ({
        ...data,
        _method: 'PUT',
    })).post(`/admin/reregistration/${props.student.hashed_id}`, {
        preserveScroll: true,
        forceFormData: true,
    });
};

const handleColorBlindCertificate = (event: Event) => {
    const input = event.target as HTMLInputElement;
    form.color_blind_certificate = input.files?.[0] ?? null;
};

watch(
    () => form.kps_recipient,
    (newVal) => {
        if (!newVal) form.kps_number = '';
    },
);
</script>

<template>
    <Head :title="`Daftar Ulang - ${student.name}`" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <!-- Back Button -->
            <div>
                <Button
                    variant="ghost"
                    size="sm"
                    @click="$inertia.visit('/admin/reregistration')"
                >
                    <ArrowLeft class="mr-2 size-4" />
                    Kembali
                </Button>
            </div>

            <Card>
                <CardHeader>
                    <CardTitle class="flex items-center gap-2">
                        <Save class="size-5" />
                        Daftar Ulang Manual
                    </CardTitle>
                    <CardDescription>
                        Mahasiswa: <strong>{{ student.name }}</strong> ({{
                            student.email
                        }})
                        <br />
                        <span
                            v-if="registration.accepted_program_studi"
                            class="text-primary"
                        >
                            Diterima di:
                            {{ registration.accepted_program_studi.jenjang }}
                            {{ registration.accepted_program_studi.name }}
                        </span>
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <form @submit.prevent="submit" class="space-y-6">
                        <Tabs v-model="activeTab" class="w-full">
                            <TabsList
                                :class="[
                                    'grid w-full',
                                    isPharmacy ? 'grid-cols-4' : 'grid-cols-3',
                                ]"
                            >
                                <TabsTrigger
                                    value="alamat"
                                    class="flex cursor-pointer items-center gap-2"
                                >
                                    <MapPin class="size-4" />
                                    <span class="hidden sm:inline">Alamat</span>
                                </TabsTrigger>
                                <TabsTrigger
                                    value="orang_tua"
                                    class="flex cursor-pointer items-center gap-2"
                                >
                                    <Users class="size-4" />
                                    <span class="hidden sm:inline"
                                        >Orang Tua</span
                                    >
                                </TabsTrigger>
                                <TabsTrigger
                                    v-if="isPharmacy"
                                    value="dokumen"
                                    class="flex cursor-pointer items-center gap-2"
                                >
                                    <FileText class="size-4" />
                                    <span class="hidden sm:inline"
                                        >Dokumen</span
                                    >
                                </TabsTrigger>
                                <TabsTrigger
                                    value="kebutuhan_khusus"
                                    class="flex cursor-pointer items-center gap-2"
                                >
                                    <Accessibility class="size-4" />
                                    <span class="hidden sm:inline"
                                        >Kebutuhan</span
                                    >
                                </TabsTrigger>
                            </TabsList>

                            <!-- Tab: Alamat -->
                            <TabsContent value="alamat" class="mt-6 space-y-6">
                                <div class="grid gap-4 md:grid-cols-2">
                                    <div class="space-y-2">
                                        <Label for="npwp">NPWP</Label>
                                        <Input
                                            id="npwp"
                                            v-model="form.npwp"
                                            placeholder="Nomor NPWP (opsional)"
                                        />
                                    </div>
                                </div>

                                <div class="border-t pt-4">
                                    <h4 class="mb-4 font-medium">
                                        Detail Alamat
                                    </h4>
                                    <div class="grid gap-4 md:grid-cols-3">
                                        <div class="space-y-2">
                                            <Label for="dusun">Dusun</Label>
                                            <Input
                                                id="dusun"
                                                v-model="form.dusun"
                                                placeholder="Nama dusun"
                                            />
                                        </div>
                                        <div class="space-y-2">
                                            <Label for="rt">RT</Label>
                                            <Input
                                                id="rt"
                                                v-model="form.rt"
                                                placeholder="RT"
                                                maxlength="5"
                                            />
                                        </div>
                                        <div class="space-y-2">
                                            <Label for="rw">RW</Label>
                                            <Input
                                                id="rw"
                                                v-model="form.rw"
                                                placeholder="RW"
                                                maxlength="5"
                                            />
                                        </div>
                                        <div class="space-y-2">
                                            <Label for="kelurahan"
                                                >Kelurahan/Desa *</Label
                                            >
                                            <Input
                                                id="kelurahan"
                                                v-model="form.kelurahan"
                                                placeholder="Kelurahan atau desa"
                                            />
                                            <p
                                                v-if="form.errors.kelurahan"
                                                class="text-sm text-red-500"
                                            >
                                                {{ form.errors.kelurahan }}
                                            </p>
                                        </div>
                                        <div class="space-y-2">
                                            <Label for="kecamatan"
                                                >Kecamatan *</Label
                                            >
                                            <Input
                                                id="kecamatan"
                                                v-model="form.kecamatan"
                                                placeholder="Kecamatan"
                                            />
                                            <p
                                                v-if="form.errors.kecamatan"
                                                class="text-sm text-red-500"
                                            >
                                                {{ form.errors.kecamatan }}
                                            </p>
                                        </div>
                                        <div class="space-y-2">
                                            <Label for="kode_pos"
                                                >Kode Pos</Label
                                            >
                                            <Input
                                                id="kode_pos"
                                                v-model="form.kode_pos"
                                                placeholder="Kode pos"
                                                maxlength="10"
                                            />
                                        </div>
                                        <div class="space-y-2">
                                            <Label for="kabupaten"
                                                >Kabupaten/Kota *</Label
                                            >
                                            <Input
                                                id="kabupaten"
                                                v-model="form.kabupaten"
                                                placeholder="Kabupaten atau kota"
                                            />
                                            <p
                                                v-if="form.errors.kabupaten"
                                                class="text-sm text-red-500"
                                            >
                                                {{ form.errors.kabupaten }}
                                            </p>
                                        </div>
                                        <div class="space-y-2">
                                            <Label for="provinsi"
                                                >Provinsi *</Label
                                            >
                                            <Input
                                                id="provinsi"
                                                v-model="form.provinsi"
                                                placeholder="Provinsi"
                                            />
                                            <p
                                                v-if="form.errors.provinsi"
                                                class="text-sm text-red-500"
                                            >
                                                {{ form.errors.provinsi }}
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="border-t pt-4">
                                    <h4 class="mb-4 font-medium">
                                        Info Tambahan
                                    </h4>
                                    <div class="grid gap-4 md:grid-cols-2">
                                        <div class="space-y-2">
                                            <Label>Jenis Tinggal *</Label>
                                            <Select
                                                v-model="form.residence_type"
                                            >
                                                <SelectTrigger class="w-full">
                                                    <SelectValue
                                                        placeholder="Pilih jenis tinggal"
                                                    />
                                                </SelectTrigger>
                                                <SelectContent>
                                                    <SelectItem
                                                        v-for="(
                                                            label, key
                                                        ) in options.residenceTypes"
                                                        :key="key"
                                                        :value="key"
                                                    >
                                                        {{ label }}
                                                    </SelectItem>
                                                </SelectContent>
                                            </Select>
                                            <p
                                                v-if="
                                                    form.errors.residence_type
                                                "
                                                class="text-sm text-red-500"
                                            >
                                                {{ form.errors.residence_type }}
                                            </p>
                                        </div>
                                        <div class="space-y-2">
                                            <Label>Alat Transportasi *</Label>
                                            <Select
                                                v-model="form.transportation"
                                            >
                                                <SelectTrigger class="w-full">
                                                    <SelectValue
                                                        placeholder="Pilih alat transportasi"
                                                    />
                                                </SelectTrigger>
                                                <SelectContent>
                                                    <SelectItem
                                                        v-for="(
                                                            label, key
                                                        ) in options.transportations"
                                                        :key="key"
                                                        :value="key"
                                                    >
                                                        {{ label }}
                                                    </SelectItem>
                                                </SelectContent>
                                            </Select>
                                            <p
                                                v-if="
                                                    form.errors.transportation
                                                "
                                                class="text-sm text-red-500"
                                            >
                                                {{ form.errors.transportation }}
                                            </p>
                                        </div>
                                        <div class="col-span-full space-y-4">
                                            <div
                                                class="flex items-center space-x-2"
                                            >
                                                <Checkbox
                                                    id="kps_recipient"
                                                    v-model="form.kps_recipient"
                                                />
                                                <Label
                                                    for="kps_recipient"
                                                    class="cursor-pointer"
                                                    >Penerima KPS</Label
                                                >
                                            </div>
                                            <div
                                                v-if="form.kps_recipient"
                                                class="space-y-2"
                                            >
                                                <Label for="kps_number"
                                                    >Nomor Kartu KPS *</Label
                                                >
                                                <Input
                                                    id="kps_number"
                                                    v-model="form.kps_number"
                                                    placeholder="Masukkan nomor kartu"
                                                    class="max-w-md"
                                                />
                                                <p
                                                    v-if="
                                                        form.errors.kps_number
                                                    "
                                                    class="text-sm text-red-500"
                                                >
                                                    {{ form.errors.kps_number }}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </TabsContent>

                            <!-- Tab: Orang Tua -->
                            <TabsContent
                                value="orang_tua"
                                class="mt-6 space-y-6"
                            >
                                <div
                                    v-for="(parent, index) in form.parents"
                                    :key="index"
                                    class="rounded-lg border p-4"
                                >
                                    <div
                                        class="mb-4 flex items-center justify-between"
                                    >
                                        <h4 class="font-medium capitalize">
                                            {{
                                                options.parentTypes[
                                                    parent.type
                                                ] || 'Orang Tua/Wali'
                                            }}
                                        </h4>
                                        <Button
                                            v-if="parent.type === 'wali'"
                                            type="button"
                                            variant="ghost"
                                            size="sm"
                                            @click="removeParent(index)"
                                            class="text-red-500 hover:text-red-700"
                                        >
                                            <Trash2 class="size-4" />
                                        </Button>
                                    </div>

                                    <div
                                        class="grid gap-4 md:grid-cols-2 lg:grid-cols-3"
                                    >
                                        <div class="space-y-2">
                                            <Label>Hubungan *</Label>
                                            <Select
                                                v-model="parent.type"
                                                :disabled="
                                                    parent.type !== 'wali'
                                                "
                                            >
                                                <SelectTrigger class="w-full">
                                                    <SelectValue
                                                        placeholder="Pilih"
                                                    />
                                                </SelectTrigger>
                                                <SelectContent>
                                                    <SelectItem value="ayah"
                                                        >Ayah</SelectItem
                                                    >
                                                    <SelectItem value="ibu"
                                                        >Ibu</SelectItem
                                                    >
                                                    <SelectItem value="wali"
                                                        >Wali</SelectItem
                                                    >
                                                </SelectContent>
                                            </Select>
                                        </div>
                                        <div class="space-y-2">
                                            <Label>Nama Lengkap *</Label>
                                            <Input
                                                v-model="parent.name"
                                                placeholder="Nama lengkap"
                                            />
                                        </div>
                                        <div class="space-y-2">
                                            <Label>NIK</Label>
                                            <Input
                                                v-model="parent.nik"
                                                placeholder="NIK"
                                                maxlength="16"
                                            />
                                        </div>
                                        <div class="space-y-2">
                                            <Label>Tanggal Lahir</Label>
                                            <Input
                                                v-model="parent.birth_date"
                                                type="date"
                                            />
                                        </div>
                                        <div class="space-y-2">
                                            <Label>Pendidikan</Label>
                                            <Select v-model="parent.education">
                                                <SelectTrigger class="w-full">
                                                    <SelectValue
                                                        placeholder="Pilih pendidikan"
                                                    />
                                                </SelectTrigger>
                                                <SelectContent>
                                                    <SelectItem
                                                        v-for="(
                                                            label, key
                                                        ) in options.educations"
                                                        :key="key"
                                                        :value="key"
                                                    >
                                                        {{ label }}
                                                    </SelectItem>
                                                </SelectContent>
                                            </Select>
                                        </div>
                                        <div class="space-y-2">
                                            <Label>Pekerjaan</Label>
                                            <Input
                                                v-model="parent.occupation"
                                                placeholder="Pekerjaan"
                                            />
                                        </div>
                                        <div class="space-y-2">
                                            <Label>Penghasilan</Label>
                                            <Select v-model="parent.income">
                                                <SelectTrigger class="w-full">
                                                    <SelectValue
                                                        placeholder="Pilih penghasilan"
                                                    />
                                                </SelectTrigger>
                                                <SelectContent>
                                                    <SelectItem
                                                        v-for="(
                                                            label, key
                                                        ) in options.incomes"
                                                        :key="key"
                                                        :value="key"
                                                    >
                                                        {{ label }}
                                                    </SelectItem>
                                                </SelectContent>
                                            </Select>
                                        </div>
                                        <div class="space-y-2">
                                            <Label>No. HP</Label>
                                            <Input
                                                v-model="parent.phone"
                                                placeholder="No. HP"
                                            />
                                        </div>
                                        <div
                                            class="flex items-center space-x-2 pt-6"
                                        >
                                            <Checkbox
                                                :id="`is_alive_${index}`"
                                                v-model="parent.is_alive"
                                            />
                                            <Label
                                                :for="`is_alive_${index}`"
                                                class="cursor-pointer"
                                                >Masih Hidup</Label
                                            >
                                        </div>
                                    </div>
                                </div>

                                <Button
                                    type="button"
                                    variant="outline"
                                    @click="addParent"
                                >
                                    <Plus class="mr-2 size-4" />
                                    Tambah Wali
                                </Button>
                                <p
                                    v-if="form.errors.parents"
                                    class="text-sm text-red-500"
                                >
                                    {{ form.errors.parents }}
                                </p>
                            </TabsContent>

                            <!-- Tab: Dokumen Farmasi -->
                            <TabsContent
                                v-if="isPharmacy"
                                value="dokumen"
                                class="mt-6 space-y-6"
                            >
                                <div class="rounded-lg border p-4">
                                    <div class="space-y-2">
                                        <Label for="color_blind_certificate">
                                            Surat Keterangan Bebas Buta Warna *
                                        </Label>
                                        <Input
                                            id="color_blind_certificate"
                                            type="file"
                                            accept=".pdf,.jpg,.jpeg,.png"
                                            @change="
                                                handleColorBlindCertificate
                                            "
                                        />
                                        <p class="text-sm text-muted-foreground">
                                            Wajib untuk Program Studi Farmasi.
                                            Format PDF/JPG/PNG, maksimal 2 MB.
                                        </p>
                                        <p
                                            v-if="
                                                biodata
                                                    ?.color_blind_certificate_url
                                            "
                                            class="text-sm text-emerald-600"
                                        >
                                            Dokumen sebelumnya sudah terupload.
                                            <a
                                                :href="
                                                    biodata
                                                        .color_blind_certificate_url
                                                "
                                                target="_blank"
                                                class="font-medium underline"
                                            >
                                                Lihat dokumen
                                            </a>
                                            atau upload file baru jika ingin
                                            mengganti.
                                        </p>
                                        <p
                                            v-if="
                                                form.errors
                                                    .color_blind_certificate
                                            "
                                            class="text-sm text-red-500"
                                        >
                                            {{
                                                form.errors
                                                    .color_blind_certificate
                                            }}
                                        </p>
                                    </div>
                                </div>
                            </TabsContent>

                            <!-- Tab: Kebutuhan Khusus -->
                            <TabsContent
                                value="kebutuhan_khusus"
                                class="mt-6 space-y-6"
                            >
                                <div class="space-y-4">
                                    <div class="space-y-2">
                                        <Label>Jenis Kebutuhan Khusus *</Label>
                                        <Select
                                            v-model="form.special_need_type"
                                        >
                                            <SelectTrigger
                                                class="w-full max-w-md"
                                            >
                                                <SelectValue
                                                    placeholder="Pilih jenis"
                                                />
                                            </SelectTrigger>
                                            <SelectContent>
                                                <SelectItem
                                                    v-for="(
                                                        label, key
                                                    ) in options.specialNeedTypes"
                                                    :key="key"
                                                    :value="key"
                                                >
                                                    {{ label }}
                                                </SelectItem>
                                            </SelectContent>
                                        </Select>
                                    </div>
                                    <div
                                        v-if="
                                            form.special_need_type &&
                                            form.special_need_type !==
                                                'tidak_ada'
                                        "
                                        class="space-y-4"
                                    >
                                        <div class="space-y-2">
                                            <Label
                                                for="special_need_description"
                                                >Deskripsi</Label
                                            >
                                            <textarea
                                                id="special_need_description"
                                                v-model="
                                                    form.special_need_description
                                                "
                                                class="flex min-h-[80px] w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                                                placeholder="Jelaskan kebutuhan khusus"
                                            ></textarea>
                                        </div>
                                        <div class="space-y-2">
                                            <Label for="special_need_assistance"
                                                >Bantuan yang Dibutuhkan</Label
                                            >
                                            <textarea
                                                id="special_need_assistance"
                                                v-model="
                                                    form.special_need_assistance
                                                "
                                                class="flex min-h-[80px] w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                                                placeholder="Bantuan yang mungkin diperlukan"
                                            ></textarea>
                                        </div>
                                    </div>
                                </div>
                            </TabsContent>

                        </Tabs>

                        <!-- Submit Section -->
                        <div class="border-t pt-6">
                            <p class="mb-4 text-sm text-muted-foreground">
                                Menyimpan data akan memfinalisasi daftar ulang
                                dan mengubah status menjadi "Daftar Ulang
                                Terverifikasi" agar siap generate NIM.
                            </p>
                            <div class="flex gap-4">
                                <Button
                                    type="submit"
                                    :disabled="form.processing"
                                >
                                    <Save class="mr-2 size-4" />
                                    Simpan Data
                                </Button>
                                <Button
                                    type="button"
                                    variant="outline"
                                    @click="
                                        $inertia.visit('/admin/reregistration')
                                    "
                                >
                                    Batal
                                </Button>
                            </div>
                        </div>
                    </form>
                </CardContent>
            </Card>
        </div>
    </AppLayout>
</template>
