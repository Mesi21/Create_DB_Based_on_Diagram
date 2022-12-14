/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    PRIMARY KEY(id)
);

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_histories(id),
    PRIMARY KEY(id)
);
CREATE INDEX  invoices_asc ON invoices(id ASC);

CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP ,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(250),
    PRIMARY KEY(id)
)

CREATE INDEX medical_histories_asc ON medical_histories(id ASC);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(50),
    name VARCHAR(100),
    PRIMARY KEY (id)
)

CREATE INDEX treatments_asc ON treatments(id ASC);

CREATE TABLE invoice_items (
    id GENERATED ALWAYS AS IDENTITY,
    unit_price decimal,
    quantity int ,
    total_price decimal,
    invoice_id int,
    treatment_id int,
    FOREIGN KEY(invoice_id) REFERENCES invoices(id),
    FOREIGN KEY(treatment_id) REFERENCES treatments(id),
    PRIMARY KEY (id)
)
CREATE INDEX invoice_id_asc ON invoice_items(invoice_id ASC);
CREATE INDEX treatment_id_asc ON invoice_items(treatment_id ASC);

CREAT TABLE medical_histories_treatments (
    medical_history_id int,
    treatment_id int,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id),
    PRIMARY KEY (medical_history_id,treatment_id)
)

CREATE INDEX medical_history_id_asc ON medical_histories_treatments(medical_history_id ASC);
CREATE INDEX treatment_id_asc ON medical_histories_treatments(treatment_id ASC);