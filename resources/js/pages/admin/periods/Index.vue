<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import {
    Card,
    CardContent,
    CardHeader,
    CardTitle,
} from '@/components/ui/card';
import {
    Dialog,
    DialogContent,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from '@/components/ui/dialog';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import AppLayout from '@/layouts/AppLayout.vue';
import type { RegistrationPeriod } from '@/types/pmb';
import { Head, router, useForm, usePage } from '@inertiajs/vue3';
import { CheckCircle, Edit, Plus, Power, Trash } from 'lucide-vue-next';
import { computed, ref } from 'vue';

interface Props {
    periods: RegistrationPeriod[];
}

const props = defineProps<Props>();
const page = usePage();
const flash = computed(() => page.props.flash as { success?: string });

const showDialog = ref(false);
const editingPeriod = ref<RegistrationPeriod | null>(null);

const form = useForm({
    name: '',
    academic_year: '',
    wave_number: 1,
    start_date: '',
    end_date: '',
});

const openCreate = () => {
    editingPeriod.value = null;
    form.reset();
    showDialog.value = true;
};

const openEdit = (period: RegistrationPeriod) => {
    editingPeriod.value = period;
    form.name = period.name;
    form.academic_year = period.academic_year;
    form.wave_number = period.wave_number;
    form.start_date = period.start_date;
    form.end_date = period.end_date;
    showDialog.value = true;
};

const submit = () => {
    if (editingPeriod.value) {
        form.put(`/admin/periods/${editingPeriod.value.id}`, {
            onSuccess: () => (showDialog.value = false),
        });
    } else {
        form.post('/admin/periods', {
            onSuccess: () => (showDialog.value = false),
        });
    }
};

const deletePeriod = (id: number) => {
    if (confirm('Hapus periode ini?')) {
        router.delete(`/admin/periods/${id}`);
    }
};

const activate = (id: number) => {
    router.post(`/admin/periods/${id}/activate`);
};

const breadcrumbs = [
    { title: 'Admin Dashboard', href: '/admin/dashboard' },
    { title: 'Periods', href: '/admin/periods' },
];
</script>

<template>
    <Head title="Periode Pendaftaran" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Alert v-if="flash?.success" class="border-green-500 bg-green-50">
                <CheckCircle class="size-4 text-green-600" />
                <AlertTitle class="text-green-800">Berhasil</AlertTitle>
                <AlertDescription class="text-green-700">{{ flash.success }}</AlertDescription>
            </Alert>

            <Card>
                <CardHeader class="flex flex-row items-center justify-between">
                    <CardTitle>Periode Pendaftaran</CardTitle>
                    <Button @click="openCreate">
                        <Plus class="mr-2 size-4" />
                        Tambah Periode
                    </Button>
                </CardHeader>
                <CardContent>
                    <div class="overflow-x-auto rounded-lg border">
                        <table class="w-full text-sm">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-4 py-3 text-left">Nama</th>
                                    <th class="px-4 py-3 text-left">Tahun Akademik</th>
                                    <th class="px-4 py-3 text-left">Periode</th>
                                    <th class="px-4 py-3 text-left">Status</th>
                                    <th class="px-4 py-3 text-left">Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y">
                                <tr v-for="period in props.periods" :key="period.id" class="hover:bg-gray-50">
                                    <td class="px-4 py-3 font-medium">{{ period.name }}</td>
                                    <td class="px-4 py-3">{{ period.academic_year }}</td>
                                    <td class="px-4 py-3">{{ period.start_date }} - {{ period.end_date }}</td>
                                    <td class="px-4 py-3">
                                        <Badge :variant="period.is_active ? 'default' : 'secondary'">
                                            {{ period.is_active ? 'Aktif' : 'Nonaktif' }}
                                        </Badge>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="flex gap-2">
                                            <Button size="sm" variant="ghost" @click="openEdit(period)">
                                                <Edit class="size-4" />
                                            </Button>
                                            <Button v-if="!period.is_active" size="sm" variant="ghost" @click="activate(period.id)">
                                                <Power class="size-4 text-green-600" />
                                            </Button>
                                            <Button size="sm" variant="ghost" @click="deletePeriod(period.id)">
                                                <Trash class="size-4 text-red-500" />
                                            </Button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </CardContent>
            </Card>
        </div>

        <Dialog v-model:open="showDialog">
            <DialogContent>
                <DialogHeader>
                    <DialogTitle>{{ editingPeriod ? 'Edit Periode' : 'Tambah Periode' }}</DialogTitle>
                </DialogHeader>
                <form @submit.prevent="submit" class="space-y-4">
                    <div class="space-y-2">
                        <Label>Nama Periode</Label>
                        <Input v-model="form.name" placeholder="PMB 2025 Gelombang 1" />
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="space-y-2">
                            <Label>Tahun Akademik</Label>
                            <Input v-model="form.academic_year" placeholder="2025/2026" />
                        </div>
                        <div class="space-y-2">
                            <Label>Gelombang</Label>
                            <Input v-model.number="form.wave_number" type="number" min="1" />
                        </div>
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="space-y-2">
                            <Label>Mulai</Label>
                            <Input v-model="form.start_date" type="date" />
                        </div>
                        <div class="space-y-2">
                            <Label>Selesai</Label>
                            <Input v-model="form.end_date" type="date" />
                        </div>
                    </div>
                    <DialogFooter>
                        <Button type="button" variant="outline" @click="showDialog = false">Batal</Button>
                        <Button type="submit" :disabled="form.processing">Simpan</Button>
                    </DialogFooter>
                </form>
            </DialogContent>
        </Dialog>
    </AppLayout>
</template>
