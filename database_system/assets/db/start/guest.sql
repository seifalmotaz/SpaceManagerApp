DROP TABLE IF EXISTS guest;

CREATE TABLE guest (
    id INTEGER NOT NULL,
    name VARCHAR(51) NULL,
    email VARCHAR(200) NULL UNIQUE,
    phone VARCHAR(13) NULL UNIQUE,
    national_id VARCHAR(15) NULL UNIQUE,
    national_id_pic VARCHAR(255) NULL UNIQUE,
    password VARCHAR(150) NULL,
    created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_staff BOOLEAN DEFAULT FALSE,
    is_admin BOOLEAN DEFAULT FALSE,
    is_expired BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id),
    CONSTRAINT guest_email_phone CHECK (
        email IS NOT NULL
        OR phone IS NOT NULL
    )
);

CREATE UNIQUE INDEX guest_phone on guest(phone);