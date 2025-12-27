<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Checkbox } from '@/components/ui/checkbox';
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
import type { Announcement } from '@/types/pmb';
import { Head, router, useForm, usePage } from '@inertiajs/vue3';
import { CheckCircle, Edit, Plus, Trash } from 'lucide-vue-next';
import { computed, ref } from 'vue';

interface Props {
    announcements: Announcement[];
}

const props = defineProps<Props>();
const page = usePage();
const flash = computed(() => page.props.flash as { success?: string });

const showDialog = ref(false);
const editingAnn = ref<Announcement | null>(null);

const form = useForm({
    title: '',
    content: '',
    is_published: true,
});

const openCreate = () => {
    editingAnn.value = null;
    form.reset();
    form.is_published = true;
    showDialog.value = true;
};

const openEdit = (ann: Announcement) => {
    editingAnn.value = ann;
    form.title = ann.title;
    form.content = ann.content;
    form.is_published = ann.is_published;
    showDialog.value = true;
};

const submit = () => {
    if (editingAnn.value) {
        form.put(`/admin/announcements/${editingAnn.value.id}`, {
            onSuccess: () => (showDialog.value = false),
        });
    } else {
        form.post('/admin/announcements', {
            onSuccess: () => (showDialog.value = false),
        });
    }
};

const deleteAnn = (id: number) => {
    if (confirm('Hapus pengumuman ini?')) {
        router.delete(`/admin/announcements/${id}`);
    }
};

const breadcrumbs = [
    { title: 'Admin Dashboard', href: '/admin/dashboard' },
    { title: 'Announcements', href: '/admin/announcements' },
];
</script>

<template>
    <Head title="Pengumuman" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Alert v-if="flash?.success" class="border-green-500 bg-green-50">
                <CheckCircle class="size-4 text-green-600" />
                <AlertTitle class="text-green-800">Berhasil</AlertTitle>
                <AlertDescription class="text-green-700">{{ flash.success }}</AlertDescription>
            </Alert>

            <Card>
                <CardHeader class="flex flex-row items-center justify-between">
                    <CardTitle>Manajemen Pengumuman</CardTitle>
                    <Button @click="openCreate">
                        <Plus class="mr-2 size-4" />
                        Tambah Pengumuman
                    </Button>
                </CardHeader>
                <CardContent>
                    <div class="space-y-4">
                        <div
                            v-for="ann in props.announcements"
                            :key="ann.id"
                            class="flex items-start justify-between rounded-lg border p-4"
                        >
                            <div class="flex-1">
                                <div class="flex items-center gap-2">
                                    <h3 class="font-medium">{{ ann.title }}</h3>
                                    <Badge :variant="ann.is_published ? 'default' : 'secondary'">
                                        {{ ann.is_published ? 'Aktif' : 'Nonaktif' }}
                                    </Badge>
                                </div>
                                <p class="mt-1 text-sm text-gray-600">{{ ann.content }}</p>
                                <p class="mt-2 text-xs text-gray-400">{{ ann.created_at }}</p>
                            </div>
                            <div class="flex gap-2">
                                <Button size="sm" variant="ghost" @click="openEdit(ann)">
                                    <Edit class="size-4" />
                                </Button>
                                <Button size="sm" variant="ghost" @click="deleteAnn(ann.id)">
                                    <Trash class="size-4 text-red-500" />
                                </Button>
                            </div>
                        </div>
                        <p v-if="props.announcements.length === 0" class="text-center text-gray-500">
                            Belum ada pengumuman
                        </p>
                    </div>
                </CardContent>
            </Card>
        </div>

        <Dialog v-model:open="showDialog">
            <DialogContent>
                <DialogHeader>
                    <DialogTitle>{{ editingAnn ? 'Edit Pengumuman' : 'Tambah Pengumuman' }}</DialogTitle>
                </DialogHeader>
                <form @submit.prevent="submit" class="space-y-4">
                    <div class="space-y-2">
                        <Label>Judul</Label>
                        <Input v-model="form.title" placeholder="Judul pengumuman" />
                    </div>
                    <div class="space-y-2">
                        <Label>Konten</Label>
                        <textarea
                            v-model="form.content"
                            rows="4"
                            class="flex min-h-[80px] w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                            placeholder="Isi pengumuman..."
                        ></textarea>
                    </div>
                    <div class="flex items-center gap-2">
                        <Checkbox id="is_published" v-model="form.is_published" />
                        <Label for="is_published">Aktif</Label>
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
