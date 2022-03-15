DROP TABLE IF EXISTS bill;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS item_count;


CREATE TABLE item (
    id INTEGER NOT NULL PRIMARY KEY,
    price FLOAT NOT NULL,
    name VARCHAR(200) NOT NULL,
    created_date INTEGER NOT NULL DEFAULT (strftime('%s', 'now'))
);

CREATE TABLE item_count (
    id INTEGER NOT NULL PRIMARY KEY,
    insert_count INTEGER NOT NULL,
    current_count INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    created_date INTEGER NOT NULL DEFAULT (strftime('%s', 'now')),
    CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES item(id)
);

CREATE TABLE bill (
    id INTEGER NOT NULL PRIMARY KEY,
    taked_count INTEGER NOT NULL DEFAULT 1,
    guest_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    created_date INTEGER NOT NULL DEFAULT (strftime('%s', 'now')),

    CONSTRAINT fk_guest_id FOREIGN KEY (guest_id) REFERENCES guest(id),
    CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES item(id)
);