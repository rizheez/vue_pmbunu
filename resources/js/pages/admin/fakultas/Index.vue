<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
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
import type { Fakultas } from '@/types/pmb';
import { Head, router, useForm, usePage } from '@inertiajs/vue3';
import { CheckCircle, Edit, Plus, Trash } from 'lucide-vue-next';
import { computed, ref } from 'vue';

interface FakultasWithCount extends Fakultas {
    program_studi_count: number;
}

interface Props {
    fakultas: FakultasWithCount[];
}

const props = defineProps<Props>();
const page = usePage();
const flash = computed(() => page.props.flash as { success?: string });

const showDialog = ref(false);
const editingFakultas = ref<Fakultas | null>(null);

const form = useForm({
    name: '',
    code: '',
    is_active: true,
});

const openCreate = () => {
    editingFakultas.value = null;
    form.reset();
    form.is_active = true;
    showDialog.value = true;
};

const openEdit = (fak: Fakultas) => {
    editingFakultas.value = fak;
    form.name = fak.name;
    form.code = fak.code;
    form.is_active = fak.is_active;
    showDialog.value = true;
};

const submit = () => {
    if (editingFakultas.value) {
        form.put(`/admin/fakultas/${editingFakultas.value.id}`, {
            onSuccess: () => (showDialog.value = false),
        });
    } else {
        form.post('/admin/fakultas', {
            onSuccess: () => (showDialog.value = false),
        });
    }
};

const deleteFakultas = (id: number) => {
    if (confirm('Hapus fakultas ini?')) {
        router.delete(`/admin/fakultas/${id}`);
    }
};

const breadcrumbs = [
    { title: 'Admin Dashboard', href: '/admin/dashboard' },
    { title: 'Fakultas', href: '/admin/fakultas' },
];
</script>

<template>
    <Head title="Fakultas" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Alert v-if="flash?.success" class="border-green-500 bg-green-50">
                <CheckCircle class="size-4 text-green-600" />
                <AlertTitle class="text-green-800">Berhasil</AlertTitle>
                <AlertDescription class="text-green-700">{{ flash.success }}</AlertDescription>
            </Alert>

            <Card>
                <CardHeader class="flex flex-row items-center justify-between">
                    <CardTitle>Manajemen Fakultas</CardTitle>
                    <Button @click="openCreate">
                        <Plus class="mr-2 size-4" />
                        Tambah Fakultas
                    </Button>
                </CardHeader>
                <CardContent>
                    <div class="overflow-x-auto rounded-lg border">
                        <table class="w-full text-sm">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-4 py-3 text-left">Kode</th>
                                    <th class="px-4 py-3 text-left">Nama</th>
                                    <th class="px-4 py-3 text-left">Jumlah Prodi</th>
                                    <th class="px-4 py-3 text-left">Status</th>
                                    <th class="px-4 py-3 text-left">Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y">
                                <tr v-for="fak in props.fakultas" :key="fak.id" class="hover:bg-gray-50">
                                    <td class="px-4 py-3 font-mono">{{ fak.code }}</td>
                                    <td class="px-4 py-3 font-medium">{{ fak.name }}</td>
                                    <td class="px-4 py-3">{{ fak.program_studi_count }}</td>
                                    <td class="px-4 py-3">
                                        <Badge :variant="fak.is_active ? 'default' : 'secondary'">
                                            {{ fak.is_active ? 'Aktif' : 'Nonaktif' }}
                                        </Badge>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="flex gap-2">
                                            <Button size="sm" variant="ghost" @click="openEdit(fak)">
                                                <Edit class="size-4" />
                                            </Button>
                                            <Button size="sm" variant="ghost" @click="deleteFakultas(fak.id)">
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
                    <DialogTitle>{{ editingFakultas ? 'Edit Fakultas' : 'Tambah Fakultas' }}</DialogTitle>
                </DialogHeader>
                <form @submit.prevent="submit" class="space-y-4">
                    <div class="space-y-2">
                        <Label>Kode Fakultas</Label>
                        <Input v-model="form.code" placeholder="FT" />
                    </div>
                    <div class="space-y-2">
                        <Label>Nama Fakultas</Label>
                        <Input v-model="form.name" placeholder="Fakultas Teknik" />
                    </div>
                    <div class="flex items-center gap-2">
                        <input type="checkbox" id="is_active" v-model="form.is_active" />
                        <Label for="is_active">Aktif</Label>
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
