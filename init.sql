-- Drop existing tables to start fresh
DROP TABLE IF EXISTS products, buyers, vendors, invoices, invoice_items;

-- Create Products Table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    sku VARCHAR(100),
    quantity INT DEFAULT 0,
    price NUMERIC(10, 2) DEFAULT 0.00
);

-- Create Buyers Table
CREATE TABLE buyers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    due NUMERIC(10, 2) DEFAULT 0.00
);

-- Create Vendors Table
CREATE TABLE vendors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20)
);

-- Create Invoices Table
CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    buyer VARCHAR(255),
    date DATE NOT NULL,
    total NUMERIC(10, 2) DEFAULT 0.00,
    due NUMERIC(10, 2) DEFAULT 0.00
);

-- Create Invoice Items Table (for relating products to invoices)
CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    invoice_id INT REFERENCES invoices(id),
    product_id INT REFERENCES products(id),
    quantity INT,
    rate NUMERIC(10, 2)
);


-- Insert Mock Data

-- Mock Products
INSERT INTO products (name, sku, quantity, price) VALUES
('1/2" Steel Pipe', 'SKU001', 100, 15.50),
('3/4" PVC Elbow', 'SKU002', 250, 1.25),
('Wrench Set', 'SKU003', 50, 75.00),
('Hammer', 'SKU004', 80, 22.99),
('Drill Machine', 'SKU005', 30, 120.00);

-- Mock Buyers
INSERT INTO buyers (name, phone, address, due) VALUES
('Abdur Rahim', '01711111111', 'Dhaka, Bangladesh', 1500.00),
('Kamal Hossain', '01822222222', 'Chittagong, Bangladesh', 0.00),
('Fatima Begum', '01933333333', 'Sylhet, Bangladesh', 550.75);

-- Mock Vendors
INSERT INTO vendors (name, phone) VALUES
('National Pipes Ltd.', '01555555555'),
('Modern Hardware Supply', '01666666666');

-- Mock Invoices
INSERT INTO invoices (buyer, date, total, due) VALUES
('Abdur Rahim', '2023-10-15', 3500.00, 1500.00),
('Kamal Hossain', '2023-10-20', 1250.50, 0.00),
('Abdur Rahim', '2023-10-25', 800.00, 0.00);

-- Note: Mock data for invoice_items is not included to keep it simple,
-- but the table is ready for future development.

-- Grant all privileges on all tables in the public schema to the default user.
-- The user is determined by the POSTGRES_USER env var.
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "user";
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO "user";
