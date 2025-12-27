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
import { Head, router, useForm, usePage } from '@inertiajs/vue3';
import { CheckCircle, Edit, Plus, Trash } from 'lucide-vue-next';
import { computed, ref } from 'vue';

interface RegistrationType {
    id: number;
    name: string;
    description: string | null;
    is_active: boolean;
    registrations_count: number;
}

interface Props {
    types: RegistrationType[];
}

const props = defineProps<Props>();
const page = usePage();
const flash = computed(() => page.props.flash as { success?: string });

const showDialog = ref(false);
const editing = ref<RegistrationType | null>(null);

const form = useForm({
    name: '',
    description: '',
    is_active: true,
});

const openCreate = () => {
    editing.value = null;
    form.reset();
    form.is_active = true;
    showDialog.value = true;
};

const openEdit = (item: RegistrationType) => {
    editing.value = item;
    form.name = item.name;
    form.description = item.description || '';
    form.is_active = item.is_active;
    showDialog.value = true;
};

const submit = () => {
    if (editing.value) {
        form.put(`/admin/registration-types/${editing.value.id}`, {
            onSuccess: () => (showDialog.value = false),
        });
    } else {
        form.post('/admin/registration-types', {
            onSuccess: () => (showDialog.value = false),
        });
    }
};

const deleteItem = (id: number) => {
    if (confirm('Hapus jenis pendaftaran ini?')) {
        router.delete(`/admin/registration-types/${id}`);
    }
};

const breadcrumbs = [
    { title: 'Admin Dashboard', href: '/admin/dashboard' },
    { title: 'Jenis Pendaftaran', href: '/admin/registration-types' },
];
</script>

<template>
    <Head title="Jenis Pendaftaran" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Alert v-if="flash?.success" class="border-green-500 bg-green-50">
                <CheckCircle class="size-4 text-green-600" />
                <AlertTitle class="text-green-800">Berhasil</AlertTitle>
                <AlertDescription class="text-green-700">{{ flash.success }}</AlertDescription>
            </Alert>

            <Card>
                <CardHeader class="flex flex-row items-center justify-between">
                    <CardTitle>Jenis Pendaftaran</CardTitle>
                    <Button @click="openCreate">
                        <Plus class="mr-2 size-4" />
                        Tambah
                    </Button>
                </CardHeader>
                <CardContent>
                    <div class="overflow-x-auto rounded-lg border">
                        <table class="w-full text-sm">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-4 py-3 text-left">Nama</th>
                                    <th class="px-4 py-3 text-left">Deskripsi</th>
                                    <th class="px-4 py-3 text-left">Pendaftar</th>
                                    <th class="px-4 py-3 text-left">Status</th>
                                    <th class="px-4 py-3 text-left">Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y">
                                <tr v-for="item in props.types" :key="item.id" class="hover:bg-gray-50">
                                    <td class="px-4 py-3 font-medium">{{ item.name }}</td>
                                    <td class="px-4 py-3 text-gray-500">{{ item.description || '-' }}</td>
                                    <td class="px-4 py-3">{{ item.registrations_count }}</td>
                                    <td class="px-4 py-3">
                                        <Badge :variant="item.is_active ? 'default' : 'secondary'">
                                            {{ item.is_active ? 'Aktif' : 'Nonaktif' }}
                                        </Badge>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="flex gap-2">
                                            <Button size="sm" variant="ghost" @click="openEdit(item)">
                                                <Edit class="size-4" />
                                            </Button>
                                            <Button size="sm" variant="ghost" @click="deleteItem(item.id)">
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
                    <DialogTitle>{{ editing ? 'Edit' : 'Tambah' }} Jenis Pendaftaran</DialogTitle>
                </DialogHeader>
                <form @submit.prevent="submit" class="space-y-4">
                    <div class="space-y-2">
                        <Label>Nama</Label>
                        <Input v-model="form.name" placeholder="Mahasiswa Baru" />
                    </div>
                    <div class="space-y-2">
                        <Label>Deskripsi</Label>
                        <textarea
                            v-model="form.description"
                            rows="2"
                            class="flex min-h-[60px] w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                        ></textarea>
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
