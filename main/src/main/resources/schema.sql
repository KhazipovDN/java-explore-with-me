DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS locations CASCADE;
DROP TABLE IF EXISTS events CASCADE;
DROP TABLE IF EXISTS compilations CASCADE;
DROP TABLE IF EXISTS compilation_event CASCADE;
DROP TABLE IF EXISTS requests CASCADE;

CREATE TABLE IF NOT EXISTS users(
    id    BIGSERIAL PRIMARY KEY,
    name  VARCHAR(250) NOT NULL,
    email VARCHAR(254) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS categories(
    id   BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS locations(
    id  BIGSERIAL PRIMARY KEY,
    lat FLOAT CHECK (lat BETWEEN -90 AND 90),
    lon FLOAT CHECK (lon BETWEEN -180 AND 180)
);

CREATE TABLE IF NOT EXISTS events(
    id                 BIGSERIAL PRIMARY KEY,
    annotation         VARCHAR(2000) UNIQUE NOT NULL,
    category_id        BIGINT NOT NULL REFERENCES categories(id),
    created_on         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description        VARCHAR(7000) NOT NULL,
    event_date         TIMESTAMP NOT NULL,
    initiator_id       BIGINT REFERENCES users(id),
    location_id        BIGINT NOT NULL REFERENCES locations(id),
    paid               BOOLEAN,
    participant_limit  INTEGER CHECK (participant_limit >= 0),
    published_on       TIMESTAMP,
    request_moderation BOOLEAN,
    state              VARCHAR(10),
    title              VARCHAR(120) NOT NULL
);

CREATE TABLE IF NOT EXISTS compilations(
    id     BIGSERIAL PRIMARY KEY,
    pinned BOOLEAN DEFAULT FALSE,
    title  VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS compilation_event(
    compilation_id BIGINT REFERENCES compilations(id),
    event_id       BIGINT REFERENCES events(id),
    PRIMARY KEY (compilation_id, event_id)
);

CREATE TABLE IF NOT EXISTS requests(
    id           BIGSERIAL PRIMARY KEY,
    created      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    event_id     BIGINT REFERENCES events(id),
    requester_id BIGINT REFERENCES users(id),
    status       VARCHAR(50)
);
