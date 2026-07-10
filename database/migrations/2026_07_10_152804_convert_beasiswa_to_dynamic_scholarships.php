<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // 1. Create scholarships table
        Schema::create('scholarships', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->text('description')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });

        // 2. Insert the default/existing scholarship options
        $scholarships = [
            ['name' => 'KIPK-K', 'description' => 'Beasiswa Kartu Indonesia Pintar Kuliah'],
            ['name' => 'GratisPol', 'description' => 'Beasiswa Kuliah Gratis Pol'],
            ['name' => 'Reguler', 'description' => 'Tidak mengambil beasiswa'],
        ];
        foreach ($scholarships as $scholarship) {
            DB::table('scholarships')->insert(array_merge($scholarship, [
                'created_at' => now(),
                'updated_at' => now(),
            ]));
        }

        // 3. Add scholarship_id to registrations table
        Schema::table('registrations', function (Blueprint $table) {
            $table->foreignId('scholarship_id')->nullable()->constrained('scholarships')->nullOnDelete();
        });

        // 4. Migrate existing data from beasiswa string to scholarship_id
        $scholarshipMap = DB::table('scholarships')->pluck('id', 'name');
        foreach ($scholarshipMap as $name => $id) {
            DB::table('registrations')
                ->where('beasiswa', $name)
                ->update(['scholarship_id' => $id]);
        }

        // 5. Drop the beasiswa string column
        Schema::table('registrations', function (Blueprint $table) {
            $table->dropColumn('beasiswa');
        });
    }

    public function down(): void
    {
        // Add beasiswa string column back
        Schema::table('registrations', function (Blueprint $table) {
            $table->string('beasiswa')->default('Reguler');
        });

        // Migrate data back
        $scholarshipMap = DB::table('scholarships')->pluck('name', 'id');
        foreach ($scholarshipMap as $id => $name) {
            DB::table('registrations')
                ->where('scholarship_id', $id)
                ->update(['beasiswa' => $name]);
        }

        // Drop foreign key and column
        Schema::table('registrations', function (Blueprint $table) {
            $table->dropForeign(['scholarship_id']);
            $table->dropColumn('scholarship_id');
        });

        // Drop scholarships table
        Schema::dropIfExists('scholarships');
    }
};
