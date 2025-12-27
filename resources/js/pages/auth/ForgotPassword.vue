<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Spinner } from '@/components/ui/spinner';
import GuestLayout from '@/layouts/GuestLayout.vue';
import { login } from '@/routes';
import { email } from '@/routes/password';
import { Form, Head, Link } from '@inertiajs/vue3';

defineProps<{
    status?: string;
}>();
</script>

<template>
    <Head title="Lupa Password" />

    <GuestLayout max-width="md">
        <h2 class="text-xl font-bold text-center text-gray-800 mb-2">Lupa Password</h2>
        <p class="text-center text-sm text-gray-600 mb-6">
            Masukkan email Anda untuk menerima link reset password
        </p>

        <div
            v-if="status"
            class="mb-4 text-center text-sm font-medium text-green-600 bg-green-50 p-3 rounded-lg"
        >
            {{ status }}
        </div>

        <Form v-bind="email.form()" v-slot="{ errors, processing }" class="space-y-4">
            <div class="space-y-2">
                <Label for="email">Email</Label>
                <Input
                    id="email"
                    type="email"
                    name="email"
                    autocomplete="off"
                    autofocus
                    placeholder="email@example.com"
                />
                <InputError :message="errors.email" />
            </div>

            <Button class="w-full" :disabled="processing">
                <Spinner v-if="processing" class="mr-2" />
                Kirim Link Reset Password
            </Button>

            <div class="text-center text-sm text-gray-600">
                <span>Kembali ke </span>
                <Link :href="login()" class="text-teal-600 hover:text-teal-800 underline">halaman login</Link>
            </div>
        </Form>
    </GuestLayout>
</template>
