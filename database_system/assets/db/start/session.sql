DROP TABLE IF EXISTS price;

DROP TABLE IF EXISTS session;

CREATE TABLE price (
    id INTEGER NOT NULL PRIMARY KEY,
    rate FLOAT NOT NULL,
    description VARCHAR(200) NULL DEFAULT 'Workspace price rate',
    is_default BOOLEAN DEFAULT FALSE,
    is_deleted BOOLEAN DEFAULT FALSE,
    is_per_day BOOLEAN DEFAULT FALSE,
    created_date INTEGER NOT NULL DEFAULT strftime('%s', 'now')
);

CREATE TABLE session (
    id INTEGER NOT NULL,
    guest_id INTEGER NOT NULL,
    price_id INTEGER NOT NULL,
    guest_count INTEGER NOT NULL DEFAULT 1,
    time_in INTEGER NOT NULL DEFAULT strftime('%s', 'now'),
    time_out INTEGER NULL,
    paid_amount FLOAT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_guest_id FOREIGN KEY (guest_id) REFERENCES guest(id),
    CONSTRAINT fk_price_id FOREIGN KEY (price_id) REFERENCES price(id),
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