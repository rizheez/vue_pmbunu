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
import { formatDate } from '@/composables/useFormat';
import AppLayout from '@/layouts/AppLayout.vue';
import type {
    RegistrationPeriod,
    StudentBiodata,
    StudentParent,
    StudentSpecialNeed,
} from '@/types/pmb';
import { Head, router, useForm } from '@inertiajs/vue3';
import {
    Accessibility,
    MapPin,
    Plus,
    Save,
    Trash2,
    UserRound,
    Users,
} from 'lucide-vue-next';
import { ref, watch } from 'vue';

interface Options {
    residenceTypes: Record<string, string>;
    transportations: Record<string, string>;
    religions: Record<string, string>;
    parentTypes: Record<string, string>;
    educations: Record<string, string>;
    incomes: Record<string, string>;
    specialNeedTypes: Record<string, string>;
}

interface Payment {
    id: number;
    user_id: number;
    amount: number;
    payment_proof_path: string | null;
    payment_proof_url: string | null;
    status: 'pending' | 'verified' | 'rejected';
    notes: string | null;
    verified_at: string | null;
}

interface Props {
    biodata: StudentBiodata & { reregistration_status?: string };
    parents: StudentParent[];
    specialNeeds: StudentSpecialNeed | null;
    activePeriod: RegistrationPeriod;
    options: Options;
    payment: Payment | null;
    paymentAmount: number;
}

const props = defineProps<Props>();

// Initialize parents data
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
    // Default: ayah dan ibu
    return [
        { ...defaultParent(), type: 'ayah' },
        { ...defaultParent(), type: 'ibu' },
    ];
};

const form = useForm({
    // Address & Contact
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

    // Parents
    parents: getInitialParents(),

    // Special needs
    special_need_type: props.specialNeeds?.type ?? 'tidak_ada',
    special_need_description: props.specialNeeds?.description ?? '',
    special_need_assistance: props.specialNeeds?.assistance_needed ?? '',
});

const activeTab = ref('alamat');

const addParent = () => {
    form.parents.push({ ...defaultParent(), type: 'wali' });
};

const removeParent = (index: number) => {
    if (form.parents.length > 1) {
        form.parents.splice(index, 1);
    }
};

const submit = () => {
    form.post('/student/reregistration', {
        preserveScroll: true,
        onSuccess: () => {
            // Redirect to payment page after successful form submission
            router.visit('/student/reregistration/payment', { preserveScroll: true });
        },
    });
};

const breadcrumbs = [
    { title: 'Dashboard', href: '/student/dashboard' },
    { title: 'Daftar Ulang', href: '/student/reregistration' },
];

// Watch KPS recipient to clear number if unchecked
watch(
    () => form.kps_recipient,
    (newVal) => {
        if (!newVal) {
            form.kps_number = '';
        }
    },
);
</script>

<template>
    <Head title="Daftar Ulang" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Card>
                <CardHeader>
                    <CardTitle class="flex items-center gap-2">
                        <Save class="size-5" />
                        Form Daftar Ulang
                    </CardTitle>
                    <CardDescription>
                        Lengkapi data diri untuk proses daftar ulang.
                        <br />
                        <span class="font-medium text-primary"
                            >Periode: {{ activePeriod.name }}</span
                        >
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <!-- Basic Info Summary -->
                    <div class="mb-6 rounded-lg bg-muted/50 p-4">
                        <h4 class="mb-2 font-medium">Data Mahasiswa</h4>
                        <div class="grid gap-2 text-sm md:grid-cols-3">
                            <div>
                                <span class="text-muted-foreground">Nama:</span>
                                {{ biodata.name }}
                            </div>
                            <div>
                                <span class="text-muted-foreground">NIK:</span>
                                {{ biodata.nik }}
                            </div>
                            <div>
                                <span class="text-muted-foreground">NISN:</span>
                                {{ biodata.nisn || '-' }}
                            </div>
                            <div>
                                <span class="text-muted-foreground"
                                    >Jenis Kelamin:</span
                                >
                                {{ biodata.gender }}
                            </div>
                            <div>
                                <span class="text-muted-foreground">TTL:</span>
                                {{ biodata.birth_place }},
                                {{
                                    formatDate(biodata.birth_date, {
                                        month: 'long',
                                    })
                                }}
                            </div>
                            <div>
                                <span class="text-muted-foreground"
                                    >Agama:</span
                                >
                                {{ biodata.religion }}
                            </div>
                        </div>
                    </div>

                    <form @submit.prevent="submit" class="space-y-6">
                        <Tabs v-model="activeTab" class="w-full">
                            <TabsList class="grid w-full grid-cols-4">
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
                                    value="wali"
                                    class="flex cursor-pointer items-center gap-2"
                                >
                                    <UserRound class="size-4" />
                                    <span class="hidden sm:inline">Wali</span>
                                </TabsTrigger>
                                <TabsTrigger
                                    value="kebutuhan_khusus"
                                    class="flex cursor-pointer items-center gap-2"
                                >
                                    <Accessibility class="size-4" />
                                    <span class="hidden sm:inline"
                                        >Kebutuhan Khusus</span
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
                                                >
                                                    Penerima KPS
                                                </Label>
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
                                    v-for="(
                                        parent, index
                                    ) in form.parents.filter(
                                        (p) => p.type !== 'wali',
                                    )"
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
                                                ] || 'Orang Tua'
                                            }}
                                        </h4>
                                    </div>

                                    <div
                                        class="grid gap-4 md:grid-cols-2 lg:grid-cols-3"
                                    >
                                        <div class="space-y-2">
                                            <Label>Hubungan *</Label>
                                            <Select
                                                v-model="parent.type"
                                                disabled
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
                                                placeholder="Tanggal lahir"
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
                                            >
                                                Masih Hidup
                                            </Label>
                                        </div>
                                    </div>
                                </div>
                                <p
                                    v-if="form.errors.parents"
                                    class="text-sm text-red-500"
                                >
                                    {{ form.errors.parents }}
                                </p>
                            </TabsContent>

                            <!-- Tab: Wali -->
                            <TabsContent value="wali" class="mt-6 space-y-6">
                                <p class="text-sm text-muted-foreground">
                                    Isi data wali jika Anda tidak tinggal
                                    bersama orang tua atau jika diperlukan.
                                </p>

                                <div
                                    v-for="(
                                        parent, index
                                    ) in form.parents.filter(
                                        (p) => p.type === 'wali',
                                    )"
                                    :key="'wali-' + index"
                                    class="rounded-lg border p-4"
                                >
                                    <div
                                        class="mb-4 flex items-center justify-between"
                                    >
                                        <h4 class="font-medium">Data Wali</h4>
                                        <Button
                                            type="button"
                                            variant="ghost"
                                            size="sm"
                                            @click="
                                                removeParent(
                                                    form.parents.indexOf(
                                                        parent,
                                                    ),
                                                )
                                            "
                                            class="text-red-500 hover:text-red-700"
                                        >
                                            <Trash2 class="size-4" />
                                        </Button>
                                    </div>

                                    <div
                                        class="grid gap-4 md:grid-cols-2 lg:grid-cols-3"
                                    >
                                        <div class="space-y-2">
                                            <Label>Nama Lengkap *</Label>
                                            <Input
                                                v-model="parent.name"
                                                placeholder="Nama lengkap wali"
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
                                                placeholder="Tanggal lahir"
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

                                        <div class="col-span-full space-y-2">
                                            <Label>Alamat</Label>
                                            <textarea
                                                v-model="parent.address"
                                                rows="2"
                                                class="flex min-h-[60px] w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm shadow-xs placeholder:text-muted-foreground focus-visible:ring-1 focus-visible:ring-ring focus-visible:outline-none"
                                                placeholder="Alamat wali"
                                            ></textarea>
                                        </div>
                                    </div>
                                </div>

                                <Button
                                    type="button"
                                    variant="outline"
                                    @click="addParent"
                                    class="w-full"
                                >
                                    <Plus class="mr-2 size-4" />
                                    Tambah Wali
                                </Button>
                            </TabsContent>

                            <!-- Tab: Kebutuhan Khusus -->
                            <TabsContent
                                value="kebutuhan_khusus"
                                class="mt-6 space-y-6"
                            >
                                <p class="text-sm text-muted-foreground">
                                    Jika Anda memiliki kebutuhan khusus, silakan
                                    isi informasi berikut.
                                </p>

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
                                                    placeholder="Pilih jenis kebutuhan khusus"
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
                                        <p
                                            v-if="form.errors.special_need_type"
                                            class="text-sm text-red-500"
                                        >
                                            {{ form.errors.special_need_type }}
                                        </p>
                                    </div>

                                    <div
                                        v-if="
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
                                                rows="3"
                                                class="flex min-h-[60px] w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm shadow-xs placeholder:text-muted-foreground focus-visible:ring-1 focus-visible:ring-ring focus-visible:outline-none"
                                                placeholder="Jelaskan kondisi kebutuhan khusus Anda"
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
                                                rows="3"
                                                class="flex min-h-[60px] w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm shadow-xs placeholder:text-muted-foreground focus-visible:ring-1 focus-visible:ring-ring focus-visible:outline-none"
                                                placeholder="Bantuan apa yang Anda butuhkan selama kuliah?"
                                            ></textarea>
                                        </div>
                                    </div>
                                </div>
                            </TabsContent>
                        </Tabs>

                        <!-- Submit -->
                        <div
                            class="flex justify-end gap-4 border-t pt-6"
                        >
                            <Button
                                type="submit"
                                :disabled="form.processing"
                                class="w-full md:w-auto"
                            >
                                <Save class="mr-2 size-4" />
                                {{
                                    form.processing
                                        ? 'Menyimpan...'
                                        : 'Simpan Data Daftar Ulang'
                                }}
                            </Button>
                        </div>
                    </form>
                </CardContent>
            </Card>
        </div>
    </AppLayout>
</template>
