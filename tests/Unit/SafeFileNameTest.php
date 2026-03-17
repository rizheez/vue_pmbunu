<?php

use App\Rules\SafeFileName;
use Illuminate\Http\UploadedFile;

it('rejects files with double extensions', function () {
    $file = UploadedFile::fake()->create('shell.php.jpg', 100, 'image/jpeg');
    $rule = new SafeFileName();
    
    $failed = false;
    $rule->validate('document', $file, function ($message) use (&$failed) {
        $failed = true;
    });

    expect($failed)->toBeTrue();
});

it('rejects files with dangerous extensions anywhere in the name', function () {
    $file = UploadedFile::fake()->create('image-php.info.jpg', 100, 'image/jpeg');
    $rule = new SafeFileName();
    
    $failed = false;
    $rule->validate('document', $file, function ($message) use (&$failed) {
        $failed = true;
    });

    expect($failed)->toBeTrue();
});

it('allows files with safe single extensions', function () {
    $file = UploadedFile::fake()->create('my_selfie.jpg', 100, 'image/jpeg');
    $rule = new SafeFileName();
    
    $failed = false;
    $rule->validate('document', $file, function ($message) use (&$failed) {
        $failed = true;
    });

    expect($failed)->toBeFalse();
});

it('allows safe hidden files but still rejects double extensions', function () {
    $file = UploadedFile::fake()->create('.gitignore', 1, 'text/plain');
    $rule = new SafeFileName();
    
    $failed = false;
    $rule->validate('document', $file, function ($message) use (&$failed) {
        $failed = true;
    });

    expect($failed)->toBeFalse();
    
    $file2 = UploadedFile::fake()->create('.env.php.jpg', 1, 'image/jpeg');
    $failed2 = false;
    $rule->validate('document', $file2, function ($message) use (&$failed2) {
        $failed2 = true;
    });

    expect($failed2)->toBeTrue();
});
