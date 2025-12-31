// PMB Application TypeScript Types

export type UserRole = 'admin' | 'staff' | 'student';

export type RegistrationStatus =
    | 'draft'
    | 'submitted'
    | 'verified'
    | 'accepted'
    | 'rejected'
    | 're_registration_pending'
    | 're_registration_verified'
    | 'enrolled';

export type DocumentType = 'photo' | 'kk' | 'ktp' | 'certificate' | 'biodata';

export type VerificationStatus = 'pending' | 'approved' | 'rejected';

export type Gender = 'male' | 'female';

export interface Fakultas {
    id: number;
    name: string;
    code: string;
    is_active: boolean;
    created_at: string;
    updated_at: string;
    program_studi?: ProgramStudi[];
}

export interface ProgramStudi {
    id: number;
    fakultas_id: number;
    name: string;
    code: string;
    jenjang: string;
    description?: string;
    accreditation: string;
    is_active: boolean;
    created_at: string;
    updated_at: string;
    fakultas?: Fakultas;
}

export interface RegistrationPeriod {
    id: number;
    name: string;
    academic_year: string;
    wave_number: number;
    start_date: string;
    end_date: string;
    is_active: boolean;
    created_at: string;
    updated_at: string;
}

export interface RegistrationType {
    id: number;
    name: string;
    code: string;
    description?: string;
    is_active: boolean;
    created_at: string;
    updated_at: string;
}

export interface RegistrationPath {
    id: number;
    name: string;
    code: string;
    description?: string;
    is_active: boolean;
    created_at: string;
    updated_at: string;
}

export interface StudentBiodata {
    id: number;
    user_id: number;
    name: string;
    nik: string;
    nisn?: string;
    last_education: string;
    school_origin: string;
    major?: string;
    phone: string;
    gender: Gender;
    birth_place: string;
    birth_date: string;
    religion: string;
    address: string;
    photo_path?: string;
    kk_path?: string;
    ktp_path?: string;
    certificate_path?: string;
    // Re-registration fields (Neo Feeder)
    mother_name?: string;
    npwp?: string;
    telephone?: string;
    email?: string;
    dusun?: string;
    rt?: string;
    rw?: string;
    kelurahan?: string;
    kode_pos?: string;
    kecamatan?: string;
    kabupaten?: string;
    provinsi?: string;
    kps_recipient?: boolean;
    kps_number?: string;
    residence_type?: string;
    transportation?: string;
    // URL accessors
    photo_url?: string;
    kk_url?: string;
    ktp_url?: string;
    certificate_url?: string;
    created_at: string;
    updated_at: string;
    verifications?: DocumentVerification[];
    pending_verifications?: number;
    parents?: StudentParent[];
    special_needs?: StudentSpecialNeed[];
}

export interface StudentParent {
    id?: number;
    student_biodata_id?: number;
    type: 'ayah' | 'ibu' | 'wali' | '';
    name: string;
    nik?: string;
    birth_date?: string | null;
    is_alive?: boolean;
    education?: string;
    occupation?: string;
    income?: string;
    phone?: string;
    address?: string;
    created_at?: string;
    updated_at?: string;
}

export interface StudentSpecialNeed {
    id?: number;
    student_biodata_id?: number;
    type: string;
    description?: string;
    assistance_needed?: string;
    created_at?: string;
    updated_at?: string;
}

export interface DocumentVerification {
    id: number;
    student_biodata_id: number;
    document_type: DocumentType;
    status: VerificationStatus;
    notes?: string;
    verified_by?: number;
    verified_at?: string;
    is_read: boolean;
    created_at: string;
    updated_at: string;
}

export interface Registration {
    id: number;
    user_id: number;
    registration_number?: string;
    registration_type_id?: number;
    registration_path_id?: number;
    referral_source?: string;
    referral_detail?: string;
    choice_1?: number;
    choice_2?: number;
    choice_3?: number;
    status: RegistrationStatus;
    registration_period_id?: number;
    accepted_at?: string;
    accepted_by?: number;
    acceptance_notes?: string;
    accepted_program_studi_id?: number;
    rejected_at?: string;
    rejected_by?: number;
    rejection_reason?: string;
    created_at: string;
    updated_at: string;
    // Relationships
    user?: User;
    registration_period?: RegistrationPeriod;
    registration_type?: RegistrationType;
    registration_path?: RegistrationPath;
    program_studi_choice1?: ProgramStudi;
    program_studi_choice2?: ProgramStudi;
    program_studi_choice3?: ProgramStudi;
    accepted_program_studi?: ProgramStudi;
    // Accessors
    status_label?: string;
    status_badge_class?: string;
}

export interface Announcement {
    id: number;
    title: string;
    content: string;
    is_active: boolean;
    created_at: string;
    updated_at: string;
}

export interface LandingPageSetting {
    id: number;
    key: string;
    value: string;
    type: 'text' | 'textarea' | 'image' | 'json';
    created_at: string;
    updated_at: string;
}

// Extended User type with PMB relationships
export interface PmbUser {
    id: number;
    name: string;
    email: string;
    phone?: string;
    role: UserRole;
    email_verified_at?: string;
    created_at: string;
    updated_at: string;
    student_biodata?: StudentBiodata;
    registration?: Registration;
}
