USE photobooth_db;

INSERT INTO templates (name, category, preview_url, style_params, usage_count, activeness) VALUES
('Ретро', 'рамка', '/img/retro.jpg', '{"color":"sepia"}', 150, TRUE),
('Праздник', 'рамка', '/img/holiday.jpg', '{"color":"gold"}', 300, TRUE),
('Минимализм', 'стиль', '/img/minimal.jpg', '{"color":"white"}', 80, TRUE),
('Коллаж 4 фото', 'коллаж', '/img/collage4.jpg', '{"grid":"2x2"}', 210, TRUE),
('Новогодний', 'рамка', '/img/newyear.jpg', '{"color":"blue"}', 400, TRUE);

INSERT INTO sessions (qr_token, template_id, created_at, expired_at) VALUES
('qr_retro_001', 1, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('qr_party_002', 2, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('qr_party_003', 2, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('qr_newyear_004', 5, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('qr_collage_005', 4, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY));

INSERT INTO orders (session_id, tariff_minutes, amount, payment_method, printed_count, printed) VALUES
(1, 5, 300.00, 'card', 5, TRUE),
(2, 10, 500.00, 'qr', 5, TRUE),
(3, 5, 300.00, 'card', 5, TRUE),
(4, 20, 800.00, 'card', 5, FALSE),
(5, 10, 500.00, 'qr', 0, FALSE);

INSERT INTO admins (email, password_hash, name, role) VALUES
('admin@mail.ru', 'hash1', 'Аня', 'admin'),
('manager@mail.ru', 'hash2', 'Алена', 'manager'),
('boss@mail.ru', 'hash3', 'Ева', 'admin');


