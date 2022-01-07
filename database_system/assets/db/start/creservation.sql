DROP TABLE IF EXISTS course;

DROP TABLE IF EXISTS course_registration;

DROP TABLE IF EXISTS course_registration;

CREATE TABLE course (
    id INTEGER NOT NULL PRIMARY KEY,
    lecturer_id INTEGER NOT NULL,
    total_price FLOAT NOT NULL,
    name VARCHAR(200) NOT NULL,
    description VARCHAR(200) NULL,
    start_date INTEGER NOT NULL,
    end_date INTEGER NOT NULL,
    is_expired BOOLEAN DEFAULT FALSE
    CONSTRAINT fk_guest_id FOREIGN KEY (guest_id) REFERENCES guest(id),
);

CREATE TABLE course_registration (
    id INTEGER NOT NULL,
    guest_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    is_paid BOOLEAN NOT NULL DEFAULT FALSE,
    created_date INTEGER NOT NULL DEFAULT strftime('%s', 'now'),
    CONSTRAINT fk_guest_id FOREIGN KEY (guest_id) REFERENCES guest(id),
    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE creservation (
    id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    room_id INTEGER NOT NULL,
    time_in INTEGER NOT NULL,
    time_out INTEGER NOT NULL,
    created_date INTEGER NOT NULL DEFAULT strftime('%s', 'now'),
    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course(id),
    CONSTRAINT fk_room_id FOREIGN KEY (room_id) REFERENCES room(id)
);