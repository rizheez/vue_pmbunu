<?php

use App\Models\Registration;
use App\Models\RegistrationPeriod;
use App\Models\StudentBiodata;
use App\Models\User;

uses(\Illuminate\Foundation\Testing\RefreshDatabase::class);

beforeEach(function () {
    // Create registration period for generating registration numbers
    RegistrationPeriod::factory()->create([
        'is_active' => true,
    ]);
});

describe('Student Registration Card', function () {
    it('allows authenticated student to view their registration card', function () {
        $student = User::factory()->create(['role' => 'student']);
        $biodata = StudentBiodata::factory()->create(['user_id' => $student->id]);
        $registration = Registration::factory()->create([
            'user_id' => $student->id,
            'registration_number' => '252601'.str_pad(1, 5, '0', STR_PAD_LEFT),
        ]);

        $response = $this->actingAs($student)->get('/student/registration-card');

        $response->assertOk();
        $response->assertHeader('content-type', 'application/pdf');
    });

    it('returns 404 when student has no registration', function () {
        $student = User::factory()->create(['role' => 'student']);

        $response = $this->actingAs($student)->get('/student/registration-card');

        $response->assertNotFound();
    });

    it('redirects guest to login', function () {
        $response = $this->get('/student/registration-card');

        $response->assertRedirect('/login');
    });
});

describe('Admin Registration Card', function () {
    it('allows admin to view any student registration card', function () {
        $admin = User::factory()->create(['role' => 'admin']);
        $student = User::factory()->create(['role' => 'student']);
        $biodata = StudentBiodata::factory()->create(['user_id' => $student->id]);
        $registration = Registration::factory()->create([
            'user_id' => $student->id,
            'registration_number' => '252601'.str_pad(1, 5, '0', STR_PAD_LEFT),
        ]);

        $response = $this->actingAs($admin)->get("/admin/students/{$student->id}/registration-card");

        $response->assertOk();
        $response->assertHeader('content-type', 'application/pdf');
    });

    it('returns 404 when student has no registration', function () {
        $admin = User::factory()->create(['role' => 'admin']);
        $student = User::factory()->create(['role' => 'student']);

        $response = $this->actingAs($admin)->get("/admin/students/{$student->id}/registration-card");

        $response->assertNotFound();
    });

    it('returns 404 for non-existent student', function () {
        $admin = User::factory()->create(['role' => 'admin']);

        $response = $this->actingAs($admin)->get('/admin/students/99999/registration-card');

        $response->assertNotFound();
    });

    it('denies access to non-admin users', function () {
        $student = User::factory()->create(['role' => 'student']);
        $otherStudent = User::factory()->create(['role' => 'student']);
        Registration::factory()->create(['user_id' => $otherStudent->id]);

        $response = $this->actingAs($student)->get("/admin/students/{$otherStudent->id}/registration-card");

        $response->assertForbidden();
    });
});
