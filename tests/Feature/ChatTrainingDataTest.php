<?php

namespace Tests\Feature;

use App\Models\ChatTraining;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ChatTrainingDataTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function it_returns_all_training_data()
    {
        // Seed sample data
        ChatTraining::factory()->create([
            'question' => 'Apa persyaratan pendaftaran mahasiswa baru?',
            'answer' => 'Persyaratan pendaftaran meliputi ijazah SMA/SMK, nilai rapor, dan dokumen pendukung lainnya.',
        ]);

        $response = $this->getJson('/api/chat/training-data');

        $response->assertSuccessful()
            ->assertJsonStructure([
                'success',
                'data' => [
                    '*' => ['id', 'question', 'answer', 'created_at', 'updated_at'],
                ],
            ]);
    }
}
?>
