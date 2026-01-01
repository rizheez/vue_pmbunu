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
import type { Fakultas, ProgramStudi } from '@/types/pmb';
import { Head, router, useForm, usePage } from '@inertiajs/vue3';
import { CheckCircle, Edit, Plus, Trash } from 'lucide-vue-next';
import { computed, ref } from 'vue';

interface Props {
    programStudi: ProgramStudi[];
    fakultas: Fakultas[];
}

const props = defineProps<Props>();
const page = usePage();
const flash = computed(() => page.props.flash as { success?: string });

const showDialog = ref(false);
const editingProdi = ref<ProgramStudi | null>(null);

const form = useForm({
    name: '',
    code: '',
    nim_code: '',
    jenjang: 'S1',
    fakultas_id: '',
    is_active: true,
});

const openCreate = () => {
    editingProdi.value = null;
    form.reset();
    form.jenjang = 'S1';
    form.is_active = true;
    showDialog.value = true;
};

const openEdit = (prodi: ProgramStudi) => {
    editingProdi.value = prodi;
    form.name = prodi.name;
    form.code = prodi.code;
    form.nim_code = prodi.nim_code || '';
    form.jenjang = prodi.jenjang;
    form.fakultas_id = String(prodi.fakultas_id);
    form.is_active = prodi.is_active;
    showDialog.value = true;
};

const submit = () => {
    if (editingProdi.value) {
        form.put(`/admin/program-studi/${editingProdi.value.id}`, {
            onSuccess: () => (showDialog.value = false),
        });
    } else {
        form.post('/admin/program-studi', {
            onSuccess: () => (showDialog.value = false),
        });
    }
};

const deleteProdi = (id: number) => {
    if (confirm('Hapus program studi ini?')) {
        router.delete(`/admin/program-studi/${id}`);
    }
};

const breadcrumbs = [
    { title: 'Admin Dashboard', href: '/admin/dashboard' },
    { title: 'Program Studi', href: '/admin/program-studi' },
];
</script>

<template>
    <Head title="Program Studi" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Alert v-if="flash?.success" class="border-green-500 bg-green-50">
                <CheckCircle class="size-4 text-green-600" />
                <AlertTitle class="text-green-800">Berhasil</AlertTitle>
                <AlertDescription class="text-green-700">{{ flash.success }}</AlertDescription>
            </Alert>

            <Card>
                <CardHeader class="flex flex-row items-center justify-between">
                    <CardTitle>Manajemen Program Studi</CardTitle>
                    <Button @click="openCreate">
                        <Plus class="mr-2 size-4" />
                        Tambah Prodi
                    </Button>
                </CardHeader>
                <CardContent>
                    <div class="overflow-x-auto rounded-lg border">
                        <table class="w-full text-sm">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-4 py-3 text-left">Kode</th>
                                    <th class="px-4 py-3 text-left">Kode NIM</th>
                                    <th class="px-4 py-3 text-left">Nama</th>
                                    <th class="px-4 py-3 text-left">Jenjang</th>
                                    <th class="px-4 py-3 text-left">Fakultas</th>
                                    <th class="px-4 py-3 text-left">Status</th>
                                    <th class="px-4 py-3 text-left">Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y">
                                <tr v-for="prodi in props.programStudi" :key="prodi.id" class="hover:bg-gray-50">
                                    <td class="px-4 py-3 font-mono">{{ prodi.code }}</td>
                                    <td class="px-4 py-3 font-mono text-primary">{{ prodi.nim_code || '-' }}</td>
                                    <td class="px-4 py-3 font-medium">{{ prodi.name }}</td>
                                    <td class="px-4 py-3">{{ prodi.jenjang }}</td>
                                    <td class="px-4 py-3">{{ prodi.fakultas?.name || '-' }}</td>
                                    <td class="px-4 py-3">
                                        <Badge :variant="prodi.is_active ? 'default' : 'secondary'">
                                            {{ prodi.is_active ? 'Aktif' : 'Nonaktif' }}
                                        </Badge>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="flex gap-2">
                                            <Button size="sm" variant="ghost" @click="openEdit(prodi)">
                                                <Edit class="size-4" />
                                            </Button>
                                            <Button size="sm" variant="ghost" @click="deleteProdi(prodi.id)">
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
                    <DialogTitle>{{ editingProdi ? 'Edit Program Studi' : 'Tambah Program Studi' }}</DialogTitle>
                </DialogHeader>
                <form @submit.prevent="submit" class="space-y-4">
                    <div class="grid grid-cols-2 gap-4">
                        <div class="space-y-2">
                            <Label>Kode</Label>
                            <Input v-model="form.code" placeholder="TI" />
                        </div>
                        <div class="space-y-2">
                            <Label>Kode NIM (4 digit)</Label>
                            <Input v-model="form.nim_code" placeholder="0105" maxlength="4" />
                        </div>
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="space-y-2">
                            <Label>Nama Program Studi</Label>
                            <Input v-model="form.name" placeholder="Teknik Informatika" />
                        </div>
                        <div class="space-y-2">
                            <Label>Jenjang</Label>
                            <select v-model="form.jenjang" class="flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm">
                                <option value="D3">D3</option>
                                <option value="D4">D4</option>
                                <option value="S1">S1</option>
                                <option value="S2">S2</option>
                                <option value="S3">S3</option>
                            </select>
                        </div>
                    </div>
                    <div class="space-y-2">
                        <Label>Fakultas</Label>
                        <select v-model="form.fakultas_id" class="flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm">
                            <option value="">Pilih Fakultas</option>
                            <option v-for="fak in props.fakultas" :key="fak.id" :value="fak.id">
                                {{ fak.name }}
                            </option>
                        </select>
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
