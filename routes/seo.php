<?php

use App\Models\Fakultas;
use App\Models\RegistrationPeriod;
use Illuminate\Http\Response;

Route::get('/sitemap.xml', function () {
    $urls = collect();

    // Static pages
    $staticPages = [
        ['loc' => url('/'), 'priority' => '1.0', 'changefreq' => 'daily'],
        ['loc' => url('/login'), 'priority' => '0.8', 'changefreq' => 'monthly'],
        ['loc' => url('/register'), 'priority' => '0.9', 'changefreq' => 'monthly'],
        ['loc' => url('/panduan'), 'priority' => '0.7', 'changefreq' => 'weekly'],
        ['loc' => url('/panduan-lengkap'), 'priority' => '0.7', 'changefreq' => 'weekly'],
    ];

    foreach ($staticPages as $page) {
        $urls->push($page);
    }

    // Build XML
    $xml = '<?xml version="1.0" encoding="UTF-8"?>';
    $xml .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';

    foreach ($urls as $url) {
        $xml .= '<url>';
        $xml .= '<loc>' . htmlspecialchars($url['loc']) . '</loc>';
        $xml .= '<lastmod>' . now()->toDateString() . '</lastmod>';
        $xml .= '<changefreq>' . $url['changefreq'] . '</changefreq>';
        $xml .= '<priority>' . $url['priority'] . '</priority>';
        $xml .= '</url>';
    }

    $xml .= '</urlset>';

    return response($xml, 200, [
        'Content-Type' => 'application/xml',
    ]);
})->name('sitemap');

Route::get('/robots.txt', function () {
    $content = "User-agent: *\n";
    $content .= "Allow: /\n";
    $content .= "Disallow: /admin/\n";
    $content .= "Disallow: /student/\n";
    $content .= "Disallow: /login\n";
    $content .= "Disallow: /register\n";
    $content .= "Disallow: /forgot-password\n";
    $content .= "Disallow: /reset-password\n";
    $content .= "\n";
    $content .= "Sitemap: " . url('/sitemap.xml') . "\n";

    return response($content, 200, [
        'Content-Type' => 'text/plain',
    ]);
})->name('robots');
