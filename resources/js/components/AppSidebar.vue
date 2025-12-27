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
    FileText,
    GraduationCap,
    Home,
    LayoutGrid,
    Route,
    Settings,
    Type,
    UserPlus,
    Users,
} from 'lucide-vue-next';
import { computed } from 'vue';
import AppLogo from './AppLogo.vue';

const page = usePage();
const user = computed(() => page.props.auth?.user);
const isAdmin = computed(() => user.value?.role === 'admin' || user.value?.role === 'staff');

// Student sidebar items
const studentNavItems: NavItem[] = [
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
    // {
    //     title: 'Daftar Ulang',
    //     href: '/student/daftar-ulang',
    //     icon: RefreshCw,
    // },
];

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
        title: 'Dokumentasi',
        href: '/admin/dokumentasi',
        icon: BookOpen,
    },
];

const dashboardUrl = computed(() => (isAdmin.value ? '/admin/dashboard' : '/student/dashboard'));

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
