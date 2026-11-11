-- запросы для сессий

-- 1. Базовый аудит: Вывести список всех сессий, упорядоченных от самых свежих
SELECT id, session_token, ip_address, created_at 
FROM sessions 
ORDER BY created_at DESC;


-- 2. Логика активности: Найти все активные сессии на текущий момент (время действия не истекло)
-- Используется сервером для проверки, можно ли клиенту продолжать работу
SELECT * 
FROM sessions 
WHERE expired_at > NOW();


-- 3. Логика процесса: вывести сессии вместе со стоимостью их заказов и способом оплаты
-- Показывает финансовый результат по каждой сессии
SELECT 
    s.id AS session_id, 
    s.created_at AS session_start, 
    o.amount AS order_amount, 
    o.payment_method
FROM sessions s
JOIN orders o ON s.id = o.session_id;


-- 4. Логика схемы «Переход к печати»: найти все сессии, которые успешно завершились печатью
SELECT s.id AS successful_session_id, s.ip_address, o.printed_count, o.updated_at AS printed_at
FROM sessions s
JOIN orders o ON s.id = o.session_id
WHERE o.printed = TRUE;


-- 5. Логика «Брошенные сессии»: найти сессии, которые были созданы, но так и не дошли до создания заказа
-- Помогает отследить пользователей, которые закрыли приложение на этапе выбора шаблона или оплаты
SELECT s.id, s.created_at, s.ip_address
FROM sessions s
LEFT JOIN orders o ON s.id = o.session_id
WHERE o.id IS NULL;


-- 6. Аналитика тарифов: Посчитать среднее время тарифа и общую сумму выручки по завершенным сессиям
SELECT 
    COUNT(s.id) AS total_paid_sessions,
    AVG(o.tariff_minutes) AS average_tariff_duration,
    SUM(o.amount) AS total_revenue
FROM sessions s
JOIN orders o ON s.id = o.session_id
WHERE o.printed = TRUE;
