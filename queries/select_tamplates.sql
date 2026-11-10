Показывает шаблоны, которые использовали чаще всего
SELECT name, category, usage_count FROM templates ORDER BY usage_count DESC; 

Показывает шаблоны, которые использовали реже всего
SELECT name, category, usage_count FROM templates ORDER BY usage_count ASC;

Сколько шаблоннов каждой категории
SELECT category, COUNT(*) AS templates_count FROM templates GROUP BY category ORDER BY templates_count DESC;

Общая выручка по каждому шаблону 
SELECT t.name AS template_name, SUM(o.amount) AS total_revenue
FROM templates t JOIN sessions s ON t.id = s.template_id JOIN orders o ON s.id = o.session_id GROUP BY t.id, t.name
ORDER BY total_revenue DESC;

Посчитать общее количество активных шаблонов
SELECT COUNT(*) AS active_templates_count FROM templates WHERE activeness = TRUE;

Шаблоны, которые ни разу не были использованы в сессиях
SELECT t.name, t.usage_count
FROM templates t LEFT JOIN sessions s ON t.id = s.template_id WHERE s.id IS NULL;
