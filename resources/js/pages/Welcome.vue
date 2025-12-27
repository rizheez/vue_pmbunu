<script setup lang="ts">
import { Button } from '@/components/ui/button';
import type { Fakultas, RegistrationPeriod } from '@/types/pmb';
import { Head, Link, usePage } from '@inertiajs/vue3';
import {
    Award,
    BookOpen,
    Building2,
    CheckCircle,
    ChevronDown,
    ClipboardCheck,
    Facebook,
    FileText,
    GraduationCap,
    Instagram,
    Mail,
    MapPin,
    Phone,
    ShieldCheck,
    Users,
    UserPlus,
    Globe,
    Menu,
    X,
} from 'lucide-vue-next';
import { computed, ref } from 'vue';
import { formatDate } from '@/composables/useFormat';

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

const page = usePage();
const user = computed(() => page.props.auth?.user);

const truncateWords = (text?: string, words = 20) => {
  if (!text) return ''
  const arr = text.split(' ')
  return arr.length > words
    ? arr.slice(0, words).join(' ') + '...'
    : text
}

// Get setting value helper
const getSetting = (group: keyof Settings, key: string, defaultVal = ''): string => {
    return props.settings?.[group]?.[key] || defaultVal;
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
        icon: featureIcons[getSetting('features', 'feature_1_icon', 'clipboard-check')] || ClipboardCheck,
        title: getSetting('features', 'feature_1_title', 'Beasiswa & Bantuan Pendidikan'),
        description: getSetting('features', 'feature_1_description', ''),
    },
    {
        icon: featureIcons[getSetting('features', 'feature_2_icon', 'graduation-cap')] || GraduationCap,
        title: getSetting('features', 'feature_2_title', 'Program Studi'),
        description: getSetting('features', 'feature_2_description', ''),
    },
    {
        icon: featureIcons[getSetting('features', 'feature_3_icon', 'building-2')] || Building2,
        title: getSetting('features', 'feature_3_title', 'Lingkungan Akademik'),
        description: getSetting('features', 'feature_3_description', ''),
    },
]);

const steps = [
    { icon: UserPlus, title: 'Registrasi Akun', desc: 'Buat akun dengan email aktif & verifikasi untuk mengaktifkan akun.' },
    { icon: FileText, title: 'Lengkapi Biodata', desc: 'Isi data pribadi & upload dokumen yang diperlukan.' },
    { icon: GraduationCap, title: 'Pilih Program Studi', desc: 'Pilih program studi & jalur pendaftaran yang sesuai.' },
    { icon: ShieldCheck, title: 'Verifikasi Data', desc: 'Tunggu verifikasi admin & kabar untuk proses daftar ulang.' },
    { icon: CheckCircle, title: 'Daftar Ulang', desc: 'Lakukan daftar ulang & selamat bergabung menjadi mahasiswa baru!' },
];

const dashboardUrl = computed(() => {
    if (!user.value) return '/login';
    return user.value.role === 'admin' || user.value.role === 'staff' ? '/admin/dashboard' : '/student/dashboard';
});

const isMobileMenuOpen = ref(false);
</script>

<template>
    <Head :title="getSetting('hero', 'hero_title', 'PMB UNU Kaltim')">
        <!-- Primary Meta Tags -->
        <meta
            name="description"
            :content="getSetting('hero', 'hero_description', 'Pendaftaran Mahasiswa Baru Universitas Nahdlatul Ulama Kalimantan Timur')"
        />
        <meta name="keywords" content="PMB, Pendaftaran Mahasiswa Baru, UNU Kaltim, Universitas Nahdlatul Ulama, Kalimantan Timur, Kuliah, Perguruan Tinggi, Samarinda" />
        <meta name="author" content="Universitas Nahdlatul Ulama Kalimantan Timur" />
        <meta name="robots" content="index, follow" />
        <link rel="canonical" href="https://pmb.unukaltim.ac.id/" />

        <!-- Open Graph / Facebook -->
        <meta property="og:type" content="website" />
        <meta property="og:url" content="https://pmb.unukaltim.ac.id/" />
        <meta property="og:title" :content="getSetting('hero', 'hero_title', 'PMB UNU Kaltim')" />
        <meta property="og:description" :content="getSetting('hero', 'hero_description', 'Pendaftaran Mahasiswa Baru Universitas Nahdlatul Ulama Kalimantan Timur')" />
        <meta property="og:image" :content="getSetting('hero', 'hero_background_image_desktop') || '/assets/images/logo_unu.png'" />
        <meta property="og:locale" content="id_ID" />
        <meta property="og:site_name" content="PMB UNU Kaltim" />

        <!-- Twitter -->
        <meta name="twitter:card" content="summary_large_image" />
        <meta name="twitter:url" content="https://pmb.unukaltim.ac.id/" />
        <meta name="twitter:title" :content="getSetting('hero', 'hero_title', 'PMB UNU Kaltim')" />
        <meta name="twitter:description" :content="getSetting('hero', 'hero_description', 'Pendaftaran Mahasiswa Baru Universitas Nahdlatul Ulama Kalimantan Timur')" />
        <meta name="twitter:image" :content="getSetting('hero', 'hero_background_image_desktop') || '/assets/images/logo_unu.png'" />

        <!-- Additional SEO -->
        <meta name="geo.region" content="ID-KI" />
        <meta name="geo.placename" content="Samarinda" />
        <meta name="theme-color" content="#0d9488" />
    </Head>

    <div class="min-h-screen bg-white">
        <!-- Navbar -->
        <nav class="fixed z-50 w-full bg-white/95 shadow-sm backdrop-blur-sm">
            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div class="flex h-16 items-center justify-between">
                    <!-- Logo -->
                    <div class="flex flex-col items-center">
                        <img
                            v-if="getSetting('contact', 'university_logo')"
                            :src="getSetting('contact', 'university_logo')"
                            alt="Logo"
                            class="h-10 w-10 object-contain"
                        />
                        <span class="font-serif-heading text-sm font-bold leading-tight text-teal-600">PMB UNUKALTIM</span>
                    </div>

                    <!-- Desktop Menu -->
                    <div class="hidden space-x-6 lg:flex">
                        <a href="#home" class="text-sm text-gray-700 transition hover:text-teal-600">Beranda</a>
                        <a href="#features" class="text-sm text-gray-700 transition hover:text-teal-600">Keunggulan</a>
                        <a href="#steps" class="text-sm text-gray-700 transition hover:text-teal-600">Alur Pendaftaran</a>
                        <a href="#programs" class="text-sm text-gray-700 transition hover:text-teal-600">Program Studi</a>
                        <a href="#about" class="text-sm text-gray-700 transition hover:text-teal-600">Tentang</a>
                        <a href="#contact" class="text-sm text-gray-700 transition hover:text-teal-600">Kontak</a>
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
                            <Button v-if="user" as-child class="rounded-full bg-teal-600 text-white hover:bg-teal-700">
                                <Link :href="dashboardUrl">Dashboard</Link>
                            </Button>
                            <Button v-else as-child class="rounded-full bg-teal-600 text-white hover:bg-teal-700">
                                <Link href="/login">Login</Link>
                            </Button>
                        </div>
                    </div>
                </div>

                <!-- Mobile Menu -->
                <div v-show="isMobileMenuOpen" class="border-t border-gray-200 pb-4 lg:hidden">
                    <div class="flex flex-col space-y-2 pt-2">
                        <a href="#home" @click="isMobileMenuOpen = false" class="rounded-lg px-3 py-2 text-gray-700 transition hover:bg-teal-50 hover:text-teal-600">Beranda</a>
                        <a href="#features" @click="isMobileMenuOpen = false" class="rounded-lg px-3 py-2 text-gray-700 transition hover:bg-teal-50 hover:text-teal-600">Keunggulan</a>
                        <a href="#steps" @click="isMobileMenuOpen = false" class="rounded-lg px-3 py-2 text-gray-700 transition hover:bg-teal-50 hover:text-teal-600">Alur Pendaftaran</a>
                        <a href="#programs" @click="isMobileMenuOpen = false" class="rounded-lg px-3 py-2 text-gray-700 transition hover:bg-teal-50 hover:text-teal-600">Program Studi</a>
                        <a href="#about" @click="isMobileMenuOpen = false" class="rounded-lg px-3 py-2 text-gray-700 transition hover:bg-teal-50 hover:text-teal-600">Tentang</a>
                        <a href="#contact" @click="isMobileMenuOpen = false" class="rounded-lg px-3 py-2 text-gray-700 transition hover:bg-teal-50 hover:text-teal-600">Kontak</a>

                        <div class="pt-2 sm:hidden">
                             <Button v-if="user" as-child class="w-full rounded-full bg-teal-600 text-white hover:bg-teal-700">
                                <Link :href="dashboardUrl">Dashboard</Link>
                            </Button>
                            <Button v-else as-child class="w-full rounded-full bg-teal-600 text-white hover:bg-teal-700">
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
            :class="{ 'bg-gradient-to-br from-teal-600 via-teal-700 to-cyan-800': !getSetting('hero', 'hero_background_image_desktop') }"
        >
            <!-- Desktop Background Image -->
            <div v-if="getSetting('hero', 'hero_background_image_desktop')" class="absolute inset-0 hidden md:block">
                <img
                    :src="getSetting('hero', 'hero_background_image_desktop')"
                    alt="Hero Background"
                    class="h-full w-full object-cover"
                />
            </div>
             <!-- Mobile Background Image -->
            <div v-if="getSetting('hero', 'hero_background_image_mobile')" class="absolute inset-0 md:hidden">
                <img
                    :src="getSetting('hero', 'hero_background_image_mobile')"
                    alt="Hero Background"
                    class="h-full w-full object-cover"
                />
            </div>

            <!-- Dark Overlay -->
            <div v-if="getSetting('hero', 'hero_background_image_desktop') || getSetting('hero', 'hero_background_image_mobile')" class="absolute inset-0 bg-gradient-to-b from-black/40 via-black/30 to-black/40"></div>

            <div class="relative z-10 mx-auto max-w-7xl px-4 py-20 text-center text-white sm:px-6 lg:px-8">
                <h1 class="text-outline-black mb-6 text-4xl font-bold text-white md:text-6xl">
                    {{ getSetting('hero', 'hero_title', 'Selamat Datang') }}
                </h1>

                <div class="mx-auto rounded-xl bg-black/20 px-6 py-4 backdrop-blur-sm">
                     <p class="mb-3 text-xl font-light text-white/90 md:text-3xl">
                        {{ getSetting('hero', 'hero_subtitle', '') }}
                    </p>
                    <p class="mx-auto max-w-3xl text-base text-white/80 md:text-xl">
                        {{ getSetting('hero', 'hero_description', '') }}
                    </p>
                </div>

                <div
                    v-if="props.activePeriod"
                    class="mx-auto my-3 mb-8 inline-block rounded-lg bg-white/20 px-6 py-3 backdrop-blur-sm"
                >
                    <p class="text-sm font-semibold">Periode Pendaftaran Aktif</p>
                    <p class="text-xs opacity-90">{{ props.activePeriod.name }}</p>
                    <p class="text-xs opacity-90">
                        {{ formatDate(props.activePeriod.start_date) }} - {{ formatDate(props.activePeriod.end_date) }}
                    </p>
                </div>

                <div class="flex justify-center gap-4">
                    <Button
                        v-if="user"
                        as-child
                        size="lg"
                         class="rounded-full bg-white px-8 py-6 text-lg font-semibold text-teal-600 shadow-lg hover:bg-gray-100"
                    >
                        <Link :href="dashboardUrl">
                             {{ user.role === 'admin' ? 'Dashboard Admin' : 'Dashboard Mahasiswa' }}
                        </Link>
                    </Button>
                    <Button
                        v-else
                        as-child
                        size="lg"
                        class="rounded-full bg-white px-8 py-6 text-lg font-semibold text-teal-600 shadow-lg hover:bg-gray-100"
                    >
                        <Link :href="getSetting('hero', 'hero_button_url', '/register')">
                            {{ getSetting('hero', 'hero_button_text', 'Daftar Sekarang') }}
                        </Link>
                    </Button>
                    <Button
                        as-child
                        size="lg"
                        class="border-2 border-white bg-transparent px-8 py-6 text-lg font-semibold text-white transition hover:bg-white/10"
                    >
                        <a href="#programs">Lihat Program</a>
                    </Button>
                </div>

                <div class="absolute bottom-8 left-1/2 -translate-x-1/2 animate-bounce">
                    <ChevronDown class="size-8 text-white" />
                </div>
            </div>
        </section>

        <!-- Features -->
        <section id="features" class="bg-gray-200 py-20">
            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div class="mb-16 text-center">
                    <h2 class="mb-4 text-4xl font-bold text-gray-900">Keunggulan Kami</h2>
                    <p class="text-xl text-gray-600">Mengapa memilih kami untuk masa depan pendidikan Anda</p>
                </div>

                <div class="grid gap-8 md:grid-cols-3">
                    <div
                        v-for="(f, i) in features"
                        :key="i"
                        class="rounded-2xl bg-white p-8 shadow-sm transition hover:-translate-y-1 hover:shadow-md"
                    >
                        <div class="mb-6 flex size-16 items-center justify-center rounded-full bg-teal-100">
                             <component :is="f.icon" class="size-8 text-teal-600" />
                        </div>
                        <h3 class="mb-4 text-2xl font-bold text-gray-900">{{ f.title }}</h3>
                        <p class="leading-relaxed text-gray-600 text-justify">{{ f.description }}</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Registration Steps -->
        <section id="steps" class="relative overflow-hidden bg-gradient-to-b from-[#0B1120] via-[#0D4E45] to-[#0B1120] py-24 text-white">
            <!-- Background Elements -->
             <div class="absolute inset-x-0 top-0 h-px bg-gradient-to-r from-transparent via-teal-500/20 to-transparent"></div>
             <div class="absolute inset-x-0 bottom-0 h-px bg-gradient-to-r from-transparent via-teal-500/20 to-transparent"></div>

             <!-- Glow Effects -->
             <div class="absolute left-1/4 top-1/3 h-96 w-96 -translate-x-1/2 -translate-y-1/2 rounded-full bg-teal-500/10 blur-[100px]"></div>
             <div class="absolute right-1/4 bottom-1/3 h-96 w-96 translate-x-1/2 translate-y-1/2 rounded-full bg-cyan-500/10 blur-[100px]"></div>

            <div class="relative mx-auto max-w-7xl px-4">
                <div class="mb-16 text-center">
                    <Link
                        href="/panduan-lengkap"
                        class="mb-6 inline-flex items-center gap-2 rounded-full border border-teal-500/30 bg-teal-900/30 px-4 py-1.5 text-sm font-medium text-teal-300 transition hover:bg-teal-900/50"
                    >
                        <BookOpen class="size-4" />
                        Panduan Lengkap
                    </Link>

                    <h2 class="font-serif-heading mb-4 text-4xl font-bold md:text-5xl">
                        Alur Pendaftaran <span class="text-teal-400">PMB</span>
                    </h2>
                    <p class="mx-auto max-w-2xl text-lg text-gray-300">
                        Ikuti 5 langkah mudah berikut untuk menyelesaikan pendaftaran mahasiswa baru
                    </p>
                </div>

                <!-- Desktop Timeline (Hidden on Mobile) -->
                <div class="hidden lg:block relative z-10">
                    <div class="relative">
                        <!-- Connecting Line -->
                        <div class="absolute left-0 top-[3.5rem] h-1 w-full -translate-y-1/2 bg-white/10"></div>
                        <div class="absolute left-0 top-[3.5rem] h-1 w-full -translate-y-1/2 bg-gradient-to-r from-teal-500 via-cyan-500 to-teal-500 opacity-50 blur-sm"></div>

                        <div class="grid grid-cols-5 gap-6">
                            <div
                                v-for="(step, i) in steps"
                                :key="i"
                                class="group text-center"
                            >
                                <div class="relative mx-auto mb-6 flex size-28 flex-col items-center justify-center rounded-full bg-gradient-to-br from-teal-500 to-cyan-600 shadow-xl shadow-teal-900/20 transition duration-300 group-hover:-translate-y-2 group-hover:scale-105 group-hover:shadow-teal-500/40">
                                    <div class="mb-1">
                                        <component :is="step.icon" class="size-8 text-white" />
                                    </div>
                                    <span class="text-sm font-medium text-white/90">Step {{ i + 1 }}</span>
                                </div>

                                <div class="rounded-2xl border border-white/10 bg-white/5 p-6 backdrop-blur-sm transition duration-300 hover:border-teal-500/30 hover:bg-white/10">
                                    <h3 class="font-serif-heading mb-3 text-lg font-bold text-white">{{ step.title }}</h3>
                                    <p class="text-sm leading-relaxed text-gray-400">{{ step.desc }}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Mobile/Tablet Cards (Hidden on Large Desktop) -->
                <div class="lg:hidden space-y-4 relative z-10">
                    <div
                        v-for="(step, i) in steps"
                        :key="i"
                        class="rounded-xl border border-white/10 bg-white/10 p-5 backdrop-blur-sm transition hover:bg-white/20"
                    >
                        <div class="flex items-center gap-4">
                            <div class="flex-shrink-0">
                                <div class="flex size-14 items-center justify-center rounded-full bg-gradient-to-br from-teal-500 to-cyan-600">
                                    <component :is="step.icon" class="size-7 text-white" />
                                </div>
                            </div>
                            <div class="flex-1">
                                <div class="mb-1 flex items-center gap-2">
                                    <span class="rounded-full bg-teal-500/20 px-2 py-1 text-xs font-semibold text-teal-400">Step {{ i + 1 }}</span>
                                </div>
                                <h3 class="text-lg font-bold text-white">{{ step.title }}</h3>
                                <p class="text-sm text-gray-300">{{ step.desc }}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mt-16 flex flex-col items-center justify-center gap-4 sm:flex-row">
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
                    <h2 class="mb-4 text-4xl font-bold text-gray-900">Program Studi</h2>
                    <p class="text-xl text-gray-600">Pilih program studi yang sesuai dengan minat dan bakatmu</p>
                </div>

                <div v-for="fak in props.fakultas" :key="fak.id" class="mb-12">
                    <h3 class="mb-6 flex items-center text-2xl font-bold text-gray-900">
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
                                <span class="rounded-full bg-teal-100 px-3 py-1 text-sm font-semibold text-teal-700">
                                    {{ prodi.jenjang }}
                                </span>
                            </div>
                            <h4 class="text-xl font-bold text-gray-900">{{ prodi.name }}</h4>
                            <p class="text-gray-600 text-sm pt-2">
                                {{ truncateWords(prodi.description) }}
                            </p>
                        </div>
                    </div>
                </div>

                <div v-if="props.fakultas.length === 0" class="text-center text-gray-500">
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
                            {{ getSetting('about', 'about_title', 'Tentang Kami') }}
                        </h2>
                        <div class="space-y-4 text-justify leading-relaxed text-gray-600">
                             <p>{{ getSetting('about', 'about_description', '') }}</p>
                        </div>
                    </div>
                    <div class="relative">
                        <div v-if="getSetting('about', 'about_image')" class="aspect-square overflow-hidden rounded-3xl shadow-2xl">
                             <img
                                :src="getSetting('about', 'about_image')"
                                alt="Tentang Kami"
                                class="h-full w-full object-cover"
                            />
                        </div>
                        <div v-else class="aspect-square rounded-3xl bg-gradient-to-br from-teal-400 to-cyan-500"></div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact -->
        <section id="contact" class="bg-white py-20">
            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div class="mb-16 text-center">
                    <h2 class="mb-4 text-4xl font-bold text-gray-900">Hubungi Kami</h2>
                    <p class="text-xl text-gray-600">Kami siap membantu menjawab pertanyaan Anda</p>
                </div>

                <div class="grid gap-8 md:grid-cols-3">
                    <div class="text-center p-6">
                        <div class="mx-auto mb-4 flex size-16 items-center justify-center rounded-full bg-teal-100">
                            <MapPin class="size-8 text-teal-600" />
                        </div>
                        <h3 class="font-serif-heading mb-2 font-semibold text-gray-900">Alamat</h3>
                        <p class="text-gray-600">
                            {{ getSetting('contact', 'contact_address', 'Samarinda, Kalimantan Timur') }}
                        </p>
                    </div>

                    <div class="text-center p-6">
                        <div class="mx-auto mb-4 flex size-16 items-center justify-center rounded-full bg-teal-100">
                            <Mail class="size-8 text-teal-600" />
                        </div>
                        <h3 class="font-serif-heading mb-2 font-semibold text-gray-900">Email</h3>
                        <p class="text-gray-600">
                            {{ getSetting('contact', 'contact_email', 'pmb@unukaltim.ac.id') }}
                        </p>
                    </div>

                    <div class="text-center p-6">
                        <div class="mx-auto mb-4 flex size-16 items-center justify-center rounded-full bg-teal-100">
                            <Phone class="size-8 text-teal-600" />
                        </div>
                        <h3 class="font-serif-heading mb-2 font-semibold text-gray-900">Whatsapp</h3>
                        <div class="space-y-1 text-gray-600">
                            <template v-for="i in 3" :key="i">
                                <p v-if="getSetting('contact', `contact_phone_${i}`)">
                                    <a
                                        :href="`https://wa.me/${getSetting('contact', `contact_phone_${i}`).replace(/[^0-9]/g, '').replace(/^0/, '62')}?text=${encodeURIComponent('Halo ' + (getSetting('contact', `contact_phone_${i}_label`) || 'Admin PMB UNU Kaltim'))}`"
                                        target="_blank"
                                        class="text-teal-600 hover:text-teal-700 hover:underline"
                                    >
                                        {{ getSetting('contact', `contact_phone_${i}`) }}
                                    </a>
                                    <span v-if="getSetting('contact', `contact_phone_${i}_label`)" class="ml-1 text-sm text-gray-500">
                                        ({{ getSetting('contact', `contact_phone_${i}_label`) }})
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
                        v-if="getSetting('social_media', 'social_media_facebook')"
                        :href="getSetting('social_media', 'social_media_facebook')"
                        target="_blank"
                        class="text-gray-400 hover:text-white"
                    >
                        <Facebook class="size-6" />
                    </a>
                    <a
                        v-if="getSetting('social_media', 'social_media_instagram')"
                        :href="getSetting('social_media', 'social_media_instagram')"
                        target="_blank"
                        class="text-gray-400 hover:text-white"
                    >
                        <Instagram class="size-6" />
                    </a>
                    <a
                        v-if="getSetting('social_media', 'social_media_website')"
                        :href="getSetting('social_media', 'social_media_website')"
                        target="_blank"
                        class="text-gray-400 hover:text-white"
                    >
                        <Globe class="size-6" />
                    </a>
                </div>
                <p class="text-gray-400">
                    &copy; {{ new Date().getFullYear() }} Universitas Nahdlatul Ulama Kalimantan Timur. All rights reserved.
                </p>
            </div>
        </footer>
    </div>
</template>
