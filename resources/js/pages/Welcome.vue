<script setup lang="ts">
import ChatWidget from '@/components/chat/ChatWidget.vue';
import TypeWriter from '@/components/ui/TypeWriter.vue';
import { Button } from '@/components/ui/button';
import { formatDate } from '@/composables/useFormat';
import type { Fakultas, RegistrationPeriod } from '@/types/pmb';
import { Head, Link, usePage } from '@inertiajs/vue3';
import {
    Award,
    BookOpen,
    Bot,
    Building2,
    CheckCircle,
    ChevronDown,
    ClipboardCheck,
    Facebook,
    FileText,
    Globe,
    GraduationCap,
    Instagram,
    Mail,
    MapPin,
    Menu,
    MessageCircle,
    Phone,
    ShieldCheck,
    UserPlus,
    Users,
    X,
} from 'lucide-vue-next';
import { computed, ref } from 'vue';

interface Settings {
    hero?: Record<string, string | null>;
    features?: Record<string, string | null>;
    about?: Record<string, string | null>;
    contact?: Record<string, string | null>;
    social_media?: Record<string, string | null>;
}

interface Props {
    canRegister: boolean;
    fakultas?: Fakultas[];
    activePeriod?: RegistrationPeriod | null;
    settings?: Settings;
}

const props = withDefaults(defineProps<Props>(), {
    fakultas: () => [],
    settings: () => ({}),
});

const BASE_URL = 'https://pmb.unukaltim.ac.id';

// Get setting value helper
const getSetting = (
    group: keyof Settings,
    key: string,
    defaultVal = '',
): string => {
    return props.settings?.[group]?.[key] || defaultVal;
};

const pageTitle = computed(() =>
    getSetting('hero', 'hero_title', 'PMB UNU Kaltim'),
);
const pageDescription = computed(() =>
    getSetting(
        'hero',
        'hero_description',
        'Pendaftaran Mahasiswa Baru Universitas Nahdlatul Ulama Kalimantan Timur',
    ),
);

const ogImage = computed(() => {
    const img = getSetting('hero', 'hero_background_image_desktop');
    return img ? `${BASE_URL}${img}` : `${BASE_URL}/assets/images/logo_unu.png`;
});

const jsonLd = computed(() => {
    const contactPoints = [];
    for (let i = 1; i <= 3; i++) {
        const phone = getSetting('contact', `contact_phone_${i}`);
        if (phone) {
            contactPoints.push({
                '@type': 'ContactPoint',
                telephone: phone,
                contactType: 'customer service',
                areaServed: 'ID',
                availableLanguage: 'Indonesian',
            });
        }
    }

    const sameAs = [
        getSetting('social_media', 'social_media_facebook'),
        getSetting('social_media', 'social_media_instagram'),
        getSetting('social_media', 'social_media_website'),
    ].filter(Boolean);

    return {
        '@context': 'https://schema.org',
        '@graph': [
            {
                '@type': 'WebSite',
                name: pageTitle.value,
                description: pageDescription.value,
                url: BASE_URL,
                potentialAction: {
                    '@type': 'SearchAction',
                    target: `${BASE_URL}/search?q={search_term_string}`,
                    'query-input': 'required name=search_term_string',
                },
            },
            {
                '@type': 'EducationalOrganization',
                name: 'Universitas Nahdlatul Ulama Kalimantan Timur',
                url: BASE_URL,
                logo: {
                    '@type': 'ImageObject',
                    url:
                        getSetting('contact', 'university_logo') ||
                        `${BASE_URL}/assets/images/logo_unu.png`,
                },
                contactPoint: contactPoints,
                sameAs: sameAs,
                address: {
                    '@type': 'PostalAddress',
                    streetAddress: getSetting(
                        'contact',
                        'contact_address',
                        'Samarinda, Kalimantan Timur',
                    ),
                    addressCountry: 'ID',
                },
            },
        ],
    };
});

const page = usePage();
const user = computed(() => page.props.auth?.user);

const truncateWords = (text?: string, words = 20) => {
    if (!text) return '';
    const arr = text.split(' ');
    return arr.length > words ? arr.slice(0, words).join(' ') + '...' : text;
};

// Map icon names to components
const featureIcons: Record<string, typeof Award> = {
    'clipboard-check': ClipboardCheck,
    'graduation-cap': GraduationCap,
    'building-2': Building2,
    award: Award,
    users: Users,
};

// Dynamic features from settings
const features = computed(() => [
    {
        icon:
            featureIcons[
                getSetting('features', 'feature_1_icon', 'clipboard-check')
            ] || ClipboardCheck,
        title: getSetting(
            'features',
            'feature_1_title',
            'Beasiswa & Bantuan Pendidikan',
        ),
        description: getSetting('features', 'feature_1_description', ''),
    },
    {
        icon:
            featureIcons[
                getSetting('features', 'feature_2_icon', 'graduation-cap')
            ] || GraduationCap,
        title: getSetting('features', 'feature_2_title', 'Program Studi'),
        description: getSetting('features', 'feature_2_description', ''),
    },
    {
        icon:
            featureIcons[
                getSetting('features', 'feature_3_icon', 'building-2')
            ] || Building2,
        title: getSetting('features', 'feature_3_title', 'Lingkungan Akademik'),
        description: getSetting('features', 'feature_3_description', ''),
    },
]);

const steps = [
    {
        icon: UserPlus,
        title: 'Registrasi Akun',
        desc: 'Buat akun dengan email aktif & verifikasi untuk mengaktifkan akun.',
    },
    {
        icon: FileText,
        title: 'Lengkapi Biodata',
        desc: 'Isi data pribadi & upload dokumen yang diperlukan.',
    },
    {
        icon: GraduationCap,
        title: 'Pilih Program Studi',
        desc: 'Pilih program studi & jalur pendaftaran yang sesuai.',
    },
    {
        icon: ShieldCheck,
        title: 'Verifikasi Data',
        desc: 'Tunggu verifikasi admin & kabar untuk proses daftar ulang.',
    },
    {
        icon: CheckCircle,
        title: 'Daftar Ulang',
        desc: 'Lakukan daftar ulang & selamat bergabung menjadi mahasiswa baru!',
    },
];

const dashboardUrl = computed(() => {
    if (!user.value) return '/login';
    return user.value.role === 'admin' || user.value.role === 'staff'
        ? '/admin/dashboard'
        : '/student/dashboard';
});

const isMobileMenuOpen = ref(false);

const heroTypedStrings = [
    'Kampus Berkarakter Aswaja',
    'Kampus Moderat dan Berintegritas',
    'Mencetak Generasi Unggul dan Berakhlak',
    // tambahan
    'Integrasi Ilmu, Iman, dan Akhlak',
    'Kampus Kebangsaan Berbasis Keislaman',
    'Mencetak Sarjana Profesional dan Bermoral',
    'Berilmu, Berakhlak, dan Berdaya Saing',
];
</script>

<template>
    <Head :title="pageTitle">
        <!-- Primary Meta Tags -->
        <meta name="description" :content="pageDescription" />
        <meta
            name="keywords"
            content="PMB, Pendaftaran Mahasiswa Baru, UNU Kaltim, Universitas Nahdlatul Ulama, Kalimantan Timur, Kuliah, Perguruan Tinggi, Samarinda"
        />
        <meta
            name="author"
            content="Universitas Nahdlatul Ulama Kalimantan Timur"
        />
        <meta name="robots" content="index, follow" />
        <link rel="canonical" :href="BASE_URL" />

        <!-- Open Graph / Facebook -->
        <meta property="og:type" content="website" />
        <meta property="og:url" :content="BASE_URL" />
        <meta property="og:title" :content="pageTitle" />
        <meta property="og:description" :content="pageDescription" />
        <meta property="og:image" :content="ogImage" />
        <meta property="og:locale" content="id_ID" />
        <meta property="og:site_name" content="PMB UNU Kaltim" />

        <!-- Twitter -->
        <meta name="twitter:card" content="summary_large_image" />
        <meta name="twitter:url" :content="BASE_URL" />
        <meta name="twitter:title" :content="pageTitle" />
        <meta name="twitter:description" :content="pageDescription" />
        <meta name="twitter:image" :content="ogImage" />

        <!-- Additional SEO -->
        <meta name="geo.region" content="ID-KI" />
        <meta name="geo.placename" content="Samarinda" />
        <meta name="theme-color" content="#0d9488" />

        <!-- Structured Data (JSON-LD) -->
        <component is="script" type="application/ld+json">
            {{ JSON.stringify(jsonLd) }}
        </component>
    </Head>

    <div class="min-h-screen bg-white">
        <!-- Navbar -->
        <nav class="fixed z-50 w-full bg-white/95 shadow-sm backdrop-blur-sm">
            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div class="flex h-16 items-center justify-between">
                    <!-- Logo -->
                    <div class="flex flex-col items-center">
                        <img
                            :src="
                                getSetting('contact', 'university_logo') ||
                                '/assets/images/logo_unu.png'
                            "
                            alt="Logo"
                            class="h-10 w-10 object-contain"
                        />
                        <span
                            class="font-serif-heading text-sm leading-tight font-bold text-teal-600"
                            >PMB UNUKALTIM</span
                        >
                    </div>

                    <!-- Desktop Menu -->
                    <div class="hidden space-x-6 lg:flex">
                        <a
                            href="#home"
                            class="text-sm text-gray-700 transition hover:text-teal-600"
                            >Beranda</a
                        >
                        <a
                            href="#features"
                            class="text-sm text-gray-700 transition hover:text-teal-600"
                            >Keunggulan</a
                        >
                        <a
                            href="#steps"
                            class="text-sm text-gray-700 transition hover:text-teal-600"
                            >Alur Pendaftaran</a
                        >
                        <a
                            href="#programs"
                            class="text-sm text-gray-700 transition hover:text-teal-600"
                            >Program Studi</a
                        >
                        <a
                            href="#about"
                            class="text-sm text-gray-700 transition hover:text-teal-600"
                            >Tentang</a
                        >
                        <a
                            href="#contact"
                            class="text-sm text-gray-700 transition hover:text-teal-600"
                            >Kontak</a
                        >
                    </div>

                    <!-- Right Side Buttons -->
                    <div class="flex items-center gap-2">
                        <!-- Mobile Menu Button -->
                        <button
                            @click="isMobileMenuOpen = !isMobileMenuOpen"
                            class="rounded-lg p-2 text-gray-700 transition hover:bg-gray-100 lg:hidden"
                        >
                            <Menu v-if="!isMobileMenuOpen" class="size-6" />
                            <X v-else class="size-6" />
                        </button>

                        <div class="hidden sm:block">
                            <Button
                                v-if="user"
                                as-child
                                class="rounded-full bg-teal-600 text-white hover:bg-teal-700"
                            >
                                <Link :href="dashboardUrl">Dashboard</Link>
                            </Button>
                            <Button
                                v-else
                                as-child
                                class="rounded-full bg-teal-600 text-white hover:bg-teal-700"
                            >
                                <Link href="/login">Login</Link>
                            </Button>
                        </div>
                    </div>
                </div>

                <!-- Mobile Menu -->
                <div
                    v-show="isMobileMenuOpen"
                    class="border-t border-gray-200 pb-4 lg:hidden"
                >
                    <div class="flex flex-col space-y-2 pt-2">
                        <a
                            href="#home"
                            @click="isMobileMenuOpen = false"
                            class="rounded-lg px-3 py-2 text-gray-700 transition hover:bg-teal-50 hover:text-teal-600"
                            >Beranda</a
                        >
                        <a
                            href="#features"
                            @click="isMobileMenuOpen = false"
                            class="rounded-lg px-3 py-2 text-gray-700 transition hover:bg-teal-50 hover:text-teal-600"
                            >Keunggulan</a
                        >
                        <a
                            href="#steps"
                            @click="isMobileMenuOpen = false"
                            class="rounded-lg px-3 py-2 text-gray-700 transition hover:bg-teal-50 hover:text-teal-600"
                            >Alur Pendaftaran</a
                        >
                        <a
                            href="#programs"
                            @click="isMobileMenuOpen = false"
                            class="rounded-lg px-3 py-2 text-gray-700 transition hover:bg-teal-50 hover:text-teal-600"
                            >Program Studi</a
                        >
                        <a
                            href="#about"
                            @click="isMobileMenuOpen = false"
                            class="rounded-lg px-3 py-2 text-gray-700 transition hover:bg-teal-50 hover:text-teal-600"
                            >Tentang</a
                        >
                        <a
                            href="#contact"
                            @click="isMobileMenuOpen = false"
                            class="rounded-lg px-3 py-2 text-gray-700 transition hover:bg-teal-50 hover:text-teal-600"
                            >Kontak</a
                        >

                        <div class="pt-2 sm:hidden">
                            <Button
                                v-if="user"
                                as-child
                                class="w-full rounded-full bg-teal-600 text-white hover:bg-teal-700"
                            >
                                <Link :href="dashboardUrl">Dashboard</Link>
                            </Button>
                            <Button
                                v-else
                                as-child
                                class="w-full rounded-full bg-teal-600 text-white hover:bg-teal-700"
                            >
                                <Link href="/login">Login</Link>
                            </Button>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Hero -->
        <section
            id="home"
            class="relative flex min-h-screen items-center overflow-hidden pt-16"
            :class="{
                'bg-gradient-to-br from-teal-600 via-teal-700 to-cyan-800':
                    !getSetting('hero', 'hero_background_image_desktop'),
            }"
        >
            <!-- Desktop Background Image -->
            <div
                v-if="getSetting('hero', 'hero_background_image_desktop')"
                class="absolute inset-0 hidden md:block"
            >
                <img
                    :src="getSetting('hero', 'hero_background_image_desktop')"
                    alt="Hero Background"
                    class="h-full w-full object-cover"
                />
            </div>
            <!-- Mobile Background Image -->
            <div
                v-if="getSetting('hero', 'hero_background_image_mobile')"
                class="absolute inset-0 md:hidden"
            >
                <img
                    :src="getSetting('hero', 'hero_background_image_mobile')"
                    alt="Hero Background"
                    class="h-full w-full object-cover"
                />
            </div>

            <!-- Dark Overlay -->
            <div
                v-if="
                    getSetting('hero', 'hero_background_image_desktop') ||
                    getSetting('hero', 'hero_background_image_mobile')
                "
                class="absolute inset-0 bg-gradient-to-b from-black/40 via-black/30 to-black/40"
            ></div>

            <div
                class="relative z-10 mx-auto max-w-7xl px-4 py-12 text-center text-white sm:px-6 sm:py-20 lg:px-8"
            >
                <h1
                    class="mb-4 text-4xl font-bold text-white text-outline-black sm:mb-6 sm:text-4xl md:text-5xl lg:text-6xl"
                >
                    {{ getSetting('hero', 'hero_title', 'Selamat Datang') }}
                </h1>

                <div
                    class="mx-auto rounded-xl bg-black/20 px-4 py-3 backdrop-blur-sm sm:px-6 sm:py-4"
                >
                    <p
                        class="mb-2 text-base font-light text-white/90 sm:mb-3 sm:text-xl md:text-2xl lg:text-3xl"
                    >
                        {{ getSetting('hero', 'hero_subtitle', '') }}
                    </p>
                    <div
                        class="mx-auto min-h-[3rem] max-w-3xl text-sm text-white/80 sm:text-base md:text-lg lg:text-xl"
                    >
                        <TypeWriter
                            :strings="heroTypedStrings"
                            :type-speed="40"
                            :back-speed="20"
                            :show-cursor="true"
                            :loop="true"
                            class="inline-block"
                        />
                        <!-- <span v-else>{{ getSetting('hero', 'hero_description') }}</span> -->
                    </div>
                </div>

                <div
                    v-if="props.activePeriod"
                    class="mx-auto my-3 mb-6 inline-block rounded-lg bg-white/20 px-4 py-2 backdrop-blur-sm sm:mb-8 sm:px-6 sm:py-3"
                >
                    <p class="text-xs font-semibold sm:text-sm">
                        Periode Pendaftaran Aktif
                    </p>
                    <p class="text-xs opacity-90">
                        {{ props.activePeriod.name }}
                    </p>
                    <p class="text-xs opacity-90">
                        {{ formatDate(props.activePeriod.start_date) }} -
                        {{ formatDate(props.activePeriod.end_date) }}
                    </p>
                </div>

                <div
                    class="flex flex-col items-center justify-center gap-3 sm:flex-row sm:gap-4"
                >
                    <Button
                        v-if="user"
                        as-child
                        size="lg"
                        class="w-full max-w-xs rounded-full bg-white px-6 py-4 text-sm font-semibold text-teal-600 shadow-lg hover:bg-gray-100 sm:w-auto sm:px-8 sm:py-6 sm:text-lg"
                    >
                        <Link :href="dashboardUrl">
                            {{
                                user.role === 'admin'
                                    ? 'Dashboard Admin'
                                    : 'Dashboard Mahasiswa'
                            }}
                        </Link>
                    </Button>
                    <Button
                        v-else
                        as-child
                        size="lg"
                        class="w-full max-w-xs rounded-full bg-white px-6 py-4 text-sm font-semibold text-teal-600 shadow-lg hover:bg-gray-100 sm:w-auto sm:px-8 sm:py-6 sm:text-lg"
                    >
                        <Link
                            :href="
                                getSetting(
                                    'hero',
                                    'hero_button_url',
                                    '/register',
                                )
                            "
                        >
                            {{
                                getSetting(
                                    'hero',
                                    'hero_button_text',
                                    'Daftar Sekarang',
                                )
                            }}
                        </Link>
                    </Button>
                    <Button
                        as-child
                        size="lg"
                        class="w-full max-w-xs border-2 border-white bg-transparent px-6 py-4 text-sm font-semibold text-white transition hover:bg-white/10 sm:w-auto sm:px-8 sm:py-6 sm:text-lg"
                    >
                        <a href="#programs">Lihat Program</a>
                    </Button>
                </div>

                <div
                    class="absolute bottom-2 left-1/2 -translate-x-1/2 animate-bounce sm:bottom-8"
                >
                    <ChevronDown class="size-6 text-white sm:size-8" />
                </div>
            </div>
        </section>

        <!-- Features -->
        <section id="features" class="bg-gray-200 py-20">
            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div class="mb-16 text-center">
                    <h2 class="mb-4 text-4xl font-bold text-gray-900">
                        Keunggulan Kami
                    </h2>
                    <p class="text-xl text-gray-600">
                        Mengapa memilih kami untuk masa depan pendidikan Anda
                    </p>
                </div>

                <div class="grid gap-8 md:grid-cols-3">
                    <div
                        v-for="(f, i) in features"
                        :key="i"
                        class="rounded-2xl bg-white p-8 shadow-sm transition hover:-translate-y-1 hover:shadow-md"
                    >
                        <div
                            class="mb-6 flex size-16 items-center justify-center rounded-full bg-teal-100"
                        >
                            <component
                                :is="f.icon"
                                class="size-8 text-teal-600"
                            />
                        </div>
                        <h3 class="mb-4 text-2xl font-bold text-gray-900">
                            {{ f.title }}
                        </h3>
                        <p class="text-justify leading-relaxed text-gray-600">
                            {{ f.description }}
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <!-- AI Assistant Banner -->
        <section class="bg-gradient-to-r from-teal-600 to-emerald-600 py-8">
            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div
                    class="flex flex-col items-center justify-center gap-4 text-white sm:flex-row sm:gap-6"
                >
                    <div class="flex items-center gap-3">
                        <div
                            class="flex size-14 animate-pulse items-center justify-center rounded-full bg-white/20 backdrop-blur-sm"
                        >
                            <Bot class="size-7" />
                        </div>
                        <div class="text-center sm:text-left">
                            <h3 class="text-lg font-bold">Butuh Bantuan?</h3>
                            <p class="text-sm text-white/90">
                                Ada Asisten AI yang siap membantu!
                            </p>
                        </div>
                    </div>
                    <div
                        class="flex items-center gap-2 rounded-full bg-white/20 px-4 py-2 backdrop-blur-sm"
                    >
                        <MessageCircle class="size-5 text-white" />
                        <span class="text-sm font-medium"
                            >Klik tombol chat di pojok kanan bawah</span
                        >
                        <span class="relative flex size-3">
                            <span
                                class="absolute inline-flex h-full w-full animate-ping rounded-full bg-white opacity-75"
                            ></span>
                            <span
                                class="relative inline-flex size-3 rounded-full bg-white"
                            ></span>
                        </span>
                    </div>
                </div>
            </div>
        </section>

        <!-- Registration Steps -->
        <section
            id="steps"
            class="relative overflow-hidden bg-gradient-to-b from-[#0B1120] via-[#0D4E45] to-[#0B1120] py-24 text-white"
        >
            <!-- Background Elements -->
            <div
                class="absolute inset-x-0 top-0 h-px bg-gradient-to-r from-transparent via-teal-500/20 to-transparent"
            ></div>
            <div
                class="absolute inset-x-0 bottom-0 h-px bg-gradient-to-r from-transparent via-teal-500/20 to-transparent"
            ></div>

            <!-- Glow Effects -->
            <div
                class="absolute top-1/3 left-1/4 h-96 w-96 -translate-x-1/2 -translate-y-1/2 rounded-full bg-teal-500/10 blur-[100px]"
            ></div>
            <div
                class="absolute right-1/4 bottom-1/3 h-96 w-96 translate-x-1/2 translate-y-1/2 rounded-full bg-cyan-500/10 blur-[100px]"
            ></div>

            <div class="relative mx-auto max-w-7xl px-4">
                <div class="mb-16 text-center">
                    <Link
                        href="/panduan-lengkap"
                        class="mb-6 inline-flex items-center gap-2 rounded-full border border-teal-500/30 bg-teal-900/30 px-4 py-1.5 text-sm font-medium text-teal-300 transition hover:bg-teal-900/50"
                    >
                        <BookOpen class="size-4" />
                        Panduan Lengkap
                    </Link>

                    <h2
                        class="font-serif-heading mb-4 text-4xl font-bold md:text-5xl"
                    >
                        Alur Pendaftaran <span class="text-teal-400">PMB</span>
                    </h2>
                    <p class="mx-auto max-w-2xl text-lg text-gray-300">
                        Ikuti 5 langkah mudah berikut untuk menyelesaikan
                        pendaftaran mahasiswa baru
                    </p>
                </div>

                <!-- Desktop Timeline (Hidden on Mobile) -->
                <div class="relative z-10 hidden lg:block">
                    <div class="relative">
                        <!-- Connecting Line -->
                        <div
                            class="absolute top-[3.5rem] left-0 h-1 w-full -translate-y-1/2 bg-white/10"
                        ></div>
                        <div
                            class="absolute top-[3.5rem] left-0 h-1 w-full -translate-y-1/2 bg-gradient-to-r from-teal-500 via-cyan-500 to-teal-500 opacity-50 blur-sm"
                        ></div>

                        <div class="grid grid-cols-5 gap-6">
                            <div
                                v-for="(step, i) in steps"
                                :key="i"
                                class="group text-center"
                            >
                                <div
                                    class="relative mx-auto mb-6 flex size-28 flex-col items-center justify-center rounded-full bg-gradient-to-br from-teal-500 to-cyan-600 shadow-xl shadow-teal-900/20 transition duration-300 group-hover:-translate-y-2 group-hover:scale-105 group-hover:shadow-teal-500/40"
                                >
                                    <div class="mb-1">
                                        <component
                                            :is="step.icon"
                                            class="size-8 text-white"
                                        />
                                    </div>
                                    <span
                                        class="text-sm font-medium text-white/90"
                                        >Step {{ i + 1 }}</span
                                    >
                                </div>

                                <div
                                    class="rounded-2xl border border-white/10 bg-white/5 p-6 backdrop-blur-sm transition duration-300 hover:border-teal-500/30 hover:bg-white/10"
                                >
                                    <h3
                                        class="font-serif-heading mb-3 text-lg font-bold text-white"
                                    >
                                        {{ step.title }}
                                    </h3>
                                    <p
                                        class="text-sm leading-relaxed text-gray-400"
                                    >
                                        {{ step.desc }}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Mobile/Tablet Cards (Hidden on Large Desktop) -->
                <div class="relative z-10 space-y-4 lg:hidden">
                    <div
                        v-for="(step, i) in steps"
                        :key="i"
                        class="rounded-xl border border-white/10 bg-white/10 p-5 backdrop-blur-sm transition hover:bg-white/20"
                    >
                        <div class="flex items-center gap-4">
                            <div class="flex-shrink-0">
                                <div
                                    class="flex size-14 items-center justify-center rounded-full bg-gradient-to-br from-teal-500 to-cyan-600"
                                >
                                    <component
                                        :is="step.icon"
                                        class="size-7 text-white"
                                    />
                                </div>
                            </div>
                            <div class="flex-1">
                                <div class="mb-1 flex items-center gap-2">
                                    <span
                                        class="rounded-full bg-teal-500/20 px-2 py-1 text-xs font-semibold text-teal-400"
                                        >Step {{ i + 1 }}</span
                                    >
                                </div>
                                <h3 class="text-lg font-bold text-white">
                                    {{ step.title }}
                                </h3>
                                <p class="text-sm text-gray-300">
                                    {{ step.desc }}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div
                    class="mt-16 flex flex-col items-center justify-center gap-4 sm:flex-row"
                >
                    <Button
                        as-child
                        size="lg"
                        class="bg-gradient-to-r from-teal-500 to-cyan-500 px-8 font-bold text-white shadow-lg shadow-teal-500/25 transition hover:shadow-teal-500/40"
                    >
                        <Link href="/register">
                            <UserPlus class="mr-2 size-5" />
                            Daftar Sekarang
                        </Link>
                    </Button>

                    <Button
                        as-child
                        variant="outline"
                        size="lg"
                        class="border-white/20 bg-transparent text-white hover:bg-white/10 hover:text-white"
                    >
                        <Link href="/panduan-lengkap">
                            <BookOpen class="mr-2 size-5" />
                            Lihat Panduan
                        </Link>
                    </Button>
                </div>
            </div>
        </section>

        <!-- Programs -->
        <section id="programs" class="bg-white py-20">
            <div class="mx-auto max-w-7xl px-4">
                <div class="mb-16 text-center">
                    <h2 class="mb-4 text-4xl font-bold text-gray-900">
                        Program Studi
                    </h2>
                    <p class="text-xl text-gray-600">
                        Pilih program studi yang sesuai dengan minat dan bakatmu
                    </p>
                </div>

                <!-- Kelas Karyawan Banner -->
                <!-- <div
                    class="mb-16 rounded-2xl bg-gradient-to-br from-teal-600 to-cyan-700 p-8 text-white shadow-xl md:p-12"
                >
                    <div
                        class="flex flex-col items-center justify-between gap-8 md:flex-row"
                    >
                        <div class="text-center md:text-left">
                            <div
                                class="mb-2 inline-flex items-center rounded-full bg-teal-500/30 px-3 py-1 text-sm font-medium text-teal-50 backdrop-blur-sm"
                            >
                                <Award class="mr-2 size-4" />
                                Program Khusus
                            </div>
                            <h3 class="mb-4 text-3xl font-bold">
                                Kelas Karyawan
                            </h3>
                            <p class="max-w-xl text-lg text-teal-50">
                                Ingin kuliah sambil bekerja? Gabung program
                                Kelas Karyawan dengan jadwal fleksibel dan biaya
                                terjangkau.
                            </p>
                        </div>
                        <div class="flex flex-col gap-4 sm:flex-row">
                            <Button
                                as-child
                                size="lg"
                                class="bg-white text-teal-600 hover:bg-teal-50"
                            >
                                <a
                                    href="https://edunitas.com/kampus/unu-kaltim/"
                                    target="_blank"
                                    rel="noopener noreferrer"
                                >
                                    <Globe class="mr-2 size-5" />
                                    Daftar via Edunitas
                                </a>
                            </Button>
                            <Button
                                as-child
                                variant="outline"
                                size="lg"
                                class="bg-white/10 text-white hover:bg-white/20 hover:text-white"
                            >
                                <a
                                    href="https://wa.me/6285216013229"
                                    target="_blank"
                                    rel="noopener noreferrer"
                                >
                                    <MessageCircle class="mr-2 size-5" />
                                    Hubungi WhatsApp
                                </a>
                            </Button>
                        </div>
                    </div>
                </div> -->

                <div v-for="fak in props.fakultas" :key="fak.id" class="mb-12">
                    <h3
                        class="mb-6 flex items-center text-2xl font-bold text-gray-900"
                    >
                        <span class="mr-4 h-8 w-2 rounded bg-teal-600"></span>
                        {{ fak.name }}
                    </h3>

                    <div class="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
                        <div
                            v-for="prodi in fak.program_studi"
                            :key="prodi.id"
                            class="rounded-xl border border-gray-200 p-6 transition hover:border-teal-500 hover:shadow-lg"
                        >
                            <div class="mb-4 flex items-start justify-between">
                                <span
                                    class="rounded-full bg-teal-100 px-3 py-1 text-sm font-semibold text-teal-700"
                                >
                                    {{ prodi.jenjang }}
                                </span>
                            </div>
                            <h4 class="text-xl font-bold text-gray-900">
                                {{ prodi.name }}
                            </h4>
                            <p class="pt-2 text-sm text-gray-600">
                                {{ truncateWords(prodi.description) }}
                            </p>
                        </div>
                    </div>
                </div>

                <div
                    v-if="props.fakultas.length === 0"
                    class="text-center text-gray-500"
                >
                    <GraduationCap class="mx-auto mb-4 size-16 text-gray-300" />
                    <p>Program studi akan segera ditampilkan</p>
                </div>
            </div>
        </section>

        <!-- About -->
        <section id="about" class="bg-gray-200 py-20">
            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div class="grid items-center gap-12 md:grid-cols-2">
                    <div>
                        <h2 class="mb-6 text-4xl font-bold text-gray-900">
                            {{
                                getSetting(
                                    'about',
                                    'about_title',
                                    'Tentang Kami',
                                )
                            }}
                        </h2>
                        <div
                            class="space-y-4 text-justify leading-relaxed text-gray-600"
                        >
                            <p>
                                {{
                                    getSetting('about', 'about_description', '')
                                }}
                            </p>
                        </div>
                    </div>
                    <div class="relative">
                        <div
                            v-if="getSetting('about', 'about_image')"
                            class="aspect-square overflow-hidden rounded-3xl shadow-2xl"
                        >
                            <img
                                :src="getSetting('about', 'about_image')"
                                alt="Tentang Kami"
                                class="h-full w-full object-cover"
                            />
                        </div>
                        <div
                            v-else
                            class="aspect-square rounded-3xl bg-gradient-to-br from-teal-400 to-cyan-500"
                        ></div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Location Map -->
        <section id="location" class="bg-gray-50 py-20">
            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div class="mb-12 text-center">
                    <h2 class="mb-4 text-4xl font-bold text-gray-900">
                        Lokasi Kampus
                    </h2>
                    <p class="text-xl text-gray-600">
                        Kunjungi kampus kami di Samarinda
                    </p>
                </div>
                <div class="overflow-hidden rounded-2xl shadow-lg">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6709.759363348243!2d117.12728847972218!3d-0.531295777316329!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2df67f382d6e5633%3A0xb15fef11f1f68259!2sNahdlatul%20Ulama%20University%20SAMARINDA%20-%20CAMPUS%202!5e0!3m2!1sen!2sid!4v1767164903242!5m2!1sen!2sid"
                        width="100%"
                        height="450"
                        style="border: 0"
                        allowfullscreen="true"
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"
                        class="w-full"
                    ></iframe>
                </div>
            </div>
        </section>

        <!-- Contact -->
        <section id="contact" class="bg-white py-20">
            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div class="mb-16 text-center">
                    <h2 class="mb-4 text-4xl font-bold text-gray-900">
                        Hubungi Kami
                    </h2>
                    <p class="text-xl text-gray-600">
                        Kami siap membantu menjawab pertanyaan Anda
                    </p>
                </div>

                <div class="grid gap-8 md:grid-cols-3">
                    <div class="p-6 text-center">
                        <div
                            class="mx-auto mb-4 flex size-16 items-center justify-center rounded-full bg-teal-100"
                        >
                            <MapPin class="size-8 text-teal-600" />
                        </div>
                        <h3
                            class="font-serif-heading mb-2 font-semibold text-gray-900"
                        >
                            Alamat
                        </h3>
                        <p class="text-gray-600">
                            {{
                                getSetting(
                                    'contact',
                                    'contact_address',
                                    'Samarinda, Kalimantan Timur',
                                )
                            }}
                        </p>
                    </div>

                    <div class="p-6 text-center">
                        <div
                            class="mx-auto mb-4 flex size-16 items-center justify-center rounded-full bg-teal-100"
                        >
                            <Mail class="size-8 text-teal-600" />
                        </div>
                        <h3
                            class="font-serif-heading mb-2 font-semibold text-gray-900"
                        >
                            Email
                        </h3>
                        <p class="text-gray-600">
                            {{
                                getSetting(
                                    'contact',
                                    'contact_email',
                                    'pmb@unukaltim.ac.id',
                                )
                            }}
                        </p>
                    </div>

                    <div class="p-6 text-center">
                        <div
                            class="mx-auto mb-4 flex size-16 items-center justify-center rounded-full bg-teal-100"
                        >
                            <Phone class="size-8 text-teal-600" />
                        </div>
                        <h3
                            class="font-serif-heading mb-2 font-semibold text-gray-900"
                        >
                            Whatsapp
                        </h3>
                        <div class="space-y-1 text-gray-600">
                            <template v-for="i in 3" :key="i">
                                <p
                                    v-if="
                                        getSetting(
                                            'contact',
                                            `contact_phone_${i}`,
                                        )
                                    "
                                >
                                    <a
                                        :href="`https://wa.me/${getSetting(
                                            'contact',
                                            `contact_phone_${i}`,
                                        )
                                            .replace(/[^0-9]/g, '')
                                            .replace(
                                                /^0/,
                                                '62',
                                            )}?text=${encodeURIComponent('Halo ' + (getSetting('contact', `contact_phone_${i}_label`) || 'Admin PMB UNU Kaltim'))}`"
                                        target="_blank"
                                        class="text-teal-600 hover:text-teal-700 hover:underline"
                                    >
                                        {{
                                            getSetting(
                                                'contact',
                                                `contact_phone_${i}`,
                                            )
                                        }}
                                    </a>
                                    <span
                                        v-if="
                                            getSetting(
                                                'contact',
                                                `contact_phone_${i}_label`,
                                            )
                                        "
                                        class="ml-1 text-sm text-gray-500"
                                    >
                                        ({{
                                            getSetting(
                                                'contact',
                                                `contact_phone_${i}_label`,
                                            )
                                        }})
                                    </span>
                                </p>
                            </template>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="bg-gray-900 py-12 text-white">
            <div class="mx-auto max-w-7xl px-4 text-center">
                <div class="mb-6 flex justify-center gap-6">
                    <a
                        v-if="
                            getSetting('social_media', 'social_media_facebook')
                        "
                        :href="
                            getSetting('social_media', 'social_media_facebook')
                        "
                        target="_blank"
                        class="text-gray-400 hover:text-white"
                    >
                        <Facebook class="size-6" />
                    </a>
                    <a
                        v-if="
                            getSetting('social_media', 'social_media_instagram')
                        "
                        :href="
                            getSetting('social_media', 'social_media_instagram')
                        "
                        target="_blank"
                        class="text-gray-400 hover:text-white"
                    >
                        <Instagram class="size-6" />
                    </a>
                    <a
                        v-if="
                            getSetting('social_media', 'social_media_website')
                        "
                        :href="
                            getSetting('social_media', 'social_media_website')
                        "
                        target="_blank"
                        class="text-gray-400 hover:text-white"
                    >
                        <Globe class="size-6" />
                    </a>
                </div>
                <p class="text-gray-400">
                    &copy; {{ new Date().getFullYear() }} Universitas Nahdlatul
                    Ulama Kalimantan Timur. All rights reserved.
                </p>
            </div>
        </footer>

        <!-- Chatbot Widget -->
        <ChatWidget />
    </div>
</template>
