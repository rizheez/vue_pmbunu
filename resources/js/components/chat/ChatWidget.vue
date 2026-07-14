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
import { usePage } from '@inertiajs/vue3';
import sanitizeHtml from 'sanitize-html';
import { computed, nextTick, ref, watch } from 'vue';

interface Message {
    role: 'user' | 'assistant';
    content: string;
}

const CHAT_TYPE_SPEED_MS = 5;

const isOpen = ref(false);
const isMenuOpen = ref(false);
const inputMessage = ref('');
const messages = ref<Message[]>([]);
const isLoading = ref(false);
const messagesContainer = ref<HTMLElement | null>(null);

const page = usePage();

const whatsappUrl = computed(() => {
    const rawPhone = (page.props.contact_phone as string) || '628125317738';
    let cleanPhone = rawPhone.replace(/\D/g, ''); // keep only digits
    if (cleanPhone.startsWith('0')) {
        cleanPhone = '62' + cleanPhone.slice(1);
    }
    return `https://wa.me/${cleanPhone}?text=Halo%20Panitia%20PMB%20UNU%20Kaltim`;
});

const canSend = computed(() => inputMessage.value.trim() && !isLoading.value);

function toggleChat() {
    isOpen.value = !isOpen.value;
    if (isOpen.value) {
        isMenuOpen.value = false;
    }
}

function toggleMenu() {
    isMenuOpen.value = !isMenuOpen.value;
    if (isMenuOpen.value) {
        isOpen.value = false;
    }
}

function openChatbot() {
    isOpen.value = true;
    isMenuOpen.value = false;
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
            v-if="!isOpen && !isMenuOpen"
            size="lg"
            class="h-14 w-14 rounded-full bg-gradient-to-r from-emerald-600 to-teal-600 shadow-lg transition-all duration-300 hover:from-emerald-700 hover:to-teal-700 hover:shadow-xl"
            @click="toggleMenu"
        >
            <MessageCircle class="h-6 w-6" />
        </Button>

        <!-- Kontak Kami (Contact Menu) -->
        <Transition
            enter-active-class="transition-all duration-300 ease-out"
            enter-from-class="opacity-0 scale-95 translate-y-4"
            enter-to-class="opacity-100 scale-100 translate-y-0"
            leave-active-class="transition-all duration-200 ease-in"
            leave-from-class="opacity-100 scale-100 translate-y-0"
            leave-to-class="opacity-0 scale-95 translate-y-4"
        >
            <div
                v-if="isMenuOpen"
                class="absolute right-0 bottom-0 flex w-[360px] max-w-[calc(100vw-3rem)] flex-col overflow-hidden rounded-2xl border border-gray-200 bg-[#f4f5f7] shadow-2xl dark:border-gray-700 dark:bg-gray-900"
            >
                <!-- Header -->
                <div
                    class="flex items-center justify-between bg-gradient-to-r from-emerald-600 to-teal-600 px-5 py-4 text-white"
                >
                    <div class="flex items-center gap-3">
                        <!-- Winking Agent SVG -->
                        <svg viewBox="0 0 100 100" class="h-14 w-14 rounded-full border-2 border-white bg-emerald-100 shadow-md">
                            <!-- Face -->
                            <circle cx="50" cy="50" r="35" fill="#FFE0BD" />
                            <!-- Hair -->
                            <path d="M15,50 C15,20 85,20 85,50 C85,30 15,30 15,50 Z" fill="#1C1C1C" />
                            <path d="M15,50 C15,80 25,80 25,50 C25,35 15,35 15,50 Z" fill="#1C1C1C" />
                            <path d="M85,50 C85,80 75,80 75,50 C75,35 85,35 85,50 Z" fill="#1C1C1C" />
                            <!-- Left Eye (Winking) -->
                            <path d="M35,48 Q40,43 45,48" stroke="#1C1C1C" stroke-width="3" stroke-linecap="round" fill="none" />
                            <!-- Right Eye (Open) -->
                            <circle cx="65" cy="46" r="3.5" fill="#1C1C1C" />
                            <path d="M60,40 Q65,37 70,40" stroke="#1C1C1C" stroke-width="2" stroke-linecap="round" fill="none" />
                            <!-- Smile -->
                            <path d="M42,62 Q50,69 58,62" stroke="#FF6B6B" stroke-width="3" stroke-linecap="round" fill="none" />
                            <!-- Cheeks -->
                            <circle cx="32" cy="54" r="4" fill="#FF8E8E" opacity="0.6" />
                            <circle cx="68" cy="54" r="4" fill="#FF8E8E" opacity="0.6" />
                            <!-- Headset -->
                            <rect x="18" y="42" width="6" height="12" rx="3" fill="#333" />
                            <rect x="76" y="42" width="6" height="12" rx="3" fill="#333" />
                            <path d="M21,42 A29,29 0 0,1 79,42" stroke="#333" stroke-width="3" fill="none" />
                            <path d="M21,50 Q25,62 38,62" stroke="#333" stroke-width="2" stroke-linecap="round" fill="none" />
                        </svg>
                        <div>
                            <h3 class="text-base font-bold tracking-wide">Kontak Kami</h3>
                            <p class="text-xs text-white/90">Hubungi kami untuk segala pertanyaan Anda!</p>
                        </div>
                    </div>
                    <Button
                        variant="ghost"
                        size="icon"
                        class="h-8 w-8 text-white/80 hover:bg-white/20 hover:text-white"
                        @click="toggleMenu"
                    >
                        <X class="h-5 w-5" />
                    </Button>
                </div>

                <!-- Body (Option List) -->
                <div class="p-4 space-y-3">
                    <!-- Option 1: AI Chatbot -->
                    <button
                        @click="openChatbot"
                        class="w-full flex items-center gap-4 bg-white dark:bg-gray-800 p-4 rounded-xl border border-gray-100 dark:border-gray-700 hover:translate-x-1 hover:shadow-md transition-all duration-200 text-left group"
                    >
                        <div class="rounded-full bg-emerald-50 dark:bg-emerald-950 p-2.5 text-emerald-600 dark:text-emerald-400 group-hover:bg-emerald-100">
                            <Bot class="h-5 w-5" />
                        </div>
                        <div class="flex-1">
                            <p class="text-xs text-gray-400 dark:text-gray-500 font-semibold uppercase tracking-wider">Asisten Virtual AI</p>
                            <p class="font-bold text-sm text-gray-800 dark:text-gray-100 group-hover:text-emerald-600 dark:group-hover:text-emerald-400">Chat with Us</p>
                        </div>
                    </button>

                    <!-- Option 2: WhatsApp -->
                    <a
                        :href="whatsappUrl"
                        target="_blank"
                        rel="noopener noreferrer"
                        class="flex items-center gap-4 bg-white dark:bg-gray-800 p-4 rounded-xl border border-gray-100 dark:border-gray-700 hover:translate-x-1 hover:shadow-md transition-all duration-200 group"
                    >
                        <div class="rounded-full bg-green-50 dark:bg-green-950 p-2.5 text-green-600 dark:text-green-400 group-hover:bg-green-100">
                            <!-- WhatsApp Custom SVG -->
                            <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 24 24">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M12.028 0C5.372 0 0 5.404 0 12.09c0 2.137.554 4.22 1.61 6.067L.03 24l6.012-1.587c1.782.978 3.784 1.493 5.818 1.496h.005c6.654 0 12.026-5.404 12.026-12.09A12.16 12.16 0 0012.028 0zm6.602 17.147c-.29.82-.44.832-1.768.283-1.328-.549-3.237-1.393-4.542-2.502a11.135 11.135 0 01-3.076-4.053c-.328-.58-.584-.694-.584-.694s.18-.21.285-.328c.105-.118.423-.5.423-.765 0-.265-.105-.706-.212-.97-.105-.265-.953-2.324-1.323-3.155-.37-.83-.755-.83-.974-.83h-.543c-.424 0-.82.162-1.127.47-.307.308-1.18 1.155-1.18 2.812 0 1.657 1.2 3.255 1.365 3.479.164.224 2.36 3.626 5.717 5.08 2.812 1.218 3.823 1.156 4.606 1.018a3.52 3.52 0 002.324-1.642c.243-.48.243-.892.17-.976-.073-.083-.275-.138-.567-.28z"/>
                            </svg>
                        </div>
                        <div class="flex-1">
                            <p class="text-xs text-gray-400 dark:text-gray-500 font-semibold uppercase tracking-wider">Chat WhatsApp</p>
                            <p class="font-bold text-sm text-gray-800 dark:text-gray-100 group-hover:text-green-600 dark:group-hover:text-green-400">Chat via Whatsapp</p>
                        </div>
                    </a>
                </div>
            </div>
        </Transition>

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
                            <div
                                v-if="msg.role === 'assistant'"
                                v-html="formatMarkdown(msg.content)"
                            ></div>
                            <div v-else class="whitespace-pre-wrap">{{ msg.content }}</div>
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
