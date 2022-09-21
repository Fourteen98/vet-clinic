DROP DATABASE IF EXISTS clinic;
CREATE DATABASE clinic;

/* create patients table */
CREATE TABLE patients (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL
);