<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SqlImportSeeder extends Seeder
{
    /**
     * Import data from SQL file.
     */
    public function run(): void
    {
        $sqlPath = base_path('unuk4971_pmb_unu.sql');

        if (! file_exists($sqlPath)) {
            $this->command->warn('SQL file not found: '.$sqlPath);

            return;
        }

        $this->command->info('Importing data from SQL file...');

        // Read SQL file
        $sql = file_get_contents($sqlPath);

        // Extract only INSERT statements using regex
        preg_match_all('/INSERT INTO[^;]+;/is', $sql, $matches);

        $insertCount = 0;
        $skippedTables = ['migrations', 'cache', 'cache_locks', 'sessions', 'jobs', 'job_batches', 'failed_jobs', 'password_reset_tokens'];

        foreach ($matches[0] as $statement) {
            $statement = trim($statement);

            // Skip certain tables
            $skip = false;
            foreach ($skippedTables as $table) {
                if (stripos($statement, "INSERT INTO `{$table}`") !== false) {
                    $skip = true;
                    break;
                }
            }

            if ($skip) {
                continue;
            }

            try {
                DB::unprepared($statement);
                $insertCount++;
            } catch (\Exception $e) {
                // Extract table name for clearer warning
                preg_match('/INSERT INTO `?(\w+)`?/i', $statement, $tableMatch);
                $tableName = $tableMatch[1] ?? 'unknown';
                $this->command->warn("Skipped {$tableName}: ".$e->getMessage());
            }
        }

        $this->command->info("Imported {$insertCount} INSERT statements successfully.");
    }
}
