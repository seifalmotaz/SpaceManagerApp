DROP TABLE IF EXISTS course;

DROP TABLE IF EXISTS course_registration;

DROP TABLE IF EXISTS course_registration;

DROP TABLE IF EXISTS csession;

CREATE TABLE course (
    id INTEGER NOT NULL PRIMARY KEY,
    rate FLOAT NOT NULL,
    name VARCHAR(200) NOT NULL,
    description VARCHAR(200) NULL,
    start_time INTEGER NOT NULL,
    end_time INTEGER NOT NULL,
    is_expired BOOLEAN DEFAULT FALSE
);

CREATE TABLE course_registration (
    id INTEGER NOT NULL,
    guest_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    paid_amount FLOAT NULL,
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
    paid_amount FLOAT NULL,
    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course(id),
    CONSTRAINT fk_room_id FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE csession (
    id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    room_id INTEGER NOT NULL,
    reservation_id INTEGER NULL,
    time_in INTEGER NOT NULL DEFAULT strftime('%s', 'now'),
    time_out INTEGER NULL,
    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course(id),
    CONSTRAINT fk_room_id FOREIGN KEY (room_id) REFERENCES room(id),
    CONSTRAINT fk_reservation_id FOREIGN KEY (reservation_id) REFERENCES reservation(id),
    PRIMARY KEY (id),
    CONSTRAINT course_paid_end CHECK (
        (
            time_out IS NOT NULL
            AND paid_amount IS NOT NULL
        )
        OR (
            time_out IS NULL
            AND paid_amount IS NULL
        )
    )
);