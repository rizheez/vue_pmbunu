<script setup lang="ts">
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Skeleton } from '@/components/ui/skeleton';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head } from '@inertiajs/vue3';

const breadcrumbs = [
    { title: 'Dashboard', href: '/student/dashboard' },
    { title: 'Daftar Ulang', href: '/student/daftar-ulang' },
];
</script>

<template>
    <Head title="Daftar Ulang" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Card>
                <CardHeader>
                    <CardTitle>Daftar Ulang</CardTitle>
                </CardHeader>
                <CardContent>
                    <div class="space-y-4">
                        <Skeleton class="h-12 w-full" />
                        <Skeleton class="h-12 w-full" />
                    </div>
                    <p class="mt-4 text-sm text-gray-500">
                        Form daftar ulang akan segera tersedia...
                    </p>
                </CardContent>
            </Card>
        </div>
    </AppLayout>
</template>
