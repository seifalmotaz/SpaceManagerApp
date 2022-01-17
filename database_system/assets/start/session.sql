DROP TABLE IF EXISTS room;

DROP TABLE IF EXISTS reservation;

DROP TABLE IF EXISTS session;

DROP TABLE IF EXISTS price;

CREATE TABLE price (
    id INTEGER NOT NULL PRIMARY KEY,
    rate FLOAT NOT NULL,
    options TEXT NULL,
    description VARCHAR(200) NULL DEFAULT 'Workspace price rate',
    is_default BOOLEAN DEFAULT FALSE,
    is_deleted BOOLEAN DEFAULT FALSE,
    is_per_day BOOLEAN DEFAULT FALSE,
    created_date INTEGER NOT NULL DEFAULT (strftime('%s', 'now'))
);

CREATE TABLE room (
    name VARCHAR(200) NOT NULL,
    id INTEGER NOT NULL PRIMARY KEY,
    rate FLOAT NOT NULL,
    capacity INTEGER NOT NULL,
    is_deleted BOOLEAN DEFAULT FALSE
);

CREATE TABLE reservation (
    id INTEGER NOT NULL,
    guest_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    room_id INTEGER NOT NULL,
    time_in INTEGER NOT NULL,
    time_out INTEGER NOT NULL,
    created_date INTEGER NOT NULL DEFAULT (strftime('%s', 'now')),
    paid_amount FLOAT NULL,
    is_cancelled BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_guest_id FOREIGN KEY (guest_id) REFERENCES guest(id),
    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course(id),
    CONSTRAINT fk_room_id FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE session (
    id INTEGER NOT NULL,
    price_id INTEGER NULL,
    guest_id INTEGER NULL,
    course_id INTEGER NULL,
    room_id INTEGER NULL,
    reservation_id INTEGER NULL,
    time_in INTEGER NOT NULL DEFAULT (strftime('%s', 'now')),
    time_out INTEGER NULL,
    paid_amount FLOAT NULL,
    guest_count INTEGER NULL,
    CONSTRAINT fk_guest_id FOREIGN KEY (guest_id) REFERENCES guest(id),
    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course(id),
    CONSTRAINT fk_room_id FOREIGN KEY (room_id) REFERENCES room(id),
    CONSTRAINT fk_reservation_id FOREIGN KEY (reservation_id) REFERENCES reservation(id),
    CONSTRAINT fk_price_id FOREIGN KEY (price_id) REFERENCES price(id),
    PRIMARY KEY (id),
    CONSTRAINT guest_paid_end CHECK (
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