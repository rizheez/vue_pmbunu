<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';
import { Checkbox } from '@/components/ui/checkbox';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Spinner } from '@/components/ui/spinner';
import GuestLayout from '@/layouts/GuestLayout.vue';
import { store } from '@/routes/login';
import { request } from '@/routes/password';
import { register } from '@/routes';
import { Form, Head, Link } from '@inertiajs/vue3';
import { Mail, Phone, Info } from 'lucide-vue-next';

defineProps<{
    status?: string;
    canResetPassword: boolean;
    canRegister: boolean;
}>();
</script>

<template>
    <Head title="Login PMB" />

    <GuestLayout max-width="2xl">
        <h2 class="text-xl font-bold text-center text-gray-800 mb-6">Login PMB</h2>

        <div
            v-if="status"
            class="mb-4 text-center text-sm font-medium text-green-600 bg-green-50 p-3 rounded-lg"
        >
            {{ status }}
        </div>

        <Form
            v-bind="store.form()"
            :reset-on-success="['password']"
            v-slot="{ errors, processing }"
            class="space-y-4"
        >
            <div class="space-y-2">
                <Label for="email">Email</Label>
                <Input
                    id="email"
                    type="email"
                    name="email"
                    required
                    autofocus
                    autocomplete="email"
                    placeholder="email@example.com"
                />
                <InputError :message="errors.email" />
            </div>

            <div class="space-y-2">
                <Label for="password">Password</Label>
                <Input
                    id="password"
                    type="password"
                    name="password"
                    required
                    autocomplete="current-password"
                    placeholder="••••••••"
                />
                <InputError :message="errors.password" />
            </div>

            <div class="flex items-center justify-between">
                <Label for="remember" class="flex items-center gap-2">
                    <Checkbox id="remember" name="remember" />
                    <span class="text-sm text-gray-600">Ingat saya</span>
                </Label>
                <Link
                    v-if="canResetPassword"
                    :href="request()"
                    class="text-sm text-teal-600 hover:text-teal-800 underline"
                >
                    Lupa Password?
                </Link>
            </div>

            <div class="flex gap-3 pt-2">
                <Button
                    v-if="canRegister"
                    type="button"
                    variant="outline"
                    class="flex-1 border-2 border-teal-600 text-teal-600 hover:bg-teal-50"
                    as-child
                >
                    <Link :href="register()">DAFTAR BARU</Link>
                </Button>
                <Button
                    type="submit"
                    class="flex-1"
                    :disabled="processing"
                >
                    <Spinner v-if="processing" class="mr-2" />
                    MASUK
                </Button>
            </div>
        </Form>

        <template #footer>
            <div class="w-full grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="bg-white/95 backdrop-blur-xl rounded-xl p-5 border border-white/10">
                    <h3 class="text-sm font-semibold text-gray-700 mb-3 flex items-center">
                        <Info class="size-5 mr-2 text-teal-600" />
                        Butuh Bantuan?
                    </h3>
                    <div class="space-y-2 text-sm text-gray-600">
                        <div class="flex items-center gap-2">
                            <Phone class="size-4 text-teal-600" />
                            <span>WhatsApp: <strong>0811-4200-9990</strong></span>
                        </div>
                        <div class="flex items-center gap-2">
                            <Mail class="size-4 text-teal-600" />
                            <span>Email: <strong>pmb@unukaltim.ac.id</strong></span>
                        </div>
                    </div>
                </div>
                <div class="bg-white/95 backdrop-blur-xl rounded-xl p-5 border border-white/10">
                    <h3 class="text-sm font-semibold text-gray-700 mb-2">📋 Alur Pendaftaran:</h3>
                    <ol class="text-xs text-gray-600 space-y-1 list-decimal list-inside">
                        <li>Daftar akun baru (jika belum punya)</li>
                        <li>Login dan lengkapi biodata</li>
                        <li>Upload dokumen yang diperlukan</li>
                        <li>Pilih program studi</li>
                        <li>Tunggu verifikasi dari admin</li>
                    </ol>
                </div>
            </div>
        </template>
    </GuestLayout>
</template>
