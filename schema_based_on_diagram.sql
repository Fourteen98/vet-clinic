DROP DATABASE IF EXISTS clinic;
CREATE DATABASE clinic;

/* create patients table */
CREATE TABLE patients (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL
);

/* create table medical_histories */
CREATE TABLE medical_histories (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    admitted_at TIMESTAMP NOT NULL,
    patient_id BIGINT NOT NULL REFERENCES patients(id),
    status VARCHAR(255) NOT NULL
);

/* create table invoices */
CREATE TABLE invoices (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    medical_history_id BIGINT NOT NULL REFERENCES medical_histories(id),
    total_amount DECIMAL(10,2) NOT NULL,
    generated_at TIMESTAMP NOT NULL,
    payed_at TIMESTAMP NOT NULL
);

/* create table treatments */
CREATE TABLE treatments (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL
);

/* create table treatments_medical_history (m:n relation) */
CREATE TABLE treatments_medical_history (
    treatments_id INT NOT NULL REFERENCES treatments(id),
    medical_histories_id INT NOT NULL REFERENCES medical_histories(id)
);

/* create table invoice_items */
CREATE TABLE invoice_items (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    invoice_id INT NOT NULL REFERENCES invoices(id),
    treatments_id INT REFERENCES treatments(id)
);
