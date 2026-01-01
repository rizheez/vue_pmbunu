<script setup lang="ts">
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuGroup,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import { Link, usePage } from '@inertiajs/vue3';
import { Bell, FileText, CreditCard } from 'lucide-vue-next';
import { computed } from 'vue';

const page = usePage();

// Computed property to safely access pending counts
const pendingCounts = computed(() => {
    return page.props.pending_counts as { documents: number; payments: number } | null;
});

// Calculate total pending items
const totalPending = computed(() => {
    if (!pendingCounts.value) return 0;
    return (pendingCounts.value.documents || 0) + (pendingCounts.value.payments || 0);
});
</script>

<template>
    <DropdownMenu v-if="pendingCounts">
        <DropdownMenuTrigger as-child>
            <Button variant="ghost" size="icon" class="relative">
                <Bell class="size-5" />
                <span
                    v-if="totalPending > 0"
                    class="absolute -right-1 -top-1 flex size-5 items-center justify-center rounded-full bg-red-500 text-[10px] font-bold text-white shadow-sm"
                >
                    {{ totalPending > 99 ? '99+' : totalPending }}
                </span>
                <span class="sr-only">Notifikasi</span>
            </Button>
        </DropdownMenuTrigger>
        <DropdownMenuContent class="w-64" align="end">
            <DropdownMenuLabel>Notifikasi</DropdownMenuLabel>
            <DropdownMenuSeparator />
            <DropdownMenuGroup v-if="totalPending > 0">
                <DropdownMenuItem as-child v-if="pendingCounts.documents > 0">
                    <Link href="/admin/students" class="flex w-full cursor-pointer items-center justify-between">
                        <div class="flex items-center gap-2">
                            <FileText class="size-4 text-blue-500" />
                            <span>Verifikasi Dokumen</span>
                        </div>
                        <Badge variant="secondary" class="bg-blue-100 text-blue-700 hover:bg-blue-100">
                            {{ pendingCounts.documents }}
                        </Badge>
                    </Link>
                </DropdownMenuItem>

                <DropdownMenuItem as-child v-if="pendingCounts.payments > 0">
                    <Link href="/admin/reregistration" class="flex w-full cursor-pointer items-center justify-between">
                        <div class="flex items-center gap-2">
                            <CreditCard class="size-4 text-orange-500" />
                            <span>Verifikasi Pembayaran</span>
                        </div>
                        <Badge variant="secondary" class="bg-orange-100 text-orange-700 hover:bg-orange-100">
                            {{ pendingCounts.payments }}
                        </Badge>
                    </Link>
                </DropdownMenuItem>
            </DropdownMenuGroup>
            <div v-else class="p-4 text-center text-sm text-muted-foreground">
                Tidak ada notifikasi baru
            </div>
        </DropdownMenuContent>
    </DropdownMenu>
</template>
