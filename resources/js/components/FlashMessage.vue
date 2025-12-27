<script setup lang="ts">
import { usePage } from '@inertiajs/vue3';
import { CheckCircle, XCircle, AlertTriangle, Info, X } from 'lucide-vue-next';
import { computed, ref, watch } from 'vue';

interface Flash {
    success?: string | null;
    error?: string | null;
    warning?: string | null;
    info?: string | null;
}

const page = usePage();
const flash = computed(() => page.props.flash as Flash);
const visible = ref(false);
const currentMessage = ref<{ type: string; message: string } | null>(null);

const icons = {
    success: CheckCircle,
    error: XCircle,
    warning: AlertTriangle,
    info: Info,
};

const colors = {
    success: 'bg-green-50 border-green-500 text-green-800',
    error: 'bg-red-50 border-red-500 text-red-800',
    warning: 'bg-yellow-50 border-yellow-500 text-yellow-800',
    info: 'bg-blue-50 border-blue-500 text-blue-800',
};

const iconColors = {
    success: 'text-green-500',
    error: 'text-red-500',
    warning: 'text-yellow-500',
    info: 'text-blue-500',
};

const showFlash = () => {
    const types: (keyof Flash)[] = ['success', 'error', 'warning', 'info'];
    for (const type of types) {
        if (flash.value?.[type]) {
            currentMessage.value = { type, message: flash.value[type]! };
            visible.value = true;

            // Auto hide after 5 seconds (except error)
            if (type !== 'error') {
                setTimeout(() => {
                    visible.value = false;
                }, 5000);
            }
            break;
        }
    }
};

const close = () => {
    visible.value = false;
};

watch(flash, showFlash, { immediate: true, deep: true });
</script>

<template>
    <Teleport to="body">
        <Transition
            enter-active-class="transition ease-out duration-300"
            enter-from-class="translate-y-[-100%] opacity-0"
            enter-to-class="translate-y-0 opacity-100"
            leave-active-class="transition ease-in duration-200"
            leave-from-class="translate-y-0 opacity-100"
            leave-to-class="translate-y-[-100%] opacity-0"
        >
            <div
                v-if="visible && currentMessage"
                class="fixed top-4 right-4 z-100 max-w-md"
            >
                <div
                    :class="[
                        'flex items-start gap-3 rounded-lg border p-4 shadow-lg',
                        colors[currentMessage.type as keyof typeof colors],
                    ]"
                >
                    <component
                        :is="icons[currentMessage.type as keyof typeof icons]"
                        :class="['size-5 shrink-0', iconColors[currentMessage.type as keyof typeof iconColors]]"
                    />
                    <p class="flex-1 text-sm font-medium">{{ currentMessage.message }}</p>
                    <button
                        @click="close"
                        class="shrink-0 rounded p-1 hover:bg-black/5"
                    >
                        <X class="size-4" />
                    </button>
                </div>
            </div>
        </Transition>
    </Teleport>
</template>
