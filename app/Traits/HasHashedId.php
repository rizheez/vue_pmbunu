<?php

namespace App\Traits;

use Vinkla\Hashids\Facades\Hashids;

trait HasHashedId
{
    /**
     * Encode an ID to a hash string.
     */
    public static function encodeId(int|string $id): string
    {
        return Hashids::encode((int) $id);
    }

    /**
     * Decode a hash string to an ID.
     *
     * @throws \InvalidArgumentException
     */
    public static function decodeId(string $hash): int
    {
        $decoded = Hashids::decode($hash);

        if (empty($decoded)) {
            throw new \InvalidArgumentException('Invalid hash ID');
        }

        return $decoded[0];
    }

    /**
     * Get the hashed ID attribute.
     */
    public function getHashedIdAttribute(): string
    {
        return self::encodeId($this->id);
    }

    /**
     * Find a model by its hashed ID.
     *
     * @return static|null
     */
    public static function findByHashedId(string $hash)
    {
        try {
            $id = self::decodeId($hash);

            return static::find($id);
        } catch (\InvalidArgumentException $e) {
            return null;
        }
    }

    /**
     * Find a model by its hashed ID or fail.
     *
     * @return static
     *
     * @throws \Illuminate\Database\Eloquent\ModelNotFoundException
     */
    public static function findByHashedIdOrFail(string $hash)
    {
        try {
            $id = self::decodeId($hash);

            return static::findOrFail($id);
        } catch (\InvalidArgumentException $e) {
            throw new \Illuminate\Database\Eloquent\ModelNotFoundException('No query results for model ['.static::class.']');
        }
    }
}
