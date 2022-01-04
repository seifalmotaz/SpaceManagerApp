DROP TABLE IF EXISTS guests;

DROP TABLE IF EXISTS prices;

DROP TABLE IF EXISTS rooms;

DROP TABLE IF EXISTS reservations;

DROP TABLE IF EXISTS sessions;

DROP TABLE IF EXISTS courses;

DROP TABLE IF EXISTS bills;

DROP TABLE IF EXISTS course_sessions;

CREATE TABLE guests (
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(51) NULL,
    email VARCHAR(200) NULL UNIQUE,
    phone VARCHAR(13) NULL UNIQUE,
    national_id VARCHAR(15) NULL UNIQUE,
    national_id_pic VARCHAR(255) NULL UNIQUE,
    password VARCHAR(150) NULL,
    career VARCHAR(50) NOT NULL,
    gender VARCHAR(7) NULL,
    created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_staff BOOLEAN DEFAULT FALSE,
    is_admin BOOLEAN DEFAULT FALSE,
    is_expired BOOLEAN DEFAULT FALSE
);

CREATE TABLE prices (
    id INTEGER NOT NULL PRIMARY KEY,
    rate FLOAT NOT NULL,
    is_deleted BOOLEAN DEFAULT FALSE,
    description VARCHAR(200) NULL DEFAULT 'Workspace price rate',
    is_default BOOLEAN DEFAULT FALSE
);

CREATE TABLE courses (
    id INTEGER NOT NULL PRIMARY KEY,
    rate FLOAT NOT NULL,
    is_deleted BOOLEAN DEFAULT FALSE,
    name VARCHAR(200) NOT NULL,
    capacity INTEGER NOT NULL
);

CREATE TABLE rooms (
    id INTEGER NOT NULL PRIMARY KEY,
    name FLOAT NOT NULL,
    capacity INTEGER NOT NULL,
    is_deleted BOOLEAN DEFAULT FALSE,
    rate FLOAT NULL
);

CREATE TABLE reservations (
    id INTEGER NOT NULL PRIMARY KEY,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    room_id INTEGER NOT NULL,
    guest_id INTEGER NULL,
    course_id INTEGER NULL,
    is_pre_paid BOOLEAN DEFAULT TRUE,
    is_cancelled BOOLEAN DEFAULT FALSE,
    created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_room_id FOREIGN KEY (room_id) REFERENCES rooms(id),
    CONSTRAINT fk_guest_id FOREIGN KEY (guest_id) REFERENCES guests(id),
    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE sessions (
    id INTEGER NOT NULL PRIMARY KEY,
    guest_id INTEGER NULL,
    start_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    end_time TIMESTAMP NULL,
    guests_count INTEGER DEFAULT 1,
    price_id INTEGER NULL,
    course_id INTEGER NULL,
    room_id INTEGER NULL,
    reservation_id INTEGER NULL,
    CONSTRAINT fk_guest_id FOREIGN KEY (guest_id) REFERENCES guests(id),
    CONSTRAINT fk_room_id FOREIGN KEY (room_id) REFERENCES rooms(id),
    CONSTRAINT fk_price_id FOREIGN KEY (price_id) REFERENCES prices(id),
    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES courses(id),
    CONSTRAINT fk_reservation_id FOREIGN KEY (reservation_id) REFERENCES reservations(id)
);

CREATE TABLE course_sessions (
    id INTEGER NOT NULL PRIMARY KEY,
    guest_id INTEGER NOT NULL,
    course_session_id INTEGER NULL,
    course_reservation_id INTEGER NOT NULL,
    created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    course_id INTEGER NULL,
    CONSTRAINT fk_guest_id FOREIGN KEY (guest_id) REFERENCES guests(id),
    CONSTRAINT fk_course_session_id FOREIGN KEY (course_session_id) REFERENCES sessions(id),
    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES courses(id),
    CONSTRAINT fk_course_reservation_id FOREIGN KEY (course_reservation_id) REFERENCES reservations(id)
);

CREATE TABLE bills (
    id INTEGER NOT NULL PRIMARY KEY,
    total FLOAT NULL,
    staff_id INTEGER NOT NULL,
    session_id INTEGER NULL,
    course_session_id INTEGER NULL,
    reservation_id INTEGER NULL,
    created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_staff_id FOREIGN KEY (staff_id) REFERENCES guests(id),
    CONSTRAINT fk_session_id FOREIGN KEY (session_id) REFERENCES sessions(id),
    CONSTRAINT fk_course_session_id FOREIGN KEY (course_session_id) REFERENCES course_sessions(id),
    CONSTRAINT fk_reservation_id FOREIGN KEY (reservation_id) REFERENCES reservations(id)
);

CREATE UNIQUE INDEX guest_id on guests (id);

CREATE UNIQUE INDEX price_id on prices (id);

CREATE UNIQUE INDEX course_id on courses (id);

CREATE UNIQUE INDEX reservation_id on reservations (id);

CREATE UNIQUE INDEX session_id on sessions (id);

CREATE UNIQUE INDEX course_session_id on course_sessions (id);

CREATE UNIQUE INDEX room_id on rooms (id);

CREATE UNIQUE INDEX bill_id on bills (id);