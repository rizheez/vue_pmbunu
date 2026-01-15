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
import { AlertTriangle, Eye, EyeOff } from 'lucide-vue-next';
import { ref } from 'vue';

const showPassword = ref(false);
const showPasswordConfirmation = ref(false);
</script>

<template>
    <Head title="Register PMB" />

    <GuestLayout max-width="lg">
        <h2 class="mb-6 text-center text-xl font-bold text-gray-800">
            Register Akun Baru
        </h2>

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

                <div class="rounded-lg border border-amber-200 bg-amber-50 p-3">
                    <p
                        class="flex items-center gap-1 text-xs font-semibold text-amber-800"
                    >
                        <AlertTriangle class="size-4" />
                        Gunakan Nomor WhatsApp Aktif!
                    </p>
                    <p class="mt-1 text-xs text-amber-700">
                        Informasi penting seperti status pendaftaran, jadwal
                        daftar ulang, dan pengumuman akan dikirim melalui
                        WhatsApp.
                    </p>
                </div>
                <p class="text-xs text-gray-500">
                    Contoh: 08123456789 (tanpa spasi atau tanda hubung)
                </p>
            </div>

            <div class="space-y-2">
                <Label for="password">Password</Label>
                <div class="relative">
                    <Input
                        id="password"
                        :type="showPassword ? 'text' : 'password'"
                        name="password"
                        required
                        autocomplete="new-password"
                        placeholder="••••••••"
                        class="pr-10"
                    />
                    <button
                        type="button"
                        @click="showPassword = !showPassword"
                        class="absolute top-1/2 right-3 -translate-y-1/2 text-gray-500 hover:text-gray-700 focus:outline-none"
                    >
                        <EyeOff v-if="showPassword" class="size-4" />
                        <Eye v-else class="size-4" />
                    </button>
                </div>
                <InputError :message="errors.password" />
                <p class="text-xs text-gray-500">Minimal 8 karakter</p>
            </div>

            <div class="space-y-2">
                <Label for="password_confirmation">Konfirmasi Password</Label>
                <div class="relative">
                    <Input
                        id="password_confirmation"
                        :type="showPasswordConfirmation ? 'text' : 'password'"
                        name="password_confirmation"
                        required
                        autocomplete="new-password"
                        placeholder="••••••••"
                        class="pr-10"
                    />
                    <button
                        type="button"
                        @click="
                            showPasswordConfirmation = !showPasswordConfirmation
                        "
                        class="absolute top-1/2 right-3 -translate-y-1/2 text-gray-500 hover:text-gray-700 focus:outline-none"
                    >
                        <EyeOff
                            v-if="showPasswordConfirmation"
                            class="size-4"
                        />
                        <Eye v-else class="size-4" />
                    </button>
                </div>
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
                <Button type="submit" class="flex-1" :disabled="processing">
                    <Spinner v-if="processing" class="mr-2" />
                    DAFTAR
                </Button>
            </div>
        </Form>
    </GuestLayout>
</template>
