<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Spinner } from '@/components/ui/spinner';
import GuestLayout from '@/layouts/GuestLayout.vue';
import { login } from '@/routes';
import { store } from '@/routes/register';
import { Form, Head, Link } from '@inertiajs/vue3';
import { AlertTriangle } from 'lucide-vue-next';
</script>

<template>
    <Head title="Register PMB" />

    <GuestLayout max-width="lg">
        <h2 class="text-xl font-bold text-center text-gray-800 mb-6">Register Akun Baru</h2>

        <Form
            v-bind="store.form()"
            :reset-on-success="['password', 'password_confirmation']"
            v-slot="{ errors, processing }"
            class="space-y-4"
        >
            <div class="space-y-2">
                <Label for="name">Nama Lengkap</Label>
                <Input
                    id="name"
                    type="text"
                    name="name"
                    required
                    autofocus
                    autocomplete="name"
                    placeholder="Nama lengkap sesuai KTP"
                />
                <InputError :message="errors.name" />
            </div>

            <div class="space-y-2">
                <Label for="email">Email</Label>
                <Input
                    id="email"
                    type="email"
                    name="email"
                    required
                    autocomplete="email"
                    placeholder="email@example.com"
                />
                <InputError :message="errors.email" />
            </div>

            <div class="space-y-2">
                <Label for="phone">
                    Nomor HP / WhatsApp <span class="text-red-500">*</span>
                </Label>
                <Input
                    id="phone"
                    type="tel"
                    name="phone"
                    required
                    autocomplete="tel"
                    placeholder="08123456789"
                />
                <InputError :message="errors.phone" />

                <div class="p-3 bg-amber-50 border border-amber-200 rounded-lg">
                    <p class="text-xs text-amber-800 font-semibold flex items-center gap-1">
                        <AlertTriangle class="size-4" />
                        Gunakan Nomor WhatsApp Aktif!
                    </p>
                    <p class="text-xs text-amber-700 mt-1">
                        Informasi penting seperti status pendaftaran, jadwal daftar ulang, dan pengumuman akan dikirim melalui WhatsApp.
                    </p>
                </div>
                <p class="text-xs text-gray-500">Contoh: 08123456789 (tanpa spasi atau tanda hubung)</p>
            </div>

            <div class="space-y-2">
                <Label for="password">Password</Label>
                <Input
                    id="password"
                    type="password"
                    name="password"
                    required
                    autocomplete="new-password"
                    placeholder="••••••••"
                />
                <InputError :message="errors.password" />
                <p class="text-xs text-gray-500">Minimal 8 karakter</p>
            </div>

            <div class="space-y-2">
                <Label for="password_confirmation">Konfirmasi Password</Label>
                <Input
                    id="password_confirmation"
                    type="password"
                    name="password_confirmation"
                    required
                    autocomplete="new-password"
                    placeholder="••••••••"
                />
                <InputError :message="errors.password_confirmation" />
            </div>

            <div class="flex gap-3 pt-2">
                <Button
                    type="button"
                    variant="outline"
                    class="flex-1 border-2 border-teal-600 text-teal-600 hover:bg-teal-50"
                    as-child
                >
                    <Link :href="login()">SUDAH PUNYA AKUN</Link>
                </Button>
                <Button
                    type="submit"
                    class="flex-1"
                    :disabled="processing"
                >
                    <Spinner v-if="processing" class="mr-2" />
                    DAFTAR
                </Button>
            </div>
        </Form>
    </GuestLayout>
</template>
