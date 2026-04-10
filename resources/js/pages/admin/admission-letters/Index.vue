<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from '@/components/ui/card';
import { Input } from '@/components/ui/input';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, Link, router, useForm } from '@inertiajs/vue3';
import { Download, FileCheck, RefreshCw, Search } from 'lucide-vue-next';
import { computed, ref, watch } from 'vue';

const DEFAULT_SUBJECT = 'Pemberitahuan';
const DEFAULT_SIGNATORY = 'Prof. Dr. Ir. Hamdani, S.T., M.Cs., IPM';

interface ProgramStudi {
    id: number;
    jenjang: string | null;
    name: string;
}

interface Registration {
    id: number;
    status?: string;
    accepted_program_studi?: ProgramStudi | null;
}

interface StudentBiodata {
    id: number;
    name: string;
}

interface EligibleStudent {
    id: number;
    name: string;
    email: string;
    nim: string;
    student_biodata?: StudentBiodata | null;
    registration?: Registration | null;
}

interface AdmissionLetter {
    id: number;
    letter_number: string;
    letter_date: string;
    subject: string;
    signatory_name: string;
    download_url: string | null;
    pdf_url: string | null;
    generated_at: string | null;
    sent_at: string | null;
    user: EligibleStudent;
    creator?: {
        id: number;
        name: string;
    } | null;
}

interface PaginatedLetters {
    data: AdmissionLetter[];
    current_page: number;
    last_page: number;
    per_page: number;
    total: number;
    links: Array<{ url: string | null; label: string; active: boolean }>;
}

interface Props {
    eligibleStudents: EligibleStudent[];
    letters: PaginatedLetters;
    filters: {
        search?: string;
        per_page?: string;
    };
}

const props = defineProps<Props>();

const breadcrumbs = [
    { title: 'Dashboard', href: '/admin/dashboard' },
    { title: 'Surat Penerimaan', href: '/admin/admission-letters' },
];

const search = ref(props.filters.search || '');
const perPage = ref(props.letters.per_page || 10);

const toDateInputValue = (date: Date) => {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');

    return `${year}-${month}-${day}`;
};

const today = toDateInputValue(new Date());
const form = useForm({
    user_id: '',
    letter_number: '',
    letter_date: today,
    subject: DEFAULT_SUBJECT,
    signatory_name: DEFAULT_SIGNATORY,
});

const selectedStudent = computed(() =>
    props.eligibleStudents.find(
        (student) => String(student.id) === form.user_id,
    ),
);

const applyFilters = () => {
    router.get(
        '/admin/admission-letters',
        {
            search: search.value || undefined,
            per_page: perPage.value,
        },
        {
            preserveState: true,
            replace: true,
        },
    );
};

watch(perPage, () => {
    applyFilters();
});

const submit = () => {
    form.post('/admin/admission-letters', {
        preserveScroll: true,
        onSuccess: () => {
            form.reset('user_id', 'letter_number');
            form.letter_date = today;
            form.subject = DEFAULT_SUBJECT;
            form.signatory_name = DEFAULT_SIGNATORY;
        },
    });
};

const formatDate = (date: string | null) => {
    if (!date) return '-';

    return new Date(date).toLocaleDateString('id-ID', {
        day: '2-digit',
        month: 'long',
        year: 'numeric',
    });
};

const studentName = (student: EligibleStudent) =>
    student.student_biodata?.name || student.name;

const prodiName = (student: EligibleStudent) => {
    const prodi = student.registration?.accepted_program_studi;

    if (!prodi) return '-';

    return [prodi.jenjang, prodi.name].filter(Boolean).join(' ');
};

const regeneratePdf = (letter: AdmissionLetter) => {
    router.post(
        `/admin/admission-letters/${letter.id}/regenerate`,
        {},
        {
            preserveScroll: true,
        },
    );
};
</script>

<template>
    <Head title="Surat Penerimaan" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Card>
                <CardHeader>
                    <CardTitle class="flex items-center gap-2">
                        <FileCheck class="size-5" />
                        Generate Surat Penerimaan
                    </CardTitle>
                    <CardDescription>
                        Pilih mahasiswa yang sudah punya NIM dan belum dibuatkan
                        surat penerimaan.
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <form
                        class="grid gap-4 md:grid-cols-2"
                        @submit.prevent="submit"
                    >
                        <div class="md:col-span-2">
                            <label class="mb-1 block text-sm font-medium">
                                Calon Mahasiswa
                            </label>
                            <select
                                v-model="form.user_id"
                                class="w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                            >
                                <option value="">Pilih mahasiswa</option>
                                <option
                                    v-for="student in props.eligibleStudents"
                                    :key="student.id"
                                    :value="String(student.id)"
                                >
                                    {{ studentName(student) }} -
                                    {{ student.nim }}
                                </option>
                            </select>
                            <InputError :message="form.errors.user_id" />
                            <p
                                v-if="selectedStudent"
                                class="mt-2 text-sm text-muted-foreground"
                            >
                                Program Studi: {{ prodiName(selectedStudent) }}
                            </p>
                        </div>

                        <div>
                            <label class="mb-1 block text-sm font-medium">
                                Nomor Surat
                            </label>
                            <Input
                                v-model="form.letter_number"
                                placeholder="01.1/418/UNU-KT/02/2026"
                            />
                            <InputError :message="form.errors.letter_number" />
                        </div>

                        <div>
                            <label class="mb-1 block text-sm font-medium">
                                Tanggal Surat
                            </label>
                            <Input v-model="form.letter_date" type="date" />
                            <InputError :message="form.errors.letter_date" />
                        </div>

                        <div>
                            <label class="mb-1 block text-sm font-medium">
                                Perihal
                            </label>
                            <Input v-model="form.subject" />
                            <InputError :message="form.errors.subject" />
                        </div>

                        <div>
                            <label class="mb-1 block text-sm font-medium">
                                Penandatangan
                            </label>
                            <Input v-model="form.signatory_name" />
                            <InputError :message="form.errors.signatory_name" />
                        </div>

                        <div class="md:col-span-2">
                            <Button :disabled="form.processing">
                                Generate PDF
                            </Button>
                        </div>
                    </form>
                </CardContent>
            </Card>

            <Card>
                <CardHeader>
                    <div
                        class="flex flex-col gap-4 md:flex-row md:items-center md:justify-between"
                    >
                        <div>
                            <CardTitle>Daftar Surat Penerimaan</CardTitle>
                            <CardDescription>
                                Total: {{ props.letters.total }} surat
                            </CardDescription>
                        </div>
                    </div>
                </CardHeader>
                <CardContent>
                    <div class="mb-6 flex flex-wrap gap-4">
                        <div class="flex items-center gap-2">
                            <Input
                                v-model="search"
                                placeholder="Cari nomor, nama, atau NIM"
                                class="w-64"
                                @keyup.enter="applyFilters"
                            />
                            <Button
                                size="icon"
                                variant="outline"
                                @click="applyFilters"
                            >
                                <Search class="size-4" />
                            </Button>
                        </div>

                        <select
                            v-model="perPage"
                            class="rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                        >
                            <option :value="10">10 per halaman</option>
                            <option :value="25">25 per halaman</option>
                            <option :value="50">50 per halaman</option>
                            <option :value="100">100 per halaman</option>
                        </select>
                    </div>

                    <div class="overflow-x-auto rounded-lg border">
                        <table class="w-full text-sm">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th
                                        class="min-w-[190px] px-4 py-3 text-left font-medium"
                                    >
                                        Nomor Surat
                                    </th>
                                    <th
                                        class="min-w-[220px] px-4 py-3 text-left font-medium"
                                    >
                                        Mahasiswa
                                    </th>
                                    <th
                                        class="min-w-[190px] px-4 py-3 text-left font-medium"
                                    >
                                        Program Studi
                                    </th>
                                    <th
                                        class="px-4 py-3 text-left font-medium whitespace-nowrap"
                                    >
                                        Tanggal
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Status
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Aksi
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="divide-y">
                                <tr
                                    v-for="letter in props.letters.data"
                                    :key="letter.id"
                                    class="hover:bg-gray-50"
                                >
                                    <td class="px-4 py-3 font-mono text-xs">
                                        {{ letter.letter_number }}
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="font-medium">
                                            {{ studentName(letter.user) }}
                                        </div>
                                        <div
                                            class="text-xs text-muted-foreground"
                                        >
                                            NIM {{ letter.user.nim }}
                                        </div>
                                    </td>
                                    <td class="px-4 py-3">
                                        {{ prodiName(letter.user) }}
                                    </td>
                                    <td class="px-4 py-3">
                                        {{ formatDate(letter.letter_date) }}
                                    </td>
                                    <td class="px-4 py-3">
                                        <Badge
                                            :variant="
                                                letter.sent_at
                                                    ? 'default'
                                                    : 'secondary'
                                            "
                                        >
                                            {{
                                                letter.sent_at
                                                    ? 'Terkirim'
                                                    : 'PDF Dibuat'
                                            }}
                                        </Badge>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="flex gap-2">
                                            <Button
                                                v-if="letter.download_url"
                                                as-child
                                                size="sm"
                                                variant="outline"
                                            >
                                                <a
                                                    :href="letter.download_url"
                                                    target="_blank"
                                                >
                                                    <Download
                                                        class="mr-1 size-4"
                                                    />
                                                    PDF
                                                </a>
                                            </Button>
                                            <Button
                                                size="sm"
                                                variant="ghost"
                                                @click="regeneratePdf(letter)"
                                            >
                                                <RefreshCw
                                                    class="mr-1 size-4"
                                                />
                                                Regenerate
                                            </Button>
                                        </div>
                                    </td>
                                </tr>
                                <tr v-if="props.letters.data.length === 0">
                                    <td
                                        colspan="6"
                                        class="px-4 py-8 text-center text-gray-500"
                                    >
                                        Belum ada surat penerimaan.
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div
                        v-if="props.letters.last_page > 1"
                        class="mt-4 flex items-center justify-between"
                    >
                        <p class="text-sm text-gray-500">
                            Halaman {{ props.letters.current_page }} dari
                            {{ props.letters.last_page }}
                        </p>
                        <div class="flex gap-1">
                            <template
                                v-for="link in props.letters.links"
                                :key="link.label"
                            >
                                <Button
                                    v-if="link.url"
                                    as-child
                                    size="sm"
                                    variant="outline"
                                    :class="{
                                        'bg-primary text-primary-foreground':
                                            link.active,
                                    }"
                                >
                                    <Link :href="link.url">
                                        <span v-html="link.label" />
                                    </Link>
                                </Button>
                            </template>
                        </div>
                    </div>
                </CardContent>
            </Card>
        </div>
    </AppLayout>
</template>
