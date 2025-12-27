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
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, router, useForm, usePage } from '@inertiajs/vue3';
import { CheckCircle, Edit, Plus, Search, Trash, XCircle } from 'lucide-vue-next';
import { computed, ref, watch } from 'vue';

interface User {
    id: number;
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
const flash = computed(() => page.props.flash as { success?: string; error?: string });

const filterRole = ref(props.filters.role || 'all');
const search = ref(props.filters.search || '');

watch([filterRole, search], () => {
    router.get('/admin/users', {
        role: filterRole.value !== 'all' ? filterRole.value : undefined,
        search: search.value || undefined,
    }, { preserveState: true, replace: true });
});

const showDialog = ref(false);
const editing = ref<User | null>(null);

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
        form.put(`/admin/users/${editing.value.id}`, {
            onSuccess: () => (showDialog.value = false),
        });
    } else {
        form.post('/admin/users', {
            onSuccess: () => (showDialog.value = false),
        });
    }
};

const deleteUser = (id: number) => {
    if (confirm('Hapus pengguna ini?')) {
        router.delete(`/admin/users/${id}`);
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
                <AlertDescription class="text-green-700">{{ flash.success }}</AlertDescription>
            </Alert>
            <Alert v-if="flash?.error" class="border-red-500 bg-red-50">
                <XCircle class="size-4 text-red-600" />
                <AlertTitle class="text-red-800">Error</AlertTitle>
                <AlertDescription class="text-red-700">{{ flash.error }}</AlertDescription>
            </Alert>

            <Card>
                <CardHeader class="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
                    <CardTitle>Manajemen Pengguna</CardTitle>
                    <div class="flex flex-wrap gap-2">
                        <div class="relative">
                            <Search class="absolute left-2 top-2.5 size-4 text-gray-400" />
                            <Input v-model="search" placeholder="Cari..." class="w-48 pl-8" />
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
                                    <th class="px-4 py-3 text-left">Verified</th>
                                    <th class="px-4 py-3 text-left">Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y">
                                <tr v-for="user in props.users.data" :key="user.id" class="hover:bg-gray-50">
                                    <td class="px-4 py-3 font-medium">{{ user.name }}</td>
                                    <td class="px-4 py-3">{{ user.email }}</td>
                                    <td class="px-4 py-3">{{ user.phone || '-' }}</td>
                                    <td class="px-4 py-3">
                                        <Badge :variant="getRoleBadge(user.role)">
                                            {{ user.role }}
                                        </Badge>
                                    </td>
                                    <td class="px-4 py-3">
                                        <Badge :variant="user.email_verified_at ? 'default' : 'secondary'">
                                            {{ user.email_verified_at ? 'Ya' : 'Tidak' }}
                                        </Badge>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div v-if="user.role !== 'student'" class="flex gap-2">
                                            <Button size="sm" variant="ghost" @click="openEdit(user)">
                                                <Edit class="size-4" />
                                            </Button>
                                            <Button size="sm" variant="ghost" @click="deleteUser(user.id)">
                                                <Trash class="size-4 text-red-500" />
                                            </Button>
                                        </div>
                                        <span v-else class="text-gray-400 text-xs">-</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <div class="mt-4 flex justify-center gap-1">
                        <template v-for="link in props.users.links" :key="link.label">
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

        <Dialog v-model:open="showDialog">
            <DialogContent class="max-w-md">
                <DialogHeader>
                    <DialogTitle>{{ editing ? 'Edit' : 'Tambah' }} Pengguna</DialogTitle>
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
                        <Label>Password {{ editing ? '(kosongkan jika tidak diubah)' : '' }}</Label>
                        <Input v-model="form.password" type="password" />
                    </div>
                    <div class="space-y-2">
                        <Label>Konfirmasi Password</Label>
                        <Input v-model="form.password_confirmation" type="password" />
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
