

/* ==============================================================================
   SELECT ALL COLUMNS
=============================================================================== */

-- هذا يرجع كل الأعمدة من جدول العملاء.
SELECT *
FROM customers



/* ==============================================================================
   SELECT FEW COLUMNS
=============================================================================== */

-- يرجع name, country, and score.
SELECT 
    first_name,
    country, 
    score
FROM customers

/* ==============================================================================
   WHEREشرط 
=============================================================================== */

-- يرجع العملاء اللي تقييمهم مو صفر
SELECT *
FROM customers
WHERE score != 0

-- عملاء من ألمانيا
SELECT *
FROM customers
WHERE country = 'Germany'

-- يرجع name and country من عملاء من ألمانيا 
SELECT
    first_name,
    country
FROM customers
WHERE country = 'Germany'


SELECT 
   first_name,
	country,
	score
FROM customers
WHERE score <= 500 AND score != 0
-- AND = لازم الشرطين يتحققون
/* ==============================================================================
الترتيب    ORDER BY
=============================================================================== */

/* ترتيب من الأعلى للأقل    DESC. */
SELECT *
FROM customers
ORDER BY score DESC

/* من الأقل للأعلى. */
SELECT *
FROM customers
ORDER BY score ASC

/* ترتيب حسب الدولة:. */
SELECT *
FROM customers
ORDER BY country ASC

/*  أول يرتب حسب الدولة، ثم داخل كل دولة حسب التقييم. */ 
SELECT *
FROM customers
ORDER BY country ASC, score DESC



/* ==============================================================================
 التجميع الي لازم تجيaggregate function مع مثال sum او avg   
 GROUP BY
=============================================================================== */

-- لو نبي مجموع التقييم لكل دولة  هنا سمينا عمود المجموع 
SELECT 
    country,
    SUM(score) AS total_score
FROM customers
GROUP BY country


 --  هنا في هذا الاستعلام في خطا نبي نستعرض الاسم الاول بس هو لا داخل  الدالة 
SELECT 
    country,
    first_name,
    SUM(score) AS total_score
FROM customers
GROUP BY country

-- لو نبي ايجاد مجموع التقييم وعدد العملاء الذين قيمو 
SELECT 
    country,
    SUM(score) AS total_score,
    COUNT(id) AS total_customers
FROM customers
GROUP BY country



/* ==============================================================================
   HAVING
   شرط بعد التجميع مو نفس where 
 يجي بس مع التجميع 
 GROUP BY

 WHERE تجي قبل التجميع GROUP BY
 HAVNG تجي بعد التجميع  GROUP BY
=============================================================================== */

/* يحسب المتوسط لكل دولة
يرجع فقط الدول اللي متوسطها أكبر من 430
ترىى AS 
فقط تعطي اسم للعمود للعرض فقط  */

SELECT
    country,
    AVG(score) AS avg_score
FROM customers
GROUP BY country
HAVING AVG(score) > 430

/* Find the average score for each country
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430 */
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430

/* ==============================================================================
   DISTINCT
   إزالة التكرار و ارجع قيمة فردية 
=============================================================================== */

-- يرجع الدول بدون تكرار
SELECT DISTINCT country
FROM customers

/* ==============================================================================
   TOP
   أعلى عدد سجلات
=============================================================================== */

-- يرجع أول 3 صفوف
SELECT TOP 3 *
FROM customers

-- أعلى 3 تقييم بترتيب 
SELECT TOP 3 *
FROM customers
ORDER BY score DESC

-- اقل 2 بترتيب 
SELECT TOP 2 *
FROM customers
ORDER BY score ASC

-- Get the Two Most Recent Orders
SELECT TOP 2 *
FROM orders
ORDER BY order_date DESC

/* ==============================================================================
   All Together
   دمج كل شيء مع بعض
=============================================================================== */

/* هذا يسوي:
يستبعد التقييم = 0
يجمع حسب الدولة
يحسب المتوسط
يفلتر الدول > 430
يرتب من الأعلى. */
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430
ORDER BY AVG(score) DESC
