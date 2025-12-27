<script setup lang="ts">
interface Props {
    maxWidth?: 'sm' | 'md' | 'lg' | 'xl' | '2xl';
}

withDefaults(defineProps<Props>(), {
    maxWidth: 'lg',
});

const widthClasses = {
    sm: 'max-w-sm',
    md: 'max-w-md',
    lg: 'max-w-lg',
    xl: 'max-w-xl',
    '2xl': 'max-w-2xl',
};
</script>

<template>
    <div class="auth-bg min-h-screen flex flex-col items-center justify-center p-4 relative overflow-hidden">
        <!-- Animated Background Squares -->
        <div class="area pointer-events-none">
            <ul class="circles">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>

        <!-- Content -->
        <div :class="['relative z-10 flex flex-col items-center w-full space-y-4', widthClasses[maxWidth]]">
            <!-- Logo -->
            <a href="/">
                <img src="/assets/images/logo_unu.png" alt="PMB UNU Kaltim" class="h-28 drop-shadow-xl" />
            </a>

            <!-- Main Content -->
            <div class="w-full bg-white/95 backdrop-blur-xl rounded-2xl shadow-2xl px-8 py-6 border border-white/10">
                <slot />
            </div>

            <!-- Footer Slot -->
            <slot name="footer" />

            <!-- Default Footer -->
            <footer class="text-center mt-4">
                <p class="text-sm text-white/70">
                    © 2025 Universitas Nahdlatul Ulama Kalimantan Timur
                </p>
            </footer>
        </div>
    </div>
</template>

<style scoped>
.auth-bg {
    background: linear-gradient(to right, #0d9488, #0f766e, #334155);
}

.area {
    position: absolute;
    inset: 0;
    z-index: 0;
    overflow: hidden;
}

.circles {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
}

.circles li {
    position: absolute;
    list-style: none;
    display: block;
    background: rgba(67, 192, 175, 0.18);
    width: 20px;
    height: 20px;
    bottom: -150px;
    animation: animate 30s linear infinite;
    border-radius: 6px;
}

.circles li:nth-child(1) { left: 25%; width: 80px; height: 80px; animation-duration: 28s; }
.circles li:nth-child(2) { left: 10%; width: 20px; height: 20px; animation-duration: 18s; animation-delay: 2s; }
.circles li:nth-child(3) { left: 70%; animation-delay: 4s; }
.circles li:nth-child(4) { left: 80%; width: 60px; height: 60px; animation-duration: 22s; }
.circles li:nth-child(5) { left: 65%; }
.circles li:nth-child(6) { left: 75%; width: 110px; height: 110px; animation-delay: 3s; }
.circles li:nth-child(7) { left: 22%; width: 140px; height: 140px; animation-delay: 7s; }
.circles li:nth-child(8) { left: 15%; width: 25px; height: 25px; animation-duration: 45s; }
.circles li:nth-child(9) { left: 20%; width: 15px; height: 15px; animation-duration: 35s; }
.circles li:nth-child(10) { left: 85%; width: 150px; height: 150px; animation-duration: 26s; }

@keyframes animate {
    0% { transform: translateY(0) rotate(0deg); opacity: 1; }
    100% { transform: translateY(-1100px) rotate(720deg); opacity: 0; }
}
</style>
