# MySQL 实战练习题

> 配合《mysql 学习笔记.md》使用  
> 建议：先自己写，不要直接看答案，写完后对比参考答案

---

## 第一阶段：基础查询

### 练习 1：分页查询

1. 查询前 3 个用户
2. 查询第 2 页的用户（每页 2 条）
3. 查询最新的 3 篇文章（按发布时间）

<details>
<summary>点击查看答案</summary>

```sql
-- 1. 查询前 3 个用户
SELECT * FROM users LIMIT 3;

-- 2. 查询第 2 页的用户（每页 2 条）
-- 第 2 页：跳过 2 条，取 2 条
SELECT * FROM users LIMIT 2 OFFSET 2;

-- 3. 查询最新的 3 篇文章
SELECT * FROM articles ORDER BY create_time DESC LIMIT 3;
```
</details>

---

### 练习 2：模糊搜索

1. 搜索标题包含"教程"的文章
2. 搜索以"MySQL"开头的文章
3. 搜索 email 包含 "example.com" 的用户

<details>
<summary>点击查看答案</summary>

```sql
-- 1. 搜索标题包含"教程"的文章
SELECT * FROM articles WHERE title LIKE '%教程%';

-- 2. 搜索以"MySQL"开头的文章
SELECT * FROM articles WHERE title LIKE 'MySQL%';

-- 3. 搜索 email 包含 "example.com" 的用户
SELECT * FROM users WHERE email LIKE '%example.com%';
```

**要点回顾**：
- `%` 在前：无法用索引（全表扫描）
- `%` 在后：可以用索引（前缀匹配）
</details>

---

## 第二阶段：多表查询

### 练习 3：JOIN 查询

1. 查询所有文章，并显示作者名字
2. 查询用户 Alice 发布的所有文章
3. 查询每篇文章的评论数量（包括没有评论的文章）

<details>
<summary>点击查看答案</summary>

```sql
-- 1. 查询所有文章，并显示作者名字
SELECT a.id, a.title, u.name as author_name
FROM articles a
JOIN users u ON a.author_id = u.id;

-- 2. 查询用户 Alice 发布的所有文章
SELECT a.* 
FROM articles a
JOIN users u ON a.author_id = u.id
WHERE u.name = 'Alice';

-- 3. 查询每篇文章的评论数量（包括没有评论的文章）
-- 注意：用 LEFT JOIN 保留没有评论的文章
SELECT a.id, a.title, COUNT(c.id) as comment_count
FROM articles a
LEFT JOIN comments c ON a.id = c.article_id
GROUP BY a.id, a.title;
```
</details>

---

### 练习 4：复杂 JOIN

1. 查询所有评论，显示：评论内容、文章标题、评论者名字
2. 查询用户 Bob 发表的所有评论及其对应的文章标题

<details>
<summary>点击查看答案</summary>

```sql
-- 1. 查询所有评论，显示评论内容、文章标题、评论者名字
SELECT 
    c.content as comment_content,
    a.title as article_title,
    u.name as commenter_name
FROM comments c
JOIN articles a ON c.article_id = a.id
JOIN users u ON c.user_id = u.id;

-- 2. 查询用户 Bob 发表的所有评论及其对应的文章标题
SELECT 
    c.content as comment_content,
    a.title as article_title
FROM comments c
JOIN articles a ON c.article_id = a.id
JOIN users u ON c.user_id = u.id
WHERE u.name = 'Bob';
```
</details>

---

## 第三阶段：聚合统计

### 练习 5：GROUP BY 统计

1. 统计每个用户的订单总金额
2. 统计每个作者的文章数量
3. 统计每个月的订单总额

<details>
<summary>点击查看答案</summary>

```sql
-- 1. 统计每个用户的订单总金额
SELECT u.name, SUM(o.amount) as total_amount
FROM orders o
JOIN users u ON o.user_id = u.id
GROUP BY u.id, u.name;

-- 2. 统计每个作者的文章数量
-- 注意：用 LEFT JOIN 包括没有文章的作者
SELECT u.name, COUNT(a.id) as article_count
FROM users u
LEFT JOIN articles a ON u.id = a.author_id
GROUP BY u.id, u.name;

-- 3. 统计每个月的订单总额
SELECT 
    DATE_FORMAT(create_time, '%Y-%m') as month,
    SUM(amount) as total_amount
FROM orders
GROUP BY DATE_FORMAT(create_time, '%Y-%m')
ORDER BY month;
```
</details>

---

### 练习 6：HAVING 过滤

1. 找出订单总金额超过 200 的用户
2. 找出发表文章数量大于 1 个的作者

<details>
<summary>点击查看答案</summary>

```sql
-- 1. 找出订单总金额超过 200 的用户
-- 注意：聚合后的过滤用 HAVING，不能用 WHERE
SELECT u.name, SUM(o.amount) as total_amount
FROM orders o
JOIN users u ON o.user_id = u.id
GROUP BY u.id, u.name
HAVING SUM(o.amount) > 200;

-- 2. 找出发表文章数量大于 1 个的作者
SELECT u.name, COUNT(a.id) as article_count
FROM users u
JOIN articles a ON u.id = a.author_id
GROUP BY u.id, u.name
HAVING COUNT(a.id) > 1;
```

**要点回顾**：
| 关键字 | 执行时机 | 用途 |
|--------|----------|------|
| `WHERE` | 聚合**之前** | 过滤原始行 |
| `HAVING` | 聚合**之后** | 过滤分组结果 |
</details>

---

## 第四阶段：索引优化

### 练习 7：EXPLAIN 分析

1. 对以下 SQL 使用 `EXPLAIN` 分析，观察执行计划：
   - `SELECT * FROM articles WHERE author_id = 1`
   - `SELECT * FROM articles WHERE title LIKE '%MySQL%'`
2. 观察 `key` 和 `Extra` 字段，理解是否用到索引

```sql
-- 练习 SQL
EXPLAIN SELECT * FROM articles WHERE author_id = 1;
EXPLAIN SELECT * FROM articles WHERE title LIKE '%MySQL%';
```

**观察要点**：
- `key` 列：实际使用的索引
- `Extra` 列：
  - `Using filesort` ❌：需要额外排序（慢）
  - `Using index` ✅：只用索引就能完成（快）
  - `Using where; Using index` ⚠️：覆盖索引

---

### 练习 8：创建优化索引

1. 为 `orders` 表创建索引，优化按 `user_id` 查询
2. 为 `articles` 表创建组合索引，优化 `WHERE author_id = ? ORDER BY create_time`
3. 使用 `EXPLAIN` 验证索引效果

<details>
<summary>点击查看答案</summary>

```sql
-- 1. 为 orders 表创建索引
CREATE INDEX idx_user_id ON orders(user_id);

-- 2. 为 articles 表创建组合索引
-- 注意：author_id 放前面（选择性高），create_time 放后面（用于排序）
CREATE INDEX idx_author_time ON articles(author_id, create_time);

-- 3. 验证索引效果
EXPLAIN SELECT * FROM articles WHERE author_id = 1 ORDER BY create_time DESC LIMIT 10;
-- 观察 Extra 字段，应该没有 "Using filesort"
```

**要点回顾**：
- 选择性高的字段放前面（区分度越高越好）
- 组合索引可以同时优化"过滤 + 排序"，避免 filesort
</details>

---

## 第五阶段：事务练习

### 练习 9：转账事务

1. 查看当前账户余额
2. 编写一个转账事务：用户 1 给用户 2 转账 100 元
3. 模拟失败场景：故意写错 SQL，观察回滚

<details>
<summary>点击查看答案</summary>

```sql
-- 1. 查看当前余额
SELECT * FROM accounts;

-- 2. 转账事务
START TRANSACTION;

UPDATE accounts SET balance = balance - 100 WHERE user_id = 1;
UPDATE accounts SET balance = balance + 100 WHERE user_id = 2;

-- 确认无误后提交
COMMIT;

-- 验证余额变化
SELECT * FROM accounts;
```

**模拟失败场景**：
```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 100 WHERE user_id = 1;
-- 故意写错：user_id = 999 不存在
UPDATE accounts SET balance = balance + 100 WHERE user_id = 999;

-- 发现问题，回滚
ROLLBACK;

-- 验证余额没有变化
SELECT * FROM accounts;
```

**Node.js 示例**：
```js
try {
    await connection.beginTransaction();
    await connection.execute('UPDATE accounts SET balance = balance - 100 WHERE user_id = 1');
    await connection.execute('UPDATE accounts SET balance = balance + 100 WHERE user_id = 2');
    await connection.commit();
} catch (err) {
    await connection.rollback();
    throw err;
}
```
</details>

---

## 第六阶段：综合挑战

### 练习 10：博客系统查询

1. 查询每个作者的最新文章（每人 1 篇）
2. 查询评论数最多的前 3 篇文章
3. 查询有评论但没有订单的用户

<details>
<summary>点击查看答案</summary>

```sql
-- 1. 查询每个作者的最新文章（每人 1 篇）
SELECT a.*
FROM articles a
INNER JOIN (
    SELECT author_id, MAX(create_time) as max_time
    FROM articles
    GROUP BY author_id
) latest ON a.author_id = latest.author_id AND a.create_time = latest.max_time;

-- 2. 查询评论数最多的前 3 篇文章
SELECT a.id, a.title, COUNT(c.id) as comment_count
FROM articles a
LEFT JOIN comments c ON a.id = c.article_id
GROUP BY a.id, a.title
ORDER BY comment_count DESC
LIMIT 3;

-- 3. 查询有评论但没有订单的用户
-- 思路：先找到有评论的用户，排除掉有订单的用户
SELECT DISTINCT u.*
FROM users u
JOIN comments c ON u.id = c.user_id
LEFT JOIN orders o ON u.id = o.user_id
WHERE o.id IS NULL;
```
</details>

---

## 自测检查清单

完成练习后，问自己以下问题：

- [ ] 我能解释 `LIMIT OFFSET` 的计算公式吗？
- [ ] 我知道 `LIKE '%xxx'` 为什么不能用索引吗？
- [ ] 我能区分 `INNER JOIN` 和 `LEFT JOIN` 的区别吗？
- [ ] 我知道 `WHERE` 和 `HAVING` 的执行时机吗？
- [ ] 我能解释组合索引的"最左前缀匹配"原则吗？
- [ ] 我知道为什么 `LEFT JOIN + WHERE` 会过滤掉 NULL 行吗？
- [ ] 我能写出完整的事务代码（包括 try-catch 回滚）吗？

---

## 扩展练习（选做）

1. **子查询练习**：查询订单总金额高于平均值的用户
2. **窗口函数**（MySQL 8.0+）：按订单金额给用户排名
3. **视图练习**：创建一个视图，显示"用户 + 文章数 + 评论数"

---

*做完练习后，建议把错题和心得记录到笔记中*
