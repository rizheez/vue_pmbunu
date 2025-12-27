<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, router, useForm, usePage } from '@inertiajs/vue3';
import { CheckCircle, Save, Upload, X, Image } from 'lucide-vue-next';
import { computed, ref } from 'vue';

interface Setting {
    id: number;
    key: string;
    value: string | null;
    type: string;
    group: string;
}

interface Props {
    settings: Record<string, Setting[]>;
}

const props = defineProps<Props>();
const page = usePage();
const flash = computed(() => page.props.flash as { success?: string });

// Track file uploads separately
const fileInputs = ref<Record<string, File | null>>({});
const previews = ref<Record<string, string>>({});

// Initialize form with all settings values
const getFormData = () => {
    const data: Record<string, string> = {};
    Object.values(props.settings).forEach((group) => {
        group.forEach((setting) => {
            data[setting.key] = setting.value || '';
        });
    });
    return data;
};

const form = useForm(getFormData());

const handleFileChange = (key: string, event: Event) => {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files[0]) {
        const file = input.files[0];
        fileInputs.value[key] = file;

        // Create preview
        const reader = new FileReader();
        reader.onload = (e) => {
            previews.value[key] = e.target?.result as string;
        };
        reader.readAsDataURL(file);
    }
};

const removeFile = (key: string) => {
    fileInputs.value[key] = null;
    delete previews.value[key];
    (form as any)[key] = '';
};

const submit = () => {
    // Create FormData for file uploads
    const formData = new FormData();

    // Add all text fields
    Object.keys(form.data()).forEach((key) => {
        formData.append(key, (form as any)[key] || '');
    });

    // Add file uploads
    Object.entries(fileInputs.value).forEach(([key, file]) => {
        if (file) {
            formData.append(key, file);
        }
    });

    router.post('/admin/landing-page', formData, {
        preserveScroll: true,
        forceFormData: true,
    });
};

const getLabel = (key: string): string => {
    return key
        .replace(/_/g, ' ')
        .replace(/\b\w/g, (l) => l.toUpperCase());
};

const getImagePreview = (key: string): string | null => {
    // Return new preview if available
    if (previews.value[key]) return previews.value[key];
    // Return existing value
    return (form as any)[key] || null;
};

const breadcrumbs = [
    { title: 'Admin Dashboard', href: '/admin/dashboard' },
    { title: 'Landing Page', href: '/admin/landing-page' },
];
</script>

<template>
    <Head title="Landing Page Settings" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Alert v-if="flash?.success" class="border-green-500 bg-green-50">
                <CheckCircle class="size-4 text-green-600" />
                <AlertTitle class="text-green-800">Berhasil</AlertTitle>
                <AlertDescription class="text-green-700">{{ flash.success }}</AlertDescription>
            </Alert>

            <form @submit.prevent="submit" class="space-y-6">
                <!-- Hero Section -->
                <Card v-if="props.settings.hero">
                    <CardHeader>
                        <CardTitle>Hero Section</CardTitle>
                        <CardDescription>Bagian utama landing page</CardDescription>
                    </CardHeader>
                    <CardContent class="space-y-4">
                        <div v-for="setting in props.settings.hero" :key="setting.key" class="space-y-2">
                            <Label>{{ getLabel(setting.key) }}</Label>

                            <!-- Textarea -->
                            <textarea
                                v-if="setting.type === 'textarea'"
                                v-model="(form as any)[setting.key]"
                                rows="3"
                                class="flex w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                            ></textarea>

                            <!-- Image Upload -->
                            <div v-else-if="setting.type === 'image'" class="space-y-3">
                                <div v-if="getImagePreview(setting.key)" class="relative inline-block">
                                    <img
                                        :src="getImagePreview(setting.key)!"
                                        :alt="setting.key"
                                        class="h-32 w-auto rounded-lg border object-cover"
                                    />
                                    <button
                                        type="button"
                                        @click="removeFile(setting.key)"
                                        class="absolute -right-2 -top-2 rounded-full bg-red-500 p-1 text-white hover:bg-red-600"
                                    >
                                        <X class="size-3" />
                                    </button>
                                </div>
                                <div v-else class="flex h-32 w-48 items-center justify-center rounded-lg border-2 border-dashed border-gray-300 bg-gray-50">
                                    <Image class="size-8 text-gray-400" />
                                </div>
                                <div class="flex gap-2">
                                    <label class="cursor-pointer">
                                        <input
                                            type="file"
                                            accept="image/*"
                                            class="hidden"
                                            @change="handleFileChange(setting.key, $event)"
                                        />
                                        <Button type="button" variant="outline" size="sm" as="span">
                                            <Upload class="mr-2 size-4" />
                                            Upload Gambar
                                        </Button>
                                    </label>
                                </div>
                                <Input
                                    v-model="(form as any)[setting.key]"
                                    placeholder="Atau masukkan URL gambar..."
                                    class="text-sm"
                                />
                            </div>

                            <!-- Regular Input -->
                            <Input
                                v-else
                                v-model="(form as any)[setting.key]"
                            />
                        </div>
                    </CardContent>
                </Card>

                <!-- Features Section -->
                <Card v-if="props.settings.features">
                    <CardHeader>
                        <CardTitle>Features Section</CardTitle>
                        <CardDescription>Keunggulan / fitur yang ditampilkan</CardDescription>
                    </CardHeader>
                    <CardContent class="space-y-4">
                        <div v-for="setting in props.settings.features" :key="setting.key" class="space-y-2">
                            <Label>{{ getLabel(setting.key) }}</Label>
                            <textarea
                                v-if="setting.type === 'textarea'"
                                v-model="(form as any)[setting.key]"
                                rows="2"
                                class="flex w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                            ></textarea>
                            <Input
                                v-else
                                v-model="(form as any)[setting.key]"
                            />
                        </div>
                    </CardContent>
                </Card>

                <!-- About Section -->
                <Card v-if="props.settings.about">
                    <CardHeader>
                        <CardTitle>About Section</CardTitle>
                        <CardDescription>Tentang universitas</CardDescription>
                    </CardHeader>
                    <CardContent class="space-y-4">
                        <div v-for="setting in props.settings.about" :key="setting.key" class="space-y-2">
                            <Label>{{ getLabel(setting.key) }}</Label>

                            <textarea
                                v-if="setting.type === 'textarea'"
                                v-model="(form as any)[setting.key]"
                                rows="4"
                                class="flex w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                            ></textarea>

                            <!-- Image Upload for About -->
                            <div v-else-if="setting.type === 'image'" class="space-y-3">
                                <div v-if="getImagePreview(setting.key)" class="relative inline-block">
                                    <img
                                        :src="getImagePreview(setting.key)!"
                                        :alt="setting.key"
                                        class="h-32 w-auto rounded-lg border object-cover"
                                    />
                                    <button
                                        type="button"
                                        @click="removeFile(setting.key)"
                                        class="absolute -right-2 -top-2 rounded-full bg-red-500 p-1 text-white hover:bg-red-600"
                                    >
                                        <X class="size-3" />
                                    </button>
                                </div>
                                <div v-else class="flex h-32 w-48 items-center justify-center rounded-lg border-2 border-dashed border-gray-300 bg-gray-50">
                                    <Image class="size-8 text-gray-400" />
                                </div>
                                <div class="flex gap-2">
                                    <label class="cursor-pointer">
                                        <input
                                            type="file"
                                            accept="image/*"
                                            class="hidden"
                                            @change="handleFileChange(setting.key, $event)"
                                        />
                                        <Button type="button" variant="outline" size="sm" as="span">
                                            <Upload class="mr-2 size-4" />
                                            Upload Gambar
                                        </Button>
                                    </label>
                                </div>
                                <Input
                                    v-model="(form as any)[setting.key]"
                                    placeholder="Atau masukkan URL gambar..."
                                    class="text-sm"
                                />
                            </div>

                            <Input
                                v-else
                                v-model="(form as any)[setting.key]"
                            />
                        </div>
                    </CardContent>
                </Card>

                <!-- Contact Section -->
                <Card v-if="props.settings.contact">
                    <CardHeader>
                        <CardTitle>Contact Section</CardTitle>
                        <CardDescription>Informasi kontak</CardDescription>
                    </CardHeader>
                    <CardContent class="space-y-4">
                        <div v-for="setting in props.settings.contact" :key="setting.key" class="space-y-2">
                            <Label>{{ getLabel(setting.key) }}</Label>

                            <!-- Image Upload for Contact (logo) -->
                            <div v-if="setting.type === 'image'" class="space-y-3">
                                <div v-if="getImagePreview(setting.key)" class="relative inline-block">
                                    <img
                                        :src="getImagePreview(setting.key)!"
                                        :alt="setting.key"
                                        class="h-20 w-auto rounded-lg border object-contain bg-white p-2"
                                    />
                                    <button
                                        type="button"
                                        @click="removeFile(setting.key)"
                                        class="absolute -right-2 -top-2 rounded-full bg-red-500 p-1 text-white hover:bg-red-600"
                                    >
                                        <X class="size-3" />
                                    </button>
                                </div>
                                <div v-else class="flex h-20 w-20 items-center justify-center rounded-lg border-2 border-dashed border-gray-300 bg-gray-50">
                                    <Image class="size-6 text-gray-400" />
                                </div>
                                <div class="flex gap-2">
                                    <label class="cursor-pointer">
                                        <input
                                            type="file"
                                            accept="image/*"
                                            class="hidden"
                                            @change="handleFileChange(setting.key, $event)"
                                        />
                                        <Button type="button" variant="outline" size="sm" as="span">
                                            <Upload class="mr-2 size-4" />
                                            Upload Logo
                                        </Button>
                                    </label>
                                </div>
                                <Input
                                    v-model="(form as any)[setting.key]"
                                    placeholder="Atau masukkan URL gambar..."
                                    class="text-sm"
                                />
                            </div>

                            <Input
                                v-else
                                v-model="(form as any)[setting.key]"
                            />
                        </div>
                    </CardContent>
                </Card>

                <!-- Social Media Section -->
                <Card v-if="props.settings.social_media">
                    <CardHeader>
                        <CardTitle>Social Media</CardTitle>
                        <CardDescription>Link sosial media</CardDescription>
                    </CardHeader>
                    <CardContent class="space-y-4">
                        <div v-for="setting in props.settings.social_media" :key="setting.key" class="space-y-2">
                            <Label>{{ getLabel(setting.key) }}</Label>
                            <Input v-model="(form as any)[setting.key]" />
                        </div>
                    </CardContent>
                </Card>

                <div class="flex justify-end">
                    <Button type="submit" :disabled="form.processing">
                        <Save class="mr-2 size-4" />
                        Simpan Perubahan
                    </Button>
                </div>
            </form>
        </div>
    </AppLayout>
</template>
