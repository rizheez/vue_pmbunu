<script setup lang="ts">
import { send } from '@/actions/App/Http/Controllers/Api/ChatController';
import { Button } from '@/components/ui/button';
import {
    Bot,
    Loader2,
    MessageCircle,
    Send,
    Trash2,
    User,
    X,
} from 'lucide-vue-next';
import TypeWriter from '@/components/ui/TypeWriter.vue';
import sanitizeHtml from 'sanitize-html';
import { computed, nextTick, ref, watch } from 'vue';

interface Message {
    role: 'user' | 'assistant';
    content: string;
}

const isOpen = ref(false);
const inputMessage = ref('');
const messages = ref<Message[]>([]);
const isLoading = ref(false);
const messagesContainer = ref<HTMLElement | null>(null);

const canSend = computed(() => inputMessage.value.trim() && !isLoading.value);

function toggleChat() {
    isOpen.value = !isOpen.value;
}

function clearChat() {
    messages.value = [];
}

async function sendMessage() {
    const message = inputMessage.value.trim();
    if (!message || isLoading.value) return;

    // Add user message
    messages.value.push({ role: 'user', content: message });
    inputMessage.value = '';
    isLoading.value = true;
    scrollToBottom();

    try {
        const response = await fetch(send.url(), {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                Accept: 'application/json',
                'X-XSRF-TOKEN': getCsrfToken(),
            },
            credentials: 'include',
            body: JSON.stringify({
                message,
                history: messages.value.slice(-5), // Send last 5 messages for context (optimized)
            }),
        });

        const data = await response.json();

        if (data.success) {
            messages.value.push({ role: 'assistant', content: data.message });
        } else {
            messages.value.push({
                role: 'assistant',
                content: 'Maaf, terjadi kesalahan. Silakan coba lagi.',
            });
        }
    } catch {
        messages.value.push({
            role: 'assistant',
            content:
                'Maaf, tidak dapat terhubung ke server. Silakan coba lagi.',
        });
    } finally {
        isLoading.value = false;
        scrollToBottom();
    }
}

function getCsrfToken(): string {
    const cookies = document.cookie.split(';');
    for (const cookie of cookies) {
        const [name, value] = cookie.trim().split('=');
        if (name === 'XSRF-TOKEN') {
            return decodeURIComponent(value);
        }
    }
    return '';
}

function scrollToBottom() {
    nextTick(() => {
        if (messagesContainer.value) {
            messagesContainer.value.scrollTop =
                messagesContainer.value.scrollHeight;
        }
    });
}

function handleKeydown(e: KeyboardEvent) {
    if (e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault();
        sendMessage();
    }
}

watch(isOpen, (open) => {
    if (open && messages.value.length === 0) {
        messages.value.push({
            role: 'assistant',
            content:
                'Halo! 👋 Saya asisten virtual PMB UNU Kaltim. Ada yang bisa saya bantu tentang pendaftaran mahasiswa baru?',
        });
    }
});

function formatMarkdown(content: string) {
    let formatted = content;

    // Bold: **teks**
    formatted = formatted.replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>');

    // Link markdown: [text](url)
    formatted = formatted.replace(
        /\[([^\]]+)\]\((https?:\/\/[^\s)]+)\)/g,
        '<a href="$2">$1</a>',
    );

    // URL polos → <a>
    formatted = formatted.replace(
        /(?<!href=")(https?:\/\/[^\s<]+)/g,
        '<a href="$1">$1</a>',
    );

    // Newline → <br>
    formatted = formatted.replace(/\n/g, '<br>');

    // Sanitize HTML
    formatted = sanitizeHtml(formatted, {
        allowedTags: [
            'a',
            'b',
            'p',
            'i',
            'em',
            'strong',
            'blockquote',
            'big',
            'small',
            'div',
            'br',
            'hr',
            'li',
            'ol',
            'ul',
            'table',
            'tbody',
            'thead',
            'td',
            'th',
            'tr',
            'caption',
            'span',
        ],
        allowedAttributes: {
            a: ['href', 'target', 'rel', 'class'],
        },
        transformTags: {
            a: (tagName, attribs) => {
                if (attribs) {
                    attribs.target = '_blank';
                    attribs.rel = 'noopener noreferrer';
                    attribs.class = 'text-blue-500 hover:underline';
                }
                return { tagName, attribs };
            },
        },
    });

    return formatted;
}


</script>

<template>
    <!-- Floating Button -->
    <div class="fixed right-6 bottom-6 z-50">
        <Button
            v-if="!isOpen"
            size="lg"
            class="h-14 w-14 rounded-full bg-gradient-to-r from-emerald-600 to-teal-600 shadow-lg transition-all duration-300 hover:from-emerald-700 hover:to-teal-700 hover:shadow-xl"
            @click="toggleChat"
        >
            <MessageCircle class="h-6 w-6" />
        </Button>

        <!-- Chat Window -->
        <Transition
            enter-active-class="transition-all duration-300 ease-out"
            enter-from-class="opacity-0 scale-95 translate-y-4"
            enter-to-class="opacity-100 scale-100 translate-y-0"
            leave-active-class="transition-all duration-200 ease-in"
            leave-from-class="opacity-100 scale-100 translate-y-0"
            leave-to-class="opacity-0 scale-95 translate-y-4"
        >
            <div
                v-if="isOpen"
                class="absolute right-0 bottom-0 flex h-[500px] w-[380px] max-w-[calc(100vw-3rem)] flex-col overflow-hidden rounded-2xl border border-gray-200 bg-white shadow-2xl dark:border-gray-700 dark:bg-gray-900"
            >
                <!-- Header -->
                <div
                    class="flex items-center justify-between bg-gradient-to-r from-emerald-600 to-teal-600 px-4 py-3 text-white"
                >
                    <div class="flex items-center gap-3">
                        <div class="rounded-full bg-white/20 p-2">
                            <Bot class="h-5 w-5" />
                        </div>
                        <div>
                            <h3 class="text-sm font-semibold">Asisten PMB</h3>
                            <p class="text-xs text-white/80">UNU Kaltim</p>
                        </div>
                    </div>
                    <div class="flex items-center gap-1">
                        <Button
                            variant="ghost"
                            size="icon"
                            class="h-8 w-8 text-white/80 hover:bg-white/20 hover:text-white"
                            @click="clearChat"
                            title="Hapus percakapan"
                        >
                            <Trash2 class="h-4 w-4" />
                        </Button>
                        <Button
                            variant="ghost"
                            size="icon"
                            class="h-8 w-8 text-white/80 hover:bg-white/20 hover:text-white"
                            @click="toggleChat"
                        >
                            <X class="h-5 w-5" />
                        </Button>
                    </div>
                </div>

                <!-- Messages -->
                <div
                    ref="messagesContainer"
                    class="flex-1 space-y-4 overflow-y-auto p-4"
                >
                    <div
                        v-for="(msg, index) in messages"
                        :key="index"
                        :class="[
                            'flex gap-2',
                            msg.role === 'user'
                                ? 'justify-end'
                                : 'justify-start',
                        ]"
                    >
                        <!-- Bot Avatar -->
                        <div
                            v-if="msg.role === 'assistant'"
                            class="flex h-8 w-8 flex-shrink-0 items-center justify-center rounded-full bg-gradient-to-r from-emerald-500 to-teal-500"
                        >
                            <Bot class="h-4 w-4 text-white" />
                        </div>

                        <!-- Message Bubble -->
                        <div
                            :class="[
                                'max-w-[75%] rounded-2xl px-4 py-2.5 text-sm break-words whitespace-pre-wrap',
                                msg.role === 'user'
                                    ? 'rounded-br-md bg-gradient-to-r from-emerald-600 to-teal-600 text-white'
                                    : 'rounded-bl-md bg-gray-100 text-gray-900 dark:bg-gray-800 dark:text-gray-100',
                            ]"
                            style="overflow-wrap: anywhere"
                        >
                            <TypeWriter
                                v-if="msg.role === 'assistant'"
                                :content="formatMarkdown(msg.content)"
                                :show-cursor="false"
                                :type-speed="20"
                            />
                            <div
                                v-else
                                v-html="msg.content"
                            ></div>
                        </div>

                        <!-- User Avatar -->
                        <div
                            v-if="msg.role === 'user'"
                            class="flex h-8 w-8 flex-shrink-0 items-center justify-center rounded-full bg-gray-300 dark:bg-gray-600"
                        >
                            <User
                                class="h-4 w-4 text-gray-600 dark:text-gray-300"
                            />
                        </div>
                    </div>

                    <!-- Loading Indicator -->
                    <div v-if="isLoading" class="flex justify-start gap-2">
                        <div
                            class="flex h-8 w-8 flex-shrink-0 items-center justify-center rounded-full bg-gradient-to-r from-emerald-500 to-teal-500"
                        >
                            <Bot class="h-4 w-4 text-white" />
                        </div>
                        <div
                            class="flex items-center gap-2 rounded-2xl rounded-bl-md bg-gray-100 px-4 py-2.5 dark:bg-gray-800"
                        >
                            <Loader2
                                class="h-4 w-4 animate-spin text-emerald-600"
                            />
                            <span class="text-sm text-gray-500"
                                >Mengetik...</span
                            >
                        </div>
                    </div>
                </div>

                <!-- Input -->
                <div class="border-t border-gray-200 p-4 dark:border-gray-700">
                    <div class="flex gap-2">
                        <textarea
                            v-model="inputMessage"
                            placeholder="Ketik pesan..."
                            rows="1"
                            class="flex-1 resize-none rounded-xl border border-gray-300 bg-gray-50 px-4 py-2.5 text-sm focus:ring-2 focus:ring-emerald-500 focus:outline-none dark:border-gray-600 dark:bg-gray-800 dark:text-white"
                            @keydown="handleKeydown"
                        />
                        <Button
                            :disabled="!canSend"
                            class="h-10 w-10 rounded-xl bg-gradient-to-r from-emerald-600 to-teal-600 hover:from-emerald-700 hover:to-teal-700 disabled:opacity-50"
                            @click="sendMessage"
                        >
                            <Send class="h-4 w-4" />
                        </Button>
                    </div>
                </div>
            </div>
        </Transition>
    </div>
</template>
