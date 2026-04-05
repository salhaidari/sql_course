INSERT ➜ إضافة صف جديد

UPDATE ➜ لتعديل بيانات موجودة

PRIMARY KEY ➜ يمنع التكرار

ALTER TABLE ➜ تعديل هيكل الجدول

CASE ➜ لتحديد قيم مختلفة حسب شرط


SELECT = جلب بيانات

WHERE = فلترة

ORDER BY = ترتيب

GROUP BY = تجميع

HAVING = شرط على التجميع

DISTINCT = حذف التكرار

TOP = تحديد عدد النتائج
Here's the general logical execution order for SQL queries:

|  Step | Clause                     | Explanation                                                      |
| :---: | :------------------------- | :--------------------------------------------------------------- |
| **1** | `FROM`                     | Identify source table(s), apply joins                            |
| **2** | `WHERE`                    | Filter rows — remove records that don't meet conditions          |
| **3** | `GROUP BY`                 | Group remaining rows by specified columns                        |
| **4** | `HAVING`                   | Filter groups — remove groups that don't meet conditions         |
| **5** | `SELECT`                   | Calculate expressions, apply aggregate functions, assign aliases |
| **6** | `DISTINCT`                 | Remove duplicate rows from result set                            |
| **7** | `ORDER BY`                 | Sort final results (can use aliases from SELECT)                 |
| **8** | `LIMIT` / `OFFSET` / `TOP` | Restrict number of rows returned                                 |
   

| Concept                            | Explanation                                                     |
| :--------------------------------- | :-------------------------------------------------------------- |
| **Why `WHERE` before `GROUP BY`**  | Filters individual rows first, then aggregates — more efficient |
| **Why `HAVING` after `GROUP BY`**  | Filters on aggregated values (e.g., `SUM(sales) > 1000`)        |
| **Why `SELECT` before `ORDER BY`** | Aliases created in `SELECT` are available for sorting           |
| **Why `ORDER BY` last**            | Sorting happens on the final result set                         |

Visual Flow:
Raw Data → FROM → WHERE → GROUP BY → HAVING → SELECT → DISTINCT → ORDER BY → LIMIT → Final Result

ما هو القيد (Constraint) في قواعد البيانات؟

القيد هو قاعدة تفرضها قاعدة البيانات على البيانات داخل الجدول لضمان أنها صحيحة ومنظمة. بمعنى آخر، هو مثل حارس يراقب البيانات ويمنع أي شيء خاطئ أو غير مرغوب فيه.

هناك أنواع شائعة من القيود:

PRIMARY KEY (المفتاح الأساسي)
يضمن أن العمود يحتوي على قيم فريدة وغير فارغة لكل صف.
مثال: إذا id هو المفتاح الأساسي، لا يمكن أن يكون لديك صفين بنفس الرقم، ولا يمكن أن يكون id فارغ.
يشبه بطاقة هوية لكل صف، كل شخص له رقم تعريف مختلف
