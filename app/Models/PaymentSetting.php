<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PaymentSetting extends Model
{
    protected $fillable = [
        'key',
        'value',
        'type',
    ];

    /**
     * Get value by key
     */
    public static function getValue(string $key, $default = null): mixed
    {
        $setting = self::where('key', $key)->first();

        return $setting ? $setting->value : $default;
    }

    /**
     * Set or update value
     */
    public static function setValue(string $key, $value, string $type = 'text'): self
    {
        return self::updateOrCreate(
            ['key' => $key],
            [
                'value' => $value,
                'type' => $type,
            ]
        );
    }

    /**
     * Get all payment settings as an associative array
     */
    public static function getAllAsArray(): array
    {
        return self::all()->pluck('value', 'key')->toArray();
    }

    /**
     * Get payment info formatted for frontend
     */
    public static function getPaymentInfo(): array
    {
        return [
            'payment_type' => self::getValue('payment_type', 'bank_transfer'),
            'bank_name' => self::getValue('payment_bank_name', 'BRI'),
            'account_number' => self::getValue('payment_account_number', '0000-0000-0000'),
            'account_name' => self::getValue('payment_account_name', 'Universitas Nahdlatul Ulama'),
            'amount' => (int) self::getValue('payment_amount', 300000),
            'instructions' => self::getValue('payment_instructions', ''),
        ];
    }
}
