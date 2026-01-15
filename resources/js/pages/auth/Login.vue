<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';
import { Checkbox } from '@/components/ui/checkbox';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Spinner } from '@/components/ui/spinner';
import GuestLayout from '@/layouts/GuestLayout.vue';
import { register } from '@/routes';
import { store } from '@/routes/login';
import { request } from '@/routes/password';
import { Form, Head, Link } from '@inertiajs/vue3';
import { Eye, EyeOff, Info, Mail, Phone } from 'lucide-vue-next';
import { ref } from 'vue';

defineProps<{
    status?: string;
    canResetPassword: boolean;
    canRegister: boolean;
}>();

const showPassword = ref(false);
</script>

<template>
    <Head title="Login PMB" />

    <GuestLayout max-width="2xl">
        <h2 class="mb-6 text-center text-xl font-bold text-gray-800">
            Login PMB
        </h2>

        <div
            v-if="status"
            class="mb-4 rounded-lg bg-green-50 p-3 text-center text-sm font-medium text-green-600"
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
                <div class="relative">
                    <Input
                        id="password"
                        :type="showPassword ? 'text' : 'password'"
                        name="password"
                        required
                        autocomplete="current-password"
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
            </div>

            <div class="flex items-center justify-between">
                <Label for="remember" class="flex items-center gap-2">
                    <Checkbox id="remember" name="remember" />
                    <span class="text-sm text-gray-600">Ingat saya</span>
                </Label>
                <Link
                    v-if="canResetPassword"
                    :href="request()"
                    class="text-sm text-teal-600 underline hover:text-teal-800"
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
                <Button type="submit" class="flex-1" :disabled="processing">
                    <Spinner v-if="processing" class="mr-2" />
                    MASUK
                </Button>
            </div>
        </Form>

        <template #footer>
            <div class="grid w-full grid-cols-1 gap-4 md:grid-cols-2">
                <div
                    class="rounded-xl border border-white/10 bg-white/95 p-5 backdrop-blur-xl"
                >
                    <h3
                        class="mb-3 flex items-center text-sm font-semibold text-gray-700"
                    >
                        <Info class="mr-2 size-5 text-teal-600" />
                        Butuh Bantuan?
                    </h3>
                    <div class="space-y-2 text-sm text-gray-600">
                        <div class="flex items-center gap-2">
                            <Phone class="size-4 text-teal-600" />
                            <span
                                >WhatsApp: <strong>0812-5317-738</strong></span
                            >
                        </div>
                        <div class="flex items-center gap-2">
                            <Mail class="size-4 text-teal-600" />
                            <span
                                >Email:
                                <strong>pmb@unukaltim.ac.id</strong></span
                            >
                        </div>
                    </div>
                </div>
                <div
                    class="rounded-xl border border-white/10 bg-white/95 p-5 backdrop-blur-xl"
                >
                    <h3 class="mb-2 text-sm font-semibold text-gray-700">
                        📋 Alur Pendaftaran:
                    </h3>
                    <ol
                        class="list-inside list-decimal space-y-1 text-xs text-gray-600"
                    >
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
