DROP TABLE IF EXISTS room;

DROP TABLE IF EXISTS reservation;

DROP TABLE IF EXISTS session;

DROP TABLE IF EXISTS price;

CREATE TABLE price (
    id INTEGER NOT NULL PRIMARY KEY,
    rate FLOAT NOT NULL,
    description VARCHAR(200) NULL DEFAULT 'Workspace price rate',
    is_default BOOLEAN DEFAULT FALSE,
    is_deleted BOOLEAN DEFAULT FALSE,
    is_per_day BOOLEAN DEFAULT FALSE,
    created_date INTEGER NOT NULL DEFAULT (strftime('%s', 'now'))
);

CREATE TABLE room (
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    rate FLOAT NOT NULL,
    capacity INTEGER NOT NULL,
    is_deleted BOOLEAN DEFAULT FALSE
);

CREATE TABLE reservation (
    id INTEGER NOT NULL PRIMARY KEY,
    tag VARCHAR(200) NOT NULL,
    capacity INTEGER NOT NULL,
    paid_amount FLOAT NULL,
    extra_hours_price FLOAT NULL,
    custom_paid BOOLEAN DEFAULT FALSE,

    guest_id INTEGER NULL,
    course_id INTEGER NULL,
    room_id INTEGER NOT NULL,

    time_in INTEGER NOT NULL,
    time_out INTEGER NOT NULL,
    created_date INTEGER NOT NULL DEFAULT (strftime('%s', 'now')),
    is_cancelled BOOLEAN DEFAULT FALSE,

    CONSTRAINT fk_guest_id FOREIGN KEY (guest_id) REFERENCES guest(id),
    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course(id),
    CONSTRAINT fk_room_id FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE session (
    id INTEGER NOT NULL PRIMARY KEY,
    guest_count INTEGER NULL,
    time_out INTEGER NULL,
    time_in INTEGER NOT NULL DEFAULT (strftime('%s', 'now')),

    price_id INTEGER NULL,
    guest_id INTEGER NULL,
    course_id INTEGER NULL,
    room_id INTEGER NULL,
    reservation_id INTEGER NULL,

    paid_amount FLOAT NULL,
    custom_paid BOOLEAN DEFAULT FALSE,
    
    CONSTRAINT fk_guest_id FOREIGN KEY (guest_id) REFERENCES guest(id),
    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course(id),
    CONSTRAINT fk_room_id FOREIGN KEY (room_id) REFERENCES room(id),
    CONSTRAINT fk_reservation_id FOREIGN KEY (reservation_id) REFERENCES reservation(id),
    CONSTRAINT fk_price_id FOREIGN KEY (price_id) REFERENCES price(id)
);