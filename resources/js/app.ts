import '../css/app.css';

import { createInertiaApp } from '@inertiajs/vue3';
import { resolvePageComponent } from 'laravel-vite-plugin/inertia-helpers';
import type { DefineComponent } from 'vue';
import { createApp, h } from 'vue';
import { initializeTheme } from './composables/useAppearance';


const appName = import.meta.env.VITE_APP_NAME || 'Laravel';

createInertiaApp({
    title: (title) => (title ? `${title} - ${appName}` : appName),
    resolve: (name) =>
        resolvePageComponent(
            `./pages/${name}.vue`,
            import.meta.glob<DefineComponent>('./pages/**/*.vue'),
        ),
    setup({ el, App, props, plugin }) {
        createApp({ render: () => h(App, props) })
            .use(plugin)
            .mount(el);
    },
    progress: {
        color: '#4B5563',
    },
});

import { router } from '@inertiajs/vue3';

// This will set light / dark mode on page load...
initializeTheme();

// Handle invalid Inertia responses (e.g. Cloudflare challenges or session expired)
router.on('invalid', (event) => {
    const response = event.detail.response;
    
    // Check if it's a Cloudflare challenge (usually returns HTML containing 'cloudflare')
    // or if it's a 419 session expired
    if (response && (response.status === 419 || response.status === 403 || response.status === 503)) {
        if (typeof response.data === 'string' && (response.data.toLowerCase().includes('cloudflare') || response.status === 419)) {
            event.preventDefault(); // Prevent the black error modal from appearing
            window.location.reload(); // Reload to let Cloudflare challenge the main frame
        }
    }
});
