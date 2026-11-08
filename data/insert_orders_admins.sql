USE photobooth_db;

INSERT INTO admins (email, password_hash, name, role) VALUES
('admin@mail.ru', 'hash1', 'Иван', 'admin'),
('manager@mail.ru', 'hash2', 'Мария', 'manager'),
('boss@mail.ru', 'hash3', 'Сергей', 'admin');

INSERT INTO orders (session_id, tariff_minutes, amount, payment_method, printed_count, printed) VALUES
(1, 5, 300.00, 'card', 5, TRUE),
(2, 10, 500.00, 'qr', 5, TRUE),
(3, 5, 300.00, 'card', 5, TRUE),
(4, 20, 800.00, 'card', 5, FALSE),
(5, 10, 500.00, 'qr', 0, FALSE);

