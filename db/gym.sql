DROP TABLE bookings;
DROP TABLE members;
DROP TABLE activities;

CREATE TABLE members
(
    id SERIAL primary key,
    first_name VARCHAR(255) not null,
    last_name VARCHAR(255) not null,
    date_of_birth DATE not null,
    membership_type VARCHAR(255)
);

CREATE TABLE activities
(
    id SERIAL primary key,
    category VARCHAR(255) not null,
    activity_date DATE not null,
    activity_time VARCHAR(255),
    number_of_spaces INT,
    registered_members INT
);

CREATE TABLE bookings
(
    id SERIAL primary key,
    activity_id INT references activities(id),
    member_id INT references members(id)
);