<?php

use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * This migration is deprecated - status column is now a string
     * in the original create_registrations_table migration.
     */
    public function up(): void
    {
        // No-op: status column is now a string, no enum modification needed
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // No-op
    }
};
