export const formatDate = (
    date?: string,
    options?: {
        day?: '2-digit' | 'numeric';
        month?: 'short' | 'long' | 'narrow' | '2-digit' | 'numeric';
        year?: '2-digit' | 'numeric';
    },
) => {
    if (!date) return '-';

    return new Intl.DateTimeFormat('id-ID', {
        day: '2-digit',
        month: 'short',
        year: 'numeric',
        ...options,
    }).format(new Date(date));
};
