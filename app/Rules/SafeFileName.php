<?php

namespace App\Rules;

use Closure;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Http\UploadedFile;

class SafeFileName implements ValidationRule
{
    /**
     * Run the validation rule.
     *
     * @param  \Closure(string): \Illuminate\Translation\PotentiallyTranslatedString  $fail
     */
    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        if (! $value instanceof UploadedFile) {
            return;
        }

        $filename = $value->getClientOriginalName();

        // Check for multiple dots which indicates double extensions like x.php.jpg
        // Allow starting with dot for hidden files (e.g. .gitignore), though unlikely for uploads
        // Count dots in the filename
        $dotCount = substr_count($filename, '.');
        
        // If it starts with a dot, we don't count the first one
        if (str_starts_with($filename, '.')) {
            $dotCount--;
        }

        if ($dotCount > 1) {
            $fail('The :attribute filename is invalid. Double extensions are not allowed for security reasons.');
            return;
        }
        
        // Also check if any known executable extensions exist anywhere in the name before the last dot
        $dangerousExtensions = ['php', 'php3', 'php4', 'php5', 'php7', 'php8', 'phtml', 'phar', 'exe', 'sh', 'bat', 'cmd', 'js', 'jsp', 'asp', 'aspx', 'cgi', 'pl'];
        
        $parts = explode('.', strtolower($filename));
        // Remove the last part (the actual extension) which is verified by mimes rule
        array_pop($parts);
        
        foreach ($parts as $part) {
            if (in_array($part, $dangerousExtensions)) {
                $fail('The :attribute filename contains an invalid extension for security reasons.');
                return;
            }
        }
    }
}
