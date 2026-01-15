<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from '@/components/ui/dialog';
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
import { Head, router, useForm, usePage } from '@inertiajs/vue3';
import {
    AlertTriangle,
    CheckCircle,
    Edit,
    Plus,
    Search,
    Trash,
    XCircle,
} from 'lucide-vue-next';
import { computed, ref, watch } from 'vue';

interface User {
    id: number;
    hashed_id: string;
    name: string;
    email: string;
    phone: string | null;
    role: 'admin' | 'staff' | 'student';
    email_verified_at: string | null;
    created_at: string;
}

interface Props {
    users: {
        data: User[];
        links: { url: string | null; label: string; active: boolean }[];
    };
    filters: {
        role?: string;
        search?: string;
    };
}

const props = defineProps<Props>();
const page = usePage();
const flash = computed(
    () => page.props.flash as { success?: string; error?: string },
);

const filterRole = ref(props.filters.role || 'all');
const search = ref(props.filters.search || '');

watch([filterRole, search], () => {
    router.get(
        '/admin/users',
        {
            role: filterRole.value !== 'all' ? filterRole.value : undefined,
            search: search.value || undefined,
        },
        { preserveState: true, replace: true },
    );
});

const showDialog = ref(false);
const editing = ref<User | null>(null);

// Delete confirmation dialog
const showDeleteDialog = ref(false);
const userToDelete = ref<User | null>(null);
const deletingUser = ref(false);

const form = useForm({
    name: '',
    email: '',
    phone: '',
    role: 'student' as 'admin' | 'staff' | 'student',
    password: '',
    password_confirmation: '',
});

const openCreate = () => {
    editing.value = null;
    form.reset();
    form.role = 'student';
    showDialog.value = true;
};

const openEdit = (user: User) => {
    editing.value = user;
    form.name = user.name;
    form.email = user.email;
    form.phone = user.phone || '';
    form.role = user.role;
    form.password = '';
    form.password_confirmation = '';
    showDialog.value = true;
};

const submit = () => {
    if (editing.value) {
        form.put(`/admin/users/${editing.value.hashed_id}`, {
            onSuccess: () => (showDialog.value = false),
        });
    } else {
        form.post('/admin/users', {
            onSuccess: () => (showDialog.value = false),
        });
    }
};

const openDeleteDialog = (user: User) => {
    userToDelete.value = user;
    showDeleteDialog.value = true;
};

const confirmDelete = () => {
    if (!userToDelete.value) return;

    deletingUser.value = true;
    router.delete(`/admin/users/${userToDelete.value.hashed_id}`, {
        onFinish: () => {
            deletingUser.value = false;
            showDeleteDialog.value = false;
            userToDelete.value = null;
        },
    });
};

const deleteUser = (user: User) => {
    if (user.role === 'student') {
        openDeleteDialog(user);
    } else {
        if (confirm('Hapus pengguna ini?')) {
            router.delete(`/admin/users/${user.hashed_id}`);
        }
    }
};

const getRoleBadge = (role: string) => {
    switch (role) {
        case 'admin':
            return 'destructive';
        case 'staff':
            return 'default';
        default:
            return 'secondary';
    }
};

const breadcrumbs = [
    { title: 'Admin Dashboard', href: '/admin/dashboard' },
    { title: 'Manajemen Pengguna', href: '/admin/users' },
];
</script>

<template>
    <Head title="Manajemen Pengguna" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Alert v-if="flash?.success" class="border-green-500 bg-green-50">
                <CheckCircle class="size-4 text-green-600" />
                <AlertTitle class="text-green-800">Berhasil</AlertTitle>
                <AlertDescription class="text-green-700">{{
                    flash.success
                }}</AlertDescription>
            </Alert>
            <Alert v-if="flash?.error" class="border-red-500 bg-red-50">
                <XCircle class="size-4 text-red-600" />
                <AlertTitle class="text-red-800">Error</AlertTitle>
                <AlertDescription class="text-red-700">{{
                    flash.error
                }}</AlertDescription>
            </Alert>

            <Card>
                <CardHeader
                    class="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between"
                >
                    <CardTitle>Manajemen Pengguna</CardTitle>
                    <div class="flex flex-wrap gap-2">
                        <div class="relative">
                            <Search
                                class="absolute top-2.5 left-2 size-4 text-gray-400"
                            />
                            <Input
                                v-model="search"
                                placeholder="Cari..."
                                class="w-48 pl-8"
                            />
                        </div>
                        <Select v-model="filterRole">
                            <SelectTrigger class="w-32">
                                <SelectValue placeholder="Role" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="all">Semua</SelectItem>
                                <SelectItem value="admin">Admin</SelectItem>
                                <SelectItem value="staff">Staff</SelectItem>
                                <SelectItem value="student">Student</SelectItem>
                            </SelectContent>
                        </Select>
                        <Button @click="openCreate">
                            <Plus class="mr-2 size-4" />
                            Tambah
                        </Button>
                    </div>
                </CardHeader>
                <CardContent>
                    <div class="overflow-x-auto rounded-lg border">
                        <table class="w-full text-sm">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-4 py-3 text-left">Nama</th>
                                    <th class="px-4 py-3 text-left">Email</th>
                                    <th class="px-4 py-3 text-left">Telepon</th>
                                    <th class="px-4 py-3 text-left">Role</th>
                                    <th class="px-4 py-3 text-left">
                                        Verified
                                    </th>
                                    <th class="px-4 py-3 text-left">Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y">
                                <tr
                                    v-for="user in props.users.data"
                                    :key="user.id"
                                    class="hover:bg-gray-50"
                                >
                                    <td class="px-4 py-3 font-medium">
                                        {{ user.name }}
                                    </td>
                                    <td class="px-4 py-3">{{ user.email }}</td>
                                    <td class="px-4 py-3">
                                        {{ user.phone || '-' }}
                                    </td>
                                    <td class="px-4 py-3">
                                        <Badge
                                            :variant="getRoleBadge(user.role)"
                                        >
                                            {{ user.role }}
                                        </Badge>
                                    </td>
                                    <td class="px-4 py-3">
                                        <Badge
                                            :variant="
                                                user.email_verified_at
                                                    ? 'default'
                                                    : 'secondary'
                                            "
                                        >
                                            {{
                                                user.email_verified_at
                                                    ? 'Ya'
                                                    : 'Tidak'
                                            }}
                                        </Badge>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="flex gap-2">
                                            <Button
                                                v-if="user.role !== 'student'"
                                                size="sm"
                                                variant="ghost"
                                                @click="openEdit(user)"
                                            >
                                                <Edit class="size-4" />
                                            </Button>
                                            <Button
                                                size="sm"
                                                variant="ghost"
                                                @click="deleteUser(user)"
                                            >
                                                <Trash
                                                    class="size-4 text-red-500"
                                                />
                                            </Button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <div class="mt-4 flex justify-center gap-1">
                        <template
                            v-for="link in props.users.links"
                            :key="link.label"
                        >
                            <Button
                                v-if="link.url"
                                size="sm"
                                :variant="link.active ? 'default' : 'outline'"
                                @click="router.get(link.url)"
                            >
                                <span v-html="link.label" />
                            </Button>
                        </template>
                    </div>
                </CardContent>
            </Card>
        </div>

        <!-- Create/Edit User Dialog -->
        <Dialog v-model:open="showDialog">
            <DialogContent class="max-w-md">
                <DialogHeader>
                    <DialogTitle
                        >{{ editing ? 'Edit' : 'Tambah' }} Pengguna</DialogTitle
                    >
                </DialogHeader>
                <form @submit.prevent="submit" class="space-y-4">
                    <div class="space-y-2">
                        <Label>Nama</Label>
                        <Input v-model="form.name" />
                    </div>
                    <div class="space-y-2">
                        <Label>Email</Label>
                        <Input v-model="form.email" type="email" />
                    </div>
                    <div class="space-y-2">
                        <Label>Telepon</Label>
                        <Input v-model="form.phone" />
                    </div>
                    <div class="space-y-2">
                        <Label>Role</Label>
                        <Select v-model="form.role">
                            <SelectTrigger>
                                <SelectValue />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="admin">Admin</SelectItem>
                                <SelectItem value="staff">Staff</SelectItem>
                                <SelectItem value="student">Student</SelectItem>
                            </SelectContent>
                        </Select>
                    </div>
                    <div class="space-y-2">
                        <Label
                            >Password
                            {{
                                editing ? '(kosongkan jika tidak diubah)' : ''
                            }}</Label
                        >
                        <Input v-model="form.password" type="password" />
                    </div>
                    <div class="space-y-2">
                        <Label>Konfirmasi Password</Label>
                        <Input
                            v-model="form.password_confirmation"
                            type="password"
                        />
                    </div>
                    <DialogFooter>
                        <Button
                            type="button"
                            variant="outline"
                            @click="showDialog = false"
                            >Batal</Button
                        >
                        <Button type="submit" :disabled="form.processing"
                            >Simpan</Button
                        >
                    </DialogFooter>
                </form>
            </DialogContent>
        </Dialog>

        <!-- Delete Confirmation Dialog for Student -->
        <Dialog v-model:open="showDeleteDialog">
            <DialogContent class="max-w-md">
                <DialogHeader>
                    <DialogTitle class="flex items-center gap-2 text-red-600">
                        <AlertTriangle class="size-5" />
                        Hapus Akun
                    </DialogTitle>
                    <DialogDescription>
                        Anda yakin ingin menghapus akun ini?
                    </DialogDescription>
                </DialogHeader>

                <div class="space-y-4 py-4">
                    <div
                        class="rounded-lg border border-gray-200 bg-gray-50 p-4"
                    >
                        <p class="font-medium">{{ userToDelete?.name }}</p>
                        <p class="text-sm text-gray-600">
                            {{ userToDelete?.email }}
                        </p>
                    </div>

                    <div
                        class="rounded-lg border border-amber-200 bg-amber-50 p-4"
                    >
                        <p
                            class="flex items-center gap-2 text-sm font-semibold text-amber-800"
                        >
                            <AlertTriangle class="size-4" />
                            Peringatan!
                        </p>
                        <p class="mt-2 text-sm text-amber-700">
                            Data berikut juga akan
                            <strong>ikut terhapus</strong>:
                        </p>
                        <ul
                            class="mt-2 list-inside list-disc space-y-1 text-sm text-amber-700"
                        >
                            <li>Biodata calon mahasiswa</li>
                            <li>Dokumen yang telah diupload</li>
                            <li>Data pendaftaran</li>
                            <li>Riwayat verifikasi dokumen</li>
                        </ul>
                    </div>
                </div>

                <DialogFooter>
                    <Button
                        type="button"
                        variant="outline"
                        @click="showDeleteDialog = false"
                        :disabled="deletingUser"
                    >
                        Batal
                    </Button>
                    <Button
                        type="button"
                        variant="destructive"
                        @click="confirmDelete"
                        :disabled="deletingUser"
                    >
                        {{ deletingUser ? 'Menghapus...' : 'Ya, Hapus' }}
                    </Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    </AppLayout>
</template>
