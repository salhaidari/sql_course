/*
=============================================================
إنشاء قاعدة البيانات وإعداد الجداول (نسخة MySQL)
=============================================================
هدف السكربت:
    هذا السكربت يقوم بإنشاء قاعدة بيانات جديدة باسم 'MyDatabase'.
    إذا كانت قاعدة البيانات موجودة مسبقًا، سيتم حذفها لضمان بداية نظيفة.
    بعد ذلك يقوم بإنشاء جدولين: 'customers' و 'orders'
    مع تصميمهما، ثم إدخال بيانات تجريبية.

تحذير:
    تشغيل هذا السكربت سيؤدي إلى حذف قاعدة البيانات بالكامل إذا كانت موجودة،
    وسيتم حذف جميع البيانات نهائيًا. تأكد من وجود نسخة احتياطية قبل التنفيذ.
*/

DROP DATABASE IF EXISTS Database_Lama;
CREATE DATABASE Database_Lama;
USE Database_Lama;
/*
حذف قاعدة البيانات إذا كانت موجودة
ينشئ قاعدة جديدة
يحددها للاستخدام
*/

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id INT NOT NULL,
    first_name VARCHAR(50),
    country VARCHAR(50),
    score INT,
    PRIMARY KEY (id)
);
/*
حذف الجدول إذا موجود
إنشاء جدول جديد
id مفتاح أساسي (لا يتكرر ولا يكون فارغ)
*/
INSERT INTO customers (id, first_name, country, score) VALUES
    (1, 'Maria', 'Germany', 350),
    (2, ' John', 'USA', 900),
    (3, 'Georg', 'UK', 750),
    (4, 'Martin', 'Germany', 500),
    (5, 'Peter', 'USA', 0);
/*
إدخال 5 عملاء
*/
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE,
    sales INT,
    PRIMARY KEY (order_id)
);
/*
جدول للطلبات
كل طلب له order_id
customer_id يربط الطلب بالعميل 
(لكن لم يتم تعريفه كـ FOREIGN KEY هنا)
*/
INSERT INTO orders (order_id, customer_id, order_date, sales) VALUES
    (1001, 1, '2021-01-11', 35),
    (1002, 2, '2021-04-05', 15),
    (1003, 3, '2021-06-18', 20),
    (1004, 4, '2021-08-31', 10);
/*

*/
ALTER TABLE customers
ADD COLUMN last_name VARCHAR(50) AFTER first_name;
/*
إضافة عمود last_name
وضعه بعد first_name
*/
UPDATE customers
SET last_name = CASE id
    WHEN 1 THEN 'Müller'
    WHEN 2 THEN 'Smith'
    WHEN 3 THEN 'Brown'
    WHEN 4 THEN 'Schneider'
    WHEN 5 THEN 'Johnson'
END;
/*
يحدد اسم عائلة لكل عميل حسب id
*/
UPDATE customers 
SET last_name = CASE id
    WHEN 1 THEN 'Müller'
    WHEN 2 THEN 'Smith'
    WHEN 3 THEN 'Brown'
    WHEN 4 THEN 'Schneider'
    WHEN 5 THEN 'Johnson'
END
WHERE id IN (1, 2, 3, 4, 5);
/*
نفس السابق لكن فقط للـ 
IDs المحددة
*/
UPDATE customers SET last_name = 'smart' WHERE id = 1;
/*
غير اسم العائلة للعميل رقم 1 فقط
*/
UPDATE customers 
SET last_name = 'Noor' 
WHERE id IN (1, 2, 3, 4, 5);
/*
يغير جميع القيم إلى 
"Noor"
*/

/*

*/

/*

*/