<script setup lang="ts">
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from '@/components/ui/card';
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogHeader,
    DialogTitle,
} from '@/components/ui/dialog';
import { Input } from '@/components/ui/input';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, Link, router } from '@inertiajs/vue3';
import {
    Clock,
    Database,
    Eye,
    Globe,
    MessageSquare,
    Search,
    Trash2,
    XCircle,
} from 'lucide-vue-next';
import { ref, watch } from 'vue';

interface User {
    id: number;
    name: string;
    email: string;
}

interface ChatLog {
    id: number;
    user_id: number | null;
    user_input: string;
    ai_response: string;
    provider: string;
    session_id: string | null;
    ip_address: string | null;
    response_time_ms: number | null;
    is_successful: boolean;
    error_message: string | null;
    created_at: string;
    user: User | null;
}

interface PaginatedLogs {
    data: ChatLog[];
    current_page: number;
    last_page: number;
    per_page: number;
    total: number;
    links: { url: string | null; label: string; active: boolean }[];
}

interface Stats {
    total: number;
    today: number;
    database_responses: number;
    api_responses: number;
    failed: number;
    avg_response_time: number;
}

interface Props {
    logs: PaginatedLogs;
    filters: {
        provider?: string;
        status?: string;
        date_from?: string;
        date_to?: string;
        search?: string;
        per_page?: number;
    };
    stats: Stats;
}

const props = defineProps<Props>();

const search = ref(props.filters.search || '');
const provider = ref(props.filters.provider || 'all');
const status = ref(props.filters.status || 'all');
const dateFrom = ref(props.filters.date_from || '');
const dateTo = ref(props.filters.date_to || '');
const perPage = ref(props.filters.per_page || 15);

// Modal state
const showDetailModal = ref(false);
const selectedLog = ref<ChatLog | null>(null);

const openDetail = (log: ChatLog) => {
    selectedLog.value = log;
    showDetailModal.value = true;
};

const applyFilters = () => {
    router.get(
        '/admin/chat-logs',
        {
            search: search.value || undefined,
            provider: provider.value !== 'all' ? provider.value : undefined,
            status: status.value !== 'all' ? status.value : undefined,
            date_from: dateFrom.value || undefined,
            date_to: dateTo.value || undefined,
            per_page: perPage.value,
        },
        { preserveState: true },
    );
};

watch([provider, status, perPage], () => applyFilters());

const getProviderBadge = (providerName: string) => {
    const map: Record<
        string,
        {
            variant: 'default' | 'secondary' | 'destructive' | 'outline';
            label: string;
            icon: typeof Database;
        }
    > = {
        database: { variant: 'secondary', label: 'Database', icon: Database },
        openrouter: { variant: 'default', label: 'API', icon: Globe },
        rejection: { variant: 'destructive', label: 'Rejected', icon: XCircle },
    };
    return (
        map[providerName] || {
            variant: 'outline',
            label: providerName,
            icon: MessageSquare,
        }
    );
};

const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleString('id-ID', {
        year: 'numeric',
        month: 'short',
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit',
    });
};

const formatDateFull = (dateString: string) => {
    return new Date(dateString).toLocaleString('id-ID', {
        weekday: 'long',
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
    });
};

const truncateText = (text: string, maxLength: number = 100) => {
    return text.length > maxLength ? text.slice(0, maxLength) + '...' : text;
};

const deleteLog = (id: number) => {
    if (confirm('Apakah Anda yakin ingin menghapus log ini?')) {
        router.delete(`/admin/chat-logs/${id}`);
    }
};

const deleteAllLogs = () => {
    if (
        confirm(
            'Apakah Anda yakin ingin menghapus SEMUA log? Tindakan ini tidak dapat dibatalkan!',
        )
    ) {
        router.delete('/admin/chat-logs');
    }
};

const breadcrumbs = [
    { title: 'Admin Dashboard', href: '/admin/dashboard' },
    { title: 'Log Chat AI', href: '/admin/chat-logs' },
];
</script>

<template>
    <Head title="Log Chat AI" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <!-- Statistics Cards -->
            <div class="grid grid-cols-2 gap-4 md:grid-cols-3 lg:grid-cols-6">
                <Card>
                    <CardContent class="p-4">
                        <div class="flex items-center gap-3">
                            <div
                                class="flex size-10 items-center justify-center rounded-lg bg-blue-100"
                            >
                                <MessageSquare class="size-5 text-blue-600" />
                            </div>
                            <div>
                                <p class="text-2xl font-bold">
                                    {{ stats.total }}
                                </p>
                                <p class="text-xs text-muted-foreground">
                                    Total Log
                                </p>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardContent class="p-4">
                        <div class="flex items-center gap-3">
                            <div
                                class="flex size-10 items-center justify-center rounded-lg bg-green-100"
                            >
                                <MessageSquare class="size-5 text-green-600" />
                            </div>
                            <div>
                                <p class="text-2xl font-bold">
                                    {{ stats.today }}
                                </p>
                                <p class="text-xs text-muted-foreground">
                                    Hari Ini
                                </p>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardContent class="p-4">
                        <div class="flex items-center gap-3">
                            <div
                                class="flex size-10 items-center justify-center rounded-lg bg-purple-100"
                            >
                                <Database class="size-5 text-purple-600" />
                            </div>
                            <div>
                                <p class="text-2xl font-bold">
                                    {{ stats.database_responses }}
                                </p>
                                <p class="text-xs text-muted-foreground">
                                    Dari Database
                                </p>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardContent class="p-4">
                        <div class="flex items-center gap-3">
                            <div
                                class="flex size-10 items-center justify-center rounded-lg bg-blue-100"
                            >
                                <Globe class="size-5 text-blue-600" />
                            </div>
                            <div>
                                <p class="text-2xl font-bold">
                                    {{ stats.api_responses }}
                                </p>
                                <p class="text-xs text-muted-foreground">
                                    Dari API
                                </p>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardContent class="p-4">
                        <div class="flex items-center gap-3">
                            <div
                                class="flex size-10 items-center justify-center rounded-lg bg-red-100"
                            >
                                <XCircle class="size-5 text-red-600" />
                            </div>
                            <div>
                                <p class="text-2xl font-bold">
                                    {{ stats.failed }}
                                </p>
                                <p class="text-xs text-muted-foreground">
                                    Gagal
                                </p>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardContent class="p-4">
                        <div class="flex items-center gap-3">
                            <div
                                class="flex size-10 items-center justify-center rounded-lg bg-yellow-100"
                            >
                                <Clock class="size-5 text-yellow-600" />
                            </div>
                            <div>
                                <p class="text-2xl font-bold">
                                    {{ stats.avg_response_time }}ms
                                </p>
                                <p class="text-xs text-muted-foreground">
                                    Avg Response
                                </p>
                            </div>
                        </div>
                    </CardContent>
                </Card>
            </div>

            <!-- Main Content -->
            <Card>
                <CardHeader>
                    <div class="flex items-center justify-between">
                        <div>
                            <CardTitle>Log Chat AI</CardTitle>
                            <CardDescription>
                                Riwayat percakapan dengan chatbot AI
                            </CardDescription>
                        </div>
                        <Button
                            variant="destructive"
                            size="sm"
                            class="gap-2"
                            @click="deleteAllLogs"
                            v-if="stats.total > 0"
                        >
                            <Trash2 class="size-4" />
                            Hapus Semua
                        </Button>
                    </div>
                </CardHeader>
                <CardContent>
                    <!-- Filters -->
                    <div class="mb-6 flex flex-wrap gap-4">
                        <div class="flex items-center gap-2">
                            <Input
                                v-model="search"
                                placeholder="Cari pesan..."
                                class="w-64"
                                @keyup.enter="applyFilters"
                            />
                            <Button
                                size="icon"
                                variant="outline"
                                @click="applyFilters"
                            >
                                <Search class="size-4" />
                            </Button>
                        </div>

                        <select
                            v-model="provider"
                            class="rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                        >
                            <option value="all">Semua Provider</option>
                            <option value="database">Database</option>
                            <option value="openrouter">API (OpenRouter)</option>
                            <option value="rejection">Rejection</option>
                        </select>

                        <select
                            v-model="status"
                            class="rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                        >
                            <option value="all">Semua Status</option>
                            <option value="success">Sukses</option>
                            <option value="failed">Gagal</option>
                        </select>

                        <Input
                            v-model="dateFrom"
                            type="date"
                            class="w-40"
                            placeholder="Dari tanggal"
                            @change="applyFilters"
                        />

                        <Input
                            v-model="dateTo"
                            type="date"
                            class="w-40"
                            placeholder="Sampai tanggal"
                            @change="applyFilters"
                        />

                        <select
                            v-model="perPage"
                            class="rounded-md border border-input bg-transparent px-3 py-2 text-sm"
                        >
                            <option :value="15">15 per halaman</option>
                            <option :value="25">25 per halaman</option>
                            <option :value="50">50 per halaman</option>
                            <option :value="100">100 per halaman</option>
                            <option :value="200">200 per halaman</option>
                            <option :value="500">500 per halaman</option>
                            <option :value="1000">1000 per halaman</option>
                        </select>
                    </div>

                    <!-- Table -->
                    <div class="overflow-x-auto rounded-lg border">
                        <table class="w-full text-sm">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Waktu
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        User
                                    </th>

                                    <th class="px-4 py-3 text-left font-medium">
                                        IP
                                    </th>
                                    <th
                                        class="min-w-[250px] px-4 py-3 text-left font-medium"
                                    >
                                        Input
                                    </th>
                                    <th
                                        class="min-w-[300px] px-4 py-3 text-left font-medium"
                                    >
                                        Response
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Provider
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Response Time
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Status
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Aksi
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="divide-y">
                                <tr
                                    v-for="log in logs.data"
                                    :key="log.id"
                                    class="hover:bg-gray-50"
                                >
                                    <td
                                        class="px-4 py-3 text-xs whitespace-nowrap text-gray-500"
                                    >
                                        {{ formatDate(log.created_at) }}
                                    </td>
                                    <td class="px-4 py-3">
                                        <div
                                            v-if="log.user"
                                            class="flex flex-col"
                                        >
                                            <span class="font-medium">{{
                                                log.user.name
                                            }}</span>
                                            <span
                                                class="text-xs text-gray-500"
                                                >{{ log.user.email }}</span
                                            >
                                        </div>
                                        <span v-else class="text-gray-400"
                                            >Guest</span
                                        >
                                    </td>
                                    <td class="px-4 py-3">
                                        {{ log.ip_address }}
                                    </td>
                                    <td class="px-4 py-3">
                                        <p
                                            class="text-sm whitespace-pre-wrap"
                                            :title="log.user_input"
                                        >
                                            {{
                                                truncateText(
                                                    log.user_input,
                                                    150,
                                                )
                                            }}
                                        </p>
                                    </td>
                                    <td class="px-4 py-3">
                                        <p
                                            class="text-sm whitespace-pre-wrap text-gray-600"
                                            :title="log.ai_response"
                                        >
                                            {{
                                                truncateText(
                                                    log.ai_response,
                                                    200,
                                                )
                                            }}
                                        </p>
                                    </td>
                                    <td class="px-4 py-3">
                                        <Badge
                                            :variant="
                                                getProviderBadge(log.provider)
                                                    .variant
                                            "
                                        >
                                            {{
                                                getProviderBadge(log.provider)
                                                    .label
                                            }}
                                        </Badge>
                                    </td>
                                    <td class="px-4 py-3 text-center">
                                        <span
                                            v-if="log.response_time_ms"
                                            class="font-mono text-xs"
                                        >
                                            {{ log.response_time_ms }}ms
                                        </span>
                                        <span v-else class="text-gray-400"
                                            >-</span
                                        >
                                    </td>
                                    <td class="px-4 py-3">
                                        <Badge
                                            :variant="
                                                log.is_successful
                                                    ? 'default'
                                                    : 'destructive'
                                            "
                                        >
                                            {{
                                                log.is_successful
                                                    ? 'Sukses'
                                                    : 'Gagal'
                                            }}
                                        </Badge>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="flex gap-1">
                                            <Button
                                                variant="ghost"
                                                size="icon"
                                                class="text-blue-500 hover:bg-blue-50 hover:text-blue-700"
                                                @click="openDetail(log)"
                                                title="Lihat Detail"
                                            >
                                                <Eye class="size-4" />
                                            </Button>
                                            <Button
                                                variant="ghost"
                                                size="icon"
                                                class="text-red-500 hover:bg-red-50 hover:text-red-700"
                                                @click="deleteLog(log.id)"
                                                title="Hapus"
                                            >
                                                <Trash2 class="size-4" />
                                            </Button>
                                        </div>
                                    </td>
                                </tr>
                                <tr v-if="logs.data.length === 0">
                                    <td
                                        colspan="9"
                                        class="px-4 py-8 text-center text-gray-500"
                                    >
                                        Tidak ada log chat
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <div
                        v-if="logs.last_page > 1"
                        class="mt-4 flex items-center justify-between"
                    >
                        <p class="text-sm text-gray-500">
                            Halaman {{ logs.current_page }} dari
                            {{ logs.last_page }} ({{ logs.total }} log)
                        </p>
                        <div class="flex gap-1">
                            <template
                                v-for="link in logs.links"
                                :key="link.label"
                            >
                                <Button
                                    v-if="link.url"
                                    as-child
                                    variant="outline"
                                    size="sm"
                                    :class="{
                                        'bg-primary text-primary-foreground':
                                            link.active,
                                    }"
                                >
                                    <Link :href="link.url">
                                        <span v-html="link.label" />
                                    </Link>
                                </Button>
                            </template>
                        </div>
                    </div>
                </CardContent>
            </Card>
        </div>

        <!-- Detail Modal -->
        <Dialog v-model:open="showDetailModal">
            <DialogContent class="max-h-[90vh] max-w-3xl overflow-y-auto">
                <DialogHeader>
                    <DialogTitle class="flex items-center gap-2">
                        <MessageSquare class="size-5" />
                        Detail Log Chat
                    </DialogTitle>
                    <DialogDescription>
                        Log ID: #{{ selectedLog?.id }}
                    </DialogDescription>
                </DialogHeader>

                <div v-if="selectedLog" class="space-y-6">
                    <!-- Info Grid -->
                    <div class="grid grid-cols-2 gap-4">
                        <div class="space-y-1">
                            <p
                                class="text-sm font-medium text-muted-foreground"
                            >
                                Waktu
                            </p>
                            <p class="text-sm">
                                {{ formatDateFull(selectedLog.created_at) }}
                            </p>
                        </div>
                        <div class="space-y-1">
                            <p
                                class="text-sm font-medium text-muted-foreground"
                            >
                                User
                            </p>
                            <p v-if="selectedLog.user" class="text-sm">
                                {{ selectedLog.user.name }} ({{
                                    selectedLog.user.email
                                }})
                            </p>
                            <p v-else class="text-sm text-gray-400">Guest</p>
                        </div>
                        <div class="space-y-1">
                            <p
                                class="text-sm font-medium text-muted-foreground"
                            >
                                IP Address
                            </p>
                            <p class="font-mono text-sm">
                                {{ selectedLog.ip_address || '-' }}
                            </p>
                        </div>
                        <div class="space-y-1">
                            <p
                                class="text-sm font-medium text-muted-foreground"
                            >
                                Session ID
                            </p>
                            <p class="font-mono text-xs break-all">
                                {{ selectedLog.session_id || '-' }}
                            </p>
                        </div>
                        <div class="space-y-1">
                            <p
                                class="text-sm font-medium text-muted-foreground"
                            >
                                Provider
                            </p>
                            <Badge
                                :variant="
                                    getProviderBadge(selectedLog.provider)
                                        .variant
                                "
                            >
                                {{
                                    getProviderBadge(selectedLog.provider).label
                                }}
                            </Badge>
                        </div>
                        <div class="space-y-1">
                            <p
                                class="text-sm font-medium text-muted-foreground"
                            >
                                Response Time
                            </p>
                            <p class="font-mono text-sm">
                                {{
                                    selectedLog.response_time_ms
                                        ? `${selectedLog.response_time_ms}ms`
                                        : '-'
                                }}
                            </p>
                        </div>
                        <div class="space-y-1">
                            <p
                                class="text-sm font-medium text-muted-foreground"
                            >
                                Status
                            </p>
                            <Badge
                                :variant="
                                    selectedLog.is_successful
                                        ? 'default'
                                        : 'destructive'
                                "
                            >
                                {{
                                    selectedLog.is_successful
                                        ? 'Sukses'
                                        : 'Gagal'
                                }}
                            </Badge>
                        </div>
                    </div>

                    <!-- User Input -->
                    <div class="space-y-2">
                        <p class="text-sm font-medium text-muted-foreground">
                            Input User
                        </p>
                        <div
                            class="rounded-lg border bg-blue-50 p-4 dark:bg-blue-950"
                        >
                            <p class="text-sm whitespace-pre-wrap">
                                {{ selectedLog.user_input }}
                            </p>
                        </div>
                    </div>

                    <!-- AI Response -->
                    <div class="space-y-2">
                        <p class="text-sm font-medium text-muted-foreground">
                            Response AI
                        </p>
                        <div
                            class="rounded-lg border bg-gray-50 p-4 dark:bg-gray-900"
                        >
                            <p class="text-sm whitespace-pre-wrap">
                                {{ selectedLog.ai_response }}
                            </p>
                        </div>
                    </div>

                    <!-- Error Message (if any) -->
                    <div v-if="selectedLog.error_message" class="space-y-2">
                        <p class="text-sm font-medium text-red-600">
                            Error Message
                        </p>
                        <div
                            class="rounded-lg border border-red-200 bg-red-50 p-4 dark:bg-red-950"
                        >
                            <p class="text-sm whitespace-pre-wrap text-red-700">
                                {{ selectedLog.error_message }}
                            </p>
                        </div>
                    </div>
                </div>
            </DialogContent>
        </Dialog>
    </AppLayout>
</template>
