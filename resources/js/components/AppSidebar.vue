<script setup lang="ts">
import NavFooter from '@/components/NavFooter.vue';
import NavMain from '@/components/NavMain.vue';
import NavUser from '@/components/NavUser.vue';
import {
    Sidebar,
    SidebarContent,
    SidebarFooter,
    SidebarHeader,
    SidebarMenu,
    SidebarMenuButton,
    SidebarMenuItem,
} from '@/components/ui/sidebar';
import { type NavItem } from '@/types';
import { Link, usePage } from '@inertiajs/vue3';
import {
    Bell,
    BookOpen,
    Building2,
    CalendarDays,
    ClipboardList,
    CreditCard,
    FileText,
    GraduationCap,
    Home,
    LayoutGrid,
    MessageSquare,
    Route,
    Settings,
    Sparkles,
    Type,
    UserPlus,
    Users,
} from 'lucide-vue-next';
import { computed } from 'vue';
import AppLogo from './AppLogo.vue';

const page = usePage();
const user = computed(() => page.props.auth?.user);
const isAdmin = computed(
    () => user.value?.role === 'admin' || user.value?.role === 'staff',
);

// Student sidebar items - computed to conditionally show Daftar Ulang
const studentNavItems = computed<NavItem[]>(() => {
    const items: NavItem[] = [
        {
            title: 'Dashboard',
            href: '/student/dashboard',
            icon: LayoutGrid,
        },
        {
            title: 'Biodata',
            href: '/student/biodata',
            icon: FileText,
        },
        {
            title: 'Pendaftaran',
            href: '/student/pendaftaran',
            icon: ClipboardList,
        },
    ];

    // Only show Daftar Ulang if registration is accepted
    if (
        !['submitted', 'rejected', 'draft', 'verified'].includes(
            user.value?.registration_status,
        ) &&
        user.value?.registration_status !== null
    ) {
        items.push({
            title: 'Daftar Ulang',
            href: '/student/reregistration',
            icon: Users,
        });
    }

    // Show Pembayaran Daftar Ulang if form is completed or payment pending
    if (
        ['form_completed', 'payment_pending'].includes(
            user.value?.reregistration_status,
        )
    ) {
        items.push({
            title: 'Pembayaran Daftar Ulang',
            href: '/student/reregistration/payment',
            icon: CreditCard,
        });
    }

    return items;
});

// Admin sidebar - grouped by section
const adminDashboard: NavItem[] = [
    {
        title: 'Dashboard',
        href: '/admin/dashboard',
        icon: LayoutGrid,
    },
];

const adminPendaftaran: NavItem[] = [
    {
        title: 'Calon Mahasiswa',
        href: '/admin/students',
        icon: Users,
    },
    {
        title: 'Daftarkan Manual',
        href: '/admin/students/create',
        icon: UserPlus,
    },

    {
        title: 'Verifikasi Pembayaran',
        href: '/admin/reregistration-payments',
        icon: CreditCard,
    },
    {
        title: 'Generate NIM',
        href: '/admin/nim-generation',
        icon: Sparkles,
    },
    {
        title: 'Daftar Ulang Manual',
        href: '/admin/reregistration',
        icon: UserPlus,
    },
];

const adminAkademik: NavItem[] = [
    {
        title: 'Fakultas',
        href: '/admin/fakultas',
        icon: Building2,
    },
    {
        title: 'Program Studi',
        href: '/admin/program-studi',
        icon: GraduationCap,
    },
    {
        title: 'Mahasiswa Aktif',
        href: '/admin/enrolled-students',
        icon: Users,
    },
];

const adminPengaturan: NavItem[] = [
    {
        title: 'Periode Pendaftaran',
        href: '/admin/periods',
        icon: CalendarDays,
    },
    {
        title: 'Jenis Pendaftaran',
        href: '/admin/registration-types',
        icon: Type,
    },
    {
        title: 'Jalur Pendaftaran',
        href: '/admin/registration-paths',
        icon: Route,
    },
    {
        title: 'Pengaturan Pembayaran',
        href: '/admin/payment-settings',
        icon: CreditCard,
    },
];

const adminKonten: NavItem[] = [
    {
        title: 'Pengumuman',
        href: '/admin/announcements',
        icon: Bell,
    },
    {
        title: 'Landing Page',
        href: '/admin/landing-page',
        icon: Home,
    },
];

const adminSistem: NavItem[] = [
    {
        title: 'Manajemen Pengguna',
        href: '/admin/users',
        icon: Settings,
    },
    {
        title: 'Log Chat AI',
        href: '/admin/chat-logs',
        icon: MessageSquare,
    },
    {
        title: 'Dokumentasi',
        href: '/admin/dokumentasi',
        icon: BookOpen,
    },
];

const dashboardUrl = computed(() =>
    isAdmin.value ? '/admin/dashboard' : '/student/dashboard',
);

const footerNavItems: NavItem[] = [
    {
        title: 'Beranda',
        href: '/',
        icon: Home,
    },
    {
        title: 'Panduan',
        href: '/panduan-lengkap',
        icon: BookOpen,
    },
];
</script>

<template>
    <Sidebar collapsible="icon" variant="inset">
        <SidebarHeader>
            <SidebarMenu>
                <SidebarMenuItem>
                    <SidebarMenuButton size="lg" as-child>
                        <Link :href="dashboardUrl">
                            <AppLogo />
                        </Link>
                    </SidebarMenuButton>
                </SidebarMenuItem>
            </SidebarMenu>
        </SidebarHeader>

        <SidebarContent>
            <!-- Student Menu -->
            <template v-if="!isAdmin">
                <NavMain :items="studentNavItems" label="Mahasiswa" />
            </template>

            <!-- Admin Menu -->
            <template v-else>
                <NavMain :items="adminDashboard" label="" />
                <NavMain :items="adminPendaftaran" label="Pendaftaran" />
                <NavMain :items="adminAkademik" label="Akademik" />
                <NavMain :items="adminPengaturan" label="Pengaturan" />
                <NavMain :items="adminKonten" label="Konten" />
                <NavMain :items="adminSistem" label="Sistem" />
            </template>
        </SidebarContent>

        <SidebarFooter>
            <NavFooter :items="footerNavItems" />
            <NavUser />
        </SidebarFooter>
    </Sidebar>
    <slot />
</template>
