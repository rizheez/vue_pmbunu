<script setup lang="ts">
import { Button } from '@/components/ui/button';
import { Spinner } from '@/components/ui/spinner';
import GuestLayout from '@/layouts/GuestLayout.vue';
import { logout } from '@/routes';
import { send } from '@/routes/verification';
import { Form, Head, Link } from '@inertiajs/vue3';

defineProps<{
    status?: string;
}>();
</script>

<template>
    <Head title="Verifikasi Email" />

    <GuestLayout max-width="md">
        <h2 class="text-xl font-bold text-center text-gray-800 mb-2">Verifikasi Email</h2>
        <p class="text-center text-sm text-gray-600 mb-6">
            Silakan verifikasi email Anda dengan mengklik link yang telah kami kirim.
        </p>

        <div
            v-if="status === 'verification-link-sent'"
            class="mb-4 text-center text-sm font-medium text-green-600 bg-green-50 p-3 rounded-lg"
        >
            Link verifikasi baru telah dikirim ke email Anda.
        </div>

        <Form
            v-bind="send.form()"
            class="space-y-4 text-center"
            v-slot="{ processing }"
        >
            <Button :disabled="processing" class="w-full">
                <Spinner v-if="processing" class="mr-2" />
                Kirim Ulang Email Verifikasi
            </Button>

            <Link
                :href="logout()"
                method="post"
                as="button"
                class="text-sm text-teal-600 hover:text-teal-800 underline"
            >
                Logout
            </Link>
        </Form>
    </GuestLayout>
</template>
