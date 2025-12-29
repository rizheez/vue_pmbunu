<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductionDumpSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $path = base_path('unuk4971_pmb_unu.sql');

        if (!\Illuminate\Support\Facades\File::exists($path)) {
            $this->command->error("SQL dump file not found at: {$path}");
            return;
        }

        // Disable foreign key checks
        \Illuminate\Support\Facades\DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        $this->command->info('Reading SQL dump...');

        $currentStatement = '';
        $count = 0;

        // Use file() to read into array, handling memory slightly better than get() for huge files,
        // but for <100MB it's fine. LazyCollection would be better but simple array is easier to debug.
        // Actually, let's stick to the plan: file() returns an array.
        $lines = file($path);

        foreach ($lines as $line) {
            $trimmedLine = trim($line);

            // Skip empty lines if we aren't building a statement
            if ($currentStatement === '' && $trimmedLine === '') {
                continue;
            }

            // Skip comments if we aren't building a statement
            if ($currentStatement === '' && (str_starts_with($trimmedLine, '--') || str_starts_with($trimmedLine, '/*'))) {
                continue;
            }

            $currentStatement .= $line;

            // Check if this line ends the statement matching standard SQL dump format
            if (str_ends_with($trimmedLine, ';')) {
                $statement = trim($currentStatement);

                // Double check if it's really a statement end or just part of a string?
                // For mysqldumps, ; at end of line IS the delimiter. Only weird case is inside string.
                // But typically strings are escaped. We assume robust dump format.

                $upper = strtoupper($statement);

                // Skip schema DDL and transaction control
                if (
                    str_starts_with($upper, 'CREATE TABLE') ||
                    str_starts_with($upper, 'DROP TABLE') ||
                    str_starts_with($upper, 'ALTER TABLE') ||
                    str_starts_with($upper, 'LOCK TABLES') ||
                    str_starts_with($upper, 'UNLOCK TABLES') ||
                    str_starts_with($upper, 'SET ') ||
                    str_starts_with($upper, 'START TRANSACTION') ||
                    str_starts_with($upper, 'COMMIT') ||
                    str_starts_with($upper, '/*!')
                ) {
                    $currentStatement = '';
                    continue;
                }

                // Skip specific metadata tables
                if (
                    str_contains($upper, 'INSERT INTO `MIGRATIONS`') ||
                    str_contains($upper, 'INSERT INTO `CACHE`') ||
                    str_contains($upper, 'INSERT INTO `SESSIONS`') ||
                    str_contains($upper, 'INSERT INTO `JOBS`')
                ) {
                    $currentStatement = '';
                    continue;
                }

                try {
                    \Illuminate\Support\Facades\DB::statement($statement);
                    $count++;

                    if ($count % 100 === 0) {
                        $this->command->info("Executed {$count} statements...");
                    }
                } catch (\Exception $e) {
                    $this->command->warn("Error executing statement (length: " . strlen($statement) . "): " . substr($statement, 0, 50) . "...");
                    $this->command->error($e->getMessage());
                }

                // Reset for next statement
                $currentStatement = '';
            }
        }

        // Re-enable foreign key checks
        \Illuminate\Support\Facades\DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        $this->command->info("Seeding completed. Executed {$count} statements.");
    }
}
