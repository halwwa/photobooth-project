-- запросы для сессий

-- 1. Вывести список всех сессий, упорядоченных от самых свежих
SELECT id, qr_token, template_id, created_at 
FROM sessions 
ORDER BY created_at DESC;


-- 2. Найти все активные сессии на текущий момент (у которых время действия еще не истекло)
SELECT * 
FROM sessions 
WHERE expired_at > NOW();


-- 3. Вывести сессии вместе с суммами их заказов и способом оплаты
SELECT 
    s.id AS session_id, 
    s.created_at AS session_start, 
    o.amount AS order_amount, 
    o.payment_method
FROM sessions s
JOIN orders o ON s.id = o.session_id;


-- 4. Найти все сессии, которые успешно завершились печатью фотографий
SELECT s.id AS successful_session_id, s.qr_token, o.printed_count 
FROM sessions s
JOIN orders o ON s.id = o.session_id
WHERE o.printed = TRUE;


-- 5. Найти брошенные сессии (которые были созданы, но пользователи так и не оплатили заказ)
SELECT s.id, s.created_at, s.qr_token
FROM sessions s
LEFT JOIN orders o ON s.id = o.session_id
WHERE o.id IS NULL;
