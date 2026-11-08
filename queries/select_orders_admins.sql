-- 1. Все заказы
SELECT * FROM orders;

-- 2. Общая выручка
SELECT SUM(amount) AS total_revenue FROM orders;

-- 3. Только оплата картой
SELECT * FROM orders WHERE payment_method = 'card';

-- 4. Не напечатанные заказы
SELECT * FROM orders WHERE printed = FALSE;

-- 5. Средний чек
SELECT AVG(amount) AS average_check FROM orders;

-- 1. Все админы
SELECT * FROM admins;

-- 2. Только с ролью 'admin'
SELECT name, email FROM admins WHERE role = 'admin';

-- 3. Поиск по email
SELECT * FROM admins WHERE email = 'admin@mail.ru';

-- 4. Количество админов
SELECT COUNT(*) AS total_admins FROM admins;

-- 5. Уникальные роли
SELECT DISTINCT role FROM admins;
