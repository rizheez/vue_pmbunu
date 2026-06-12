<?php

namespace App\Console\Commands;

use App\Models\RegistrationPeriod;
use Illuminate\Console\Command;

class SwitchRegistrationPeriod extends Command
{
    /**
     * The name and signature of the console command.
     */
    protected $signature = 'pmb:switch-period';

    /**
     * The console command description.
     */
    protected $description = 'Deactivate expired registration periods and activate the next eligible one';

    /**
     * Execute the console command.
     */
    public function handle(): int
    {
        // 1. Deactivate expired periods
        $deactivated = RegistrationPeriod::deactivateExpiredPeriods();

        if ($deactivated > 0) {
            $this->info("Deactivated {$deactivated} expired period(s).");
        }

        // 2. Check if there's already an active period
        $activePeriod = RegistrationPeriod::where('is_active', true)->first();

        if ($activePeriod) {
            $this->info("Active period: {$activePeriod->name} (already active, no switch needed).");

            return self::SUCCESS;
        }

        // 3. Find next eligible period to activate (date range includes today)
        $nextPeriod = RegistrationPeriod::where('is_active', false)
            ->where('start_date', '<=', now()->startOfDay())
            ->where('end_date', '>=', now()->startOfDay())
            ->orderBy('academic_year')
            ->orderBy('wave_number')
            ->first();

        if ($nextPeriod) {
            $nextPeriod->update(['is_active' => true]);
            $this->info("Activated period: {$nextPeriod->name}.");
        } else {
            $this->info('No eligible period found to activate.');
        }

        return self::SUCCESS;
    }
}
