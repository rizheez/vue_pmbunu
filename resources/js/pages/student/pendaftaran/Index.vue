<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { formatDate } from '@/composables/useFormat';
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from '@/components/ui/card';
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
import AppLayout from '@/layouts/AppLayout.vue';
import type {
    Fakultas,
    ProgramStudi,
    Registration,
    RegistrationPath,
    RegistrationPeriod,
    RegistrationType,
} from '@/types/pmb';
import { Head, useForm, usePage } from '@inertiajs/vue3';
import { CheckCircle, AlertCircle, GraduationCap } from 'lucide-vue-next';
import { computed } from 'vue';

interface Props {
    registration: Registration | null;
    activePeriod: RegistrationPeriod;
    registrationTypes: RegistrationType[];
    registrationPaths: RegistrationPath[];
    fakultas: Fakultas[];
    programStudi: ProgramStudi[];
}

const props = defineProps<Props>();
const page = usePage();

const flash = computed(
    () => page.props.flash as { success?: string; error?: string }
);

const form = useForm({
    registration_type_id: props.registration?.registration_type_id ? String(props.registration.registration_type_id) : '',
    registration_path_id: props.registration?.registration_path_id ? String(props.registration.registration_path_id) : '',
    referral_source: props.registration?.referral_source ?? '',
    referral_detail: props.registration?.referral_detail ?? '',
    choice_1: props.registration?.choice_1 ? String(props.registration.choice_1) : '',
    choice_2: props.registration?.choice_2 ? String(props.registration.choice_2) : '',
    choice_3: props.registration?.choice_3 ? String(props.registration.choice_3) : '',
});

const referralSources = [
    'Dosen/Panitia PMB UNU Kaltim',
    'Media Sosial (Instagram/Facebook/Twitter)',
    'Website Resmi UNU Kaltim',
    'Teman/Keluarga',
    'Sekolah/Guru',
    'Brosur/Spanduk',
    'Event/Pameran Pendidikan',
    'Lainnya',
];

const submit = () => {
    form.post('/student/pendaftaran');
};

const isRegistered = computed(() => !!props.registration);

const canEdit = computed(() => {
    if (!props.registration) return true;
    return props.registration.status === 'submitted';
});

const breadcrumbs = [
    { title: 'Dashboard', href: '/student/dashboard' },
    { title: 'Pendaftaran', href: '/student/pendaftaran' },
];
</script>

<template>
    <Head title="Pendaftaran" />

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

            <!-- Period Info -->
            <Alert class="border-blue-500 bg-blue-50">
                <GraduationCap class="size-4 text-blue-600" />
                <AlertTitle class="text-blue-800">
                    {{ props.activePeriod.name }}
                </AlertTitle>
                <AlertDescription class="text-blue-700">
                    Periode: {{ formatDate(props.activePeriod.start_date) }} -
                    {{ formatDate(props.activePeriod.end_date) }}
                </AlertDescription>
            </Alert>

            <!-- Registration Status (if exists) -->
            <Card v-if="isRegistered">
                <CardHeader>
                    <div class="flex items-center justify-between">
                        <CardTitle>Status Pendaftaran</CardTitle>
                        <Badge>{{ props.registration?.status }}</Badge>
                    </div>
                </CardHeader>
                <CardContent class="space-y-4">
                    <div class="grid gap-4 text-sm md:grid-cols-2">
                        <div class="flex justify-between border-b pb-2">
                            <span class="text-gray-500">No. Pendaftaran</span>
                            <span class="font-mono font-medium">
                                {{
                                    props.registration?.registration_number ||
                                    '-'
                                }}
                            </span>
                        </div>
                        <div class="flex justify-between border-b pb-2">
                            <span class="text-gray-500"
                                >Jenis Pendaftaran</span
                            >
                            <span class="font-medium">
                                {{
                                    props.registration?.registration_type
                                        ?.name || '-'
                                }}
                            </span>
                        </div>
                        <div class="flex justify-between border-b pb-2">
                            <span class="text-gray-500">Jalur</span>
                            <span class="font-medium">
                                {{
                                    props.registration?.registration_path
                                        ?.name || '-'
                                }}
                            </span>
                        </div>
                        <div class="flex justify-between border-b pb-2">
                            <span class="text-gray-500">Sumber Informasi</span>
                            <div class="text-right">
                                <span class="block font-medium">
                                    {{ props.registration?.referral_source || '-' }}
                                </span>
                                <span v-if="props.registration?.referral_detail" class="text-xs text-gray-500">
                                    {{ props.registration?.referral_detail }}
                                </span>
                            </div>
                        </div>
                        <div class="flex justify-between border-b pb-2">
                            <span class="text-gray-500">Pilihan 1</span>
                            <span class="font-medium">
                                {{
                                    props.registration?.program_studi_choice1
                                        ?.name || '-'
                                }}
                            </span>
                        </div>
                        <div class="flex justify-between border-b pb-2">
                            <span class="text-gray-500">Pilihan 2</span>
                            <span class="font-medium">
                                {{
                                    props.registration?.program_studi_choice2
                                        ?.name || '-'
                                }}
                            </span>
                        </div>
                        <div
                            v-if="props.registration?.choice_3"
                            class="flex justify-between border-b pb-2"
                        >
                            <span class="text-gray-500">Pilihan 3</span>
                            <span class="font-medium">
                                {{
                                    props.registration?.program_studi_choice3
                                        ?.name || '-'
                                }}
                            </span>
                        </div>
                    </div>
                </CardContent>
            </Card>

            <!-- Registration Form -->
            <Card>
                <CardHeader>
                    <CardTitle>{{
                        isRegistered
                            ? 'Update Pendaftaran'
                            : 'Form Pendaftaran'
                    }}</CardTitle>
                    <CardDescription>
                        Pilih jenis pendaftaran dan program studi yang
                        diinginkan
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <Alert v-if="!canEdit" class="mb-6 border-yellow-500 bg-yellow-50">
                        <AlertCircle class="size-4 text-yellow-600" />
                        <AlertTitle class="text-yellow-800">Form Terkunci</AlertTitle>
                        <AlertDescription class="text-yellow-700">
                            Pendaftaran tidak dapat diubah karena status saat ini adalah <strong>{{ props.registration?.status }}</strong>.
                        </AlertDescription>
                    </Alert>

                    <fieldset :disabled="!canEdit" class="space-y-6">
                    <form @submit.prevent="submit" class="space-y-6">
                        <!-- Registration Type & Path -->
                        <div class="grid gap-4 md:grid-cols-2">
                            <div class="space-y-2">
                                <Label for="registration_type_id"
                                    >Jenis Pendaftaran *</Label
                                >
                                <Select
                                    v-model="form.registration_type_id"
                                >
                                    <SelectTrigger class="w-full">
                                        <SelectValue placeholder="Pilih Jenis" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem
                                            v-for="type in props.registrationTypes"
                                            :key="type.id"
                                            :value="String(type.id)"
                                        >
                                            {{ type.name }}
                                        </SelectItem>
                                    </SelectContent>
                                </Select>
                                <p
                                    v-if="form.errors.registration_type_id"
                                    class="text-sm text-red-500"
                                >
                                    {{ form.errors.registration_type_id }}
                                </p>
                            </div>

                            <div class="space-y-2">
                                <Label for="registration_path_id"
                                    >Jalur Pendaftaran *</Label
                                >
                                <Select
                                    v-model="form.registration_path_id"
                                >
                                    <SelectTrigger class="w-full">
                                        <SelectValue placeholder="Pilih Jalur" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem
                                            v-for="path in props.registrationPaths"
                                            :key="path.id"
                                            :value="String(path.id)"
                                            :disabled="path.name === 'Kelas Karyawan'"
                                        >
                                            {{ path.name }}
                                        </SelectItem>
                                    </SelectContent>
                                </Select>
                                <p class="text-xs text-muted-foreground">
                                    Untuk pendaftaran kelas karyawan, kunjungi <a href="https://edunitas.com/kampus/unu-kaltim/" target="_blank" class="text-blue-600 underline hover:text-blue-800">edunitas.com</a>
                                </p>
                                <p
                                    v-if="form.errors.registration_path_id"
                                    class="text-sm text-red-500"
                                >
                                    {{ form.errors.registration_path_id }}
                                </p>
                            </div>
                        </div>

                        <!-- Referral Source -->
                        <div class="grid gap-4 md:grid-cols-2">
                            <div class="space-y-2">
                                <Label for="referral_source"
                                    >Sumber Informasi</Label
                                >
                                <Select
                                    v-model="form.referral_source"
                                >
                                    <SelectTrigger class="w-full">
                                        <SelectValue placeholder="Pilih Sumber" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem
                                            v-for="src in referralSources"
                                            :key="src"
                                            :value="src"
                                        >
                                            {{ src }}
                                        </SelectItem>
                                    </SelectContent>
                                </Select>
                            </div>

                            <div
                                v-if="
                                    form.referral_source === 'Lainnya' ||
                                    form.referral_source ===
                                        'Dosen/Panitia PMB UNU Kaltim'
                                "
                                class="space-y-2"
                            >
                                <Label for="referral_detail">Detail</Label>
                                <input
                                    id="referral_detail"
                                    v-model="form.referral_detail"
                                    type="text"
                                    class="flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm shadow-xs placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring"
                                    placeholder="Nama referensi"
                                />
                            </div>
                        </div>

                        <!-- Program Studi Choices -->
                        <div class="space-y-4">
                            <h3 class="text-lg font-medium">
                                Pilihan Program Studi
                            </h3>

                            <div class="grid gap-4 md:grid-cols-3">
                                <div class="space-y-2">
                                    <Label for="choice_1">Pilihan 1 *</Label>
                                    <Select v-model="form.choice_1">
                                        <SelectTrigger class="w-full">
                                            <SelectValue placeholder="Pilih Program Studi" />
                                        </SelectTrigger>
                                        <SelectContent>
                                            <SelectGroup
                                                v-for="fak in props.fakultas"
                                                :key="fak.id"
                                            >
                                                <SelectLabel>{{ fak.name }}</SelectLabel>
                                                <SelectItem
                                                    v-for="prodi in fak.program_studi"
                                                    :key="prodi.id"
                                                    :value="String(prodi.id)"
                                                >
                                                    {{ prodi.jenjang }} - {{ prodi.name }}
                                                </SelectItem>
                                            </SelectGroup>
                                        </SelectContent>
                                    </Select>
                                    <p
                                        v-if="form.errors.choice_1"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.choice_1 }}
                                    </p>
                                </div>

                                <div class="space-y-2">
                                    <Label for="choice_2">Pilihan 2 *</Label>
                                    <Select v-model="form.choice_2">
                                        <SelectTrigger class="w-full">
                                            <SelectValue placeholder="Pilih Program Studi" />
                                        </SelectTrigger>
                                        <SelectContent>
                                            <SelectGroup
                                                v-for="fak in props.fakultas"
                                                :key="fak.id"
                                            >
                                                <SelectLabel>{{ fak.name }}</SelectLabel>
                                                <SelectItem
                                                    v-for="prodi in fak.program_studi"
                                                    :key="prodi.id"
                                                    :value="String(prodi.id)"
                                                >
                                                    {{ prodi.jenjang }} - {{ prodi.name }}
                                                </SelectItem>
                                            </SelectGroup>
                                        </SelectContent>
                                    </Select>
                                    <p
                                        v-if="form.errors.choice_2"
                                        class="text-sm text-red-500"
                                    >
                                        {{ form.errors.choice_2 }}
                                    </p>
                                </div>

                            </div>
                        </div>

                        <!-- Submit -->
                        <div class="flex justify-end">
                            <Button
                                type="submit"
                                :disabled="form.processing || !canEdit"
                                class="w-full md:w-auto"
                            >
                                {{
                                    form.processing
                                        ? 'Menyimpan...'
                                        : isRegistered
                                          ? 'Update Pendaftaran'
                                          : 'Kirim Pendaftaran'
                                }}
                            </Button>
                        </div>
                    </form>
                    </fieldset>
                </CardContent>
            </Card>
        </div>
    </AppLayout>
</template>
