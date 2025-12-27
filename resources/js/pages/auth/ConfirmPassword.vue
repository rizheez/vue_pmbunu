<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Spinner } from '@/components/ui/spinner';
import GuestLayout from '@/layouts/GuestLayout.vue';
import { store } from '@/routes/password/confirm';
import { Form, Head } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Konfirmasi Password" />

    <GuestLayout max-width="sm">
        <h2 class="text-xl font-bold text-center text-gray-800 mb-2">Konfirmasi Password</h2>
        <p class="text-center text-sm text-gray-600 mb-6">
            Ini adalah area aman. Silakan konfirmasi password Anda sebelum melanjutkan.
        </p>

        <Form
            v-bind="store.form()"
            reset-on-success
            v-slot="{ errors, processing }"
            class="space-y-4"
        >
            <div class="space-y-2">
                <Label for="password">Password</Label>
                <Input
                    id="password"
                    type="password"
                    name="password"
                    required
                    autocomplete="current-password"
                    autofocus
                    placeholder="••••••••"
                />
                <InputError :message="errors.password" />
            </div>

            <Button class="w-full" :disabled="processing">
                <Spinner v-if="processing" class="mr-2" />
                Konfirmasi
            </Button>
        </Form>
    </GuestLayout>
</template>
