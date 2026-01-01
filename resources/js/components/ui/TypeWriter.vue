<script setup lang="ts">
import { onMounted, onUnmounted, ref, watch } from 'vue';
import Typed from 'typed.js';

const props = defineProps<{
    content?: string;
    strings?: string[];
    typeSpeed?: number;
    backSpeed?: number;
    loop?: boolean;
    showCursor?: boolean;
}>();

const element = ref<HTMLElement | null>(null);
let typed: Typed | null = null;

onMounted(() => {
    initTyped();
});

watch(
    () => [props.content, props.strings],
    () => {
        if (typed) {
            typed.destroy();
        }
        initTyped();
    },
);

onUnmounted(() => {
    if (typed) {
        typed.destroy();
    }
});

function initTyped() {
    if (element.value) {
        const strings = props.strings || (props.content ? [props.content] : []);

        typed = new Typed(element.value, {
            strings: strings,
            typeSpeed: props.typeSpeed || 50,
            backSpeed: props.backSpeed || 30,
            loop: props.loop ?? false,
            showCursor: props.showCursor ?? true,
            cursorChar: '|',
            contentType: 'html',
        });
    }
}
</script>

<template>
    <div ref="element"></div>
</template>
