<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class LandingPageSetting extends Model
{
    protected $fillable = [
        'key',
        'value',
        'type',
        'group',
    ];

    protected $appends = ['image_url'];

    /**
     * Get value by key
     */
    public static function getValue($key, $default = null)
    {
        $setting = self::where('key', $key)->first();
        return $setting ? $setting->value : $default;
    }

    /**
     * Set or update value
     */
    public static function setValue($key, $value, $type = 'text', $group = 'general')
    {
        return self::updateOrCreate(
            ['key' => $key],
            [
                'value' => $value,
                'type' => $type,
                'group' => $group,
            ]
        );
    }

    /**
     * Get all settings grouped by group
     */
    public static function getAllGrouped()
    {
        return self::all()->groupBy('group');
    }

    /**
     * Get image URL for image type settings
     */
    public function getImageUrlAttribute()
    {
        if ($this->type !== 'image' || !$this->value) {
            return null;
        }

        if (str_starts_with($this->value, 'http') || str_starts_with($this->value, '/storage') || str_starts_with($this->value, '/assets')) {
            return $this->value;
        }

        return Storage::url($this->value);
    }
}
