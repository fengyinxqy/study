# MySQL 学习笔记

> 学习者背景：2 年 Vue 前端经验，MySQL 零基础  
> 学习方式：苏格拉底式提问法 —— 通过思考回答问题来建立理解

---

## 一、分页查询（LIMIT 和 OFFSET）

### 问 1：如何限制查询结果数量？

**问题**：如果 user 表有 100 万行数据，而前端只需要显示"前 10 个用户"，SQL 查询应该怎么写？

**答案**：使用 `LIMIT` 关键字来限制返回行数

```sql
SELECT * FROM user LIMIT 10;
```

---

### 问 2：如何实现分页？

**问题**：如果每页显示 10 条数据，第一页是第 1-10 行，第二页是第 11-20 行，`LIMIT` 应该怎么改？

**答案**：使用 `LIMIT 数量 OFFSET 跳过行数`

```sql
-- 第一页：跳过 0 行，取 10 条
SELECT * FROM user LIMIT 10 OFFSET 0;

-- 第二页：跳过 10 行，取 10 条
SELECT * FROM user LIMIT 10 OFFSET 10;

-- 第三页：跳过 20 行，取 10 条
SELECT * FROM user LIMIT 10 OFFSET 20;

-- 通用公式：第 N 页，每页 size 条
-- OFFSET = (N - 1) * size
```

---

### 问 3：如何让分页结果稳定？

**问题**：如果只写 `SELECT * FROM user LIMIT 10`，返回哪 10 条是不确定的。如何让分页结果稳定（第二页永远显示"第 11-20 个用户"）？在 `LIMIT` 之前必须加什么子句？

**答案**：必须加 **`ORDER BY`** 子句

**作用**：指定数据按什么顺序排列，保证每次查询的顺序一致

```sql
-- 不稳定：每次查询可能返回不同的 10 条
SELECT * FROM user LIMIT 10;

-- 稳定：永远返回 id 最小的 10 条
SELECT * FROM user ORDER BY id ASC LIMIT 10;

-- 稳定：永远返回 id 第 11-20 条
SELECT * FROM user ORDER BY id ASC LIMIT 10 OFFSET 10;
```

**为什么需要 `ORDER BY`？**
- 数据库表中的数据本身是**无序存储**的
- 如果没有 `ORDER BY`，每次查询返回的顺序可能不同（尤其是数据增删后）
- `ORDER BY` 强制按指定字段排序，保证分页结果可预测

**类比前端**：
```js
// 不稳定：直接 slice
arr.slice(0, 10)

// 稳定：先排序再 slice
arr.sort((a, b) => a.id - b.id).slice(0, 10)
```

---

## 二、模糊查询与 LIKE

### 问 4：如何实现搜索功能？

**问题**：用户输入关键词 "zhang"，想查找 `name` 或 `email` 中包含 "zhang" 的记录，SQL 的 `WHERE` 子句应该怎么写？

**答案**：使用 `LIKE` 进行模糊匹配

```sql
SELECT * FROM users 
WHERE name LIKE '%zhang%' OR email LIKE '%zhang%';
```

- `LIKE '%zhang%'`：任意位置包含 "zhang"
- `LIKE 'zhang%'`：以 "zhang" 开头
- `LIKE '%zhang'`：以 "zhang" 结尾

---

## 三、索引（Index）

### 问 5：如何优化全表扫描的性能问题？

**问题**：`LIKE '%zhang%'` 会导致全表扫描（100 万行要检查每一行）。如何优化？

**答案**：使用**索引（Index）**

类比前端：
- 数组遍历查找：`arr.find(item => item.id === 123)` → O(n)
- Map 查找：`map.get(123)` → O(1)

数据库索引使用 **B+ 树** 数据结构，支持 O(log n) 查找 + 范围查询。

---

### 问 6：哪些查询能用上索引？

**问题**：在 `name` 字段创建索引后，以下查询哪些能用索引？

```sql
CREATE INDEX idx_name ON users(name);

-- 查询 A
SELECT * FROM users WHERE name = 'zhang';

-- 查询 B
SELECT * FROM users WHERE name LIKE 'zhang%';

-- 查询 C
SELECT * FROM users WHERE name LIKE '%zhang%';
```

**答案**：
- 查询 A ✅ 精确匹配，能用索引
- 查询 B ✅ 前缀匹配（从左往右），能用索引
- 查询 C ❌ `%` 在前，无法用索引（全表扫描）

---

### 问 7：组合索引与最左前缀匹配

**问题**：对于组合查询 `WHERE age = 25 AND city = 'Beijing'`，怎么建索引？

**答案**：使用**组合索引**

```sql
-- 不推荐：两个单列索引（MySQL 一次查询通常只用一个索引）
CREATE INDEX idx_age ON users(age);
CREATE INDEX idx_city ON users(city);

-- 推荐：组合索引
CREATE INDEX idx_age_city ON users(age, city);
```

**最左前缀匹配原则**：组合索引 `(age, city)` 必须从第一列开始匹配：

```sql
WHERE age = 25 AND city = 'Beijing'  -- ✅ 能用索引
WHERE city = 'Beijing' AND age = 25  -- ✅ 能用索引（优化器调整顺序）
WHERE age = 25                        -- ✅ 能用索引（只用第一列）
WHERE city = 'Beijing'                -- ❌ 不能用索引（跳过第一列）
```

---

## 四、表设计（Schema Design）

### 问 8：如何设计多表关系？

**问题**：设计一个"博客系统"，需要存储用户、文章、评论。你会存在一张表还是三张表？文章和用户的关联怎么设计？

**答案**：
- **三张表**：`users`, `articles`, `comments` —— 职责清晰，查询高效
- **外键关联**：`articles.author_id` → `users.id`，一对多关系

```sql
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE articles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
    content TEXT,
    author_id INT,  -- 外键，关联 users.id
    create_time DATETIME
);

CREATE TABLE comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT,
    article_id INT,  -- 外键，关联 articles.id
    user_id INT,     -- 外键，关联 users.id
    create_time DATETIME
);
```

---

## 五、表连接（JOIN）

### 问 9：如何连接两张表查询？

**问题**：查询"用户 ID 为 1 的所有文章，并显示作者名字"，SQL 怎么写？

**答案**：使用 `JOIN`

```sql
SELECT articles.id, articles.title, users.name
FROM articles
INNER JOIN users ON articles.author_id = users.id
WHERE users.id = 1;
```

---

### 问 10：LEFT JOIN vs INNER JOIN

**问题**：查询"所有用户及其文章数量"，包括**没有发过文章的用户**，用 `INNER JOIN` 还是 `LEFT JOIN`？

**答案**：使用 `LEFT JOIN`

```sql
SELECT users.name, COUNT(articles.id) as article_count
FROM users
LEFT JOIN articles ON users.id = articles.author_id
GROUP BY users.id;
```

- `INNER JOIN`：只返回有匹配的行
- `LEFT JOIN`：返回左表所有行，右表没有匹配时填 `NULL`

**LEFT JOIN 的"膨胀"效应**：左表一行可能对应右表多行
- 用户 A 发 3 篇文章 → 返回 3 行
- 用户 B 发 0 篇文章 → 返回 1 行，右表字段为 `NULL`

---

### 问 11：LEFT JOIN 与 WHERE 的陷阱

**问题**：以下查询会把"没有发过文章的用户"过滤掉吗？

```sql
SELECT users.name, COUNT(articles.id) as article_count
FROM users
LEFT JOIN articles ON users.id = articles.author_id
WHERE articles.create_time >= '2024-01-01';
```

**答案**：**会过滤掉**！

- 没有发过文章的用户，`articles.create_time` 是 `NULL`
- `NULL >= '2024-01-01'` 结果是 `FALSE`
- `WHERE` 会过滤掉 `FALSE` 的行

虽然用了 `LEFT JOIN`，但 `WHERE` 条件让它**实际变成 `INNER JOIN`** 的效果。

**正确写法**：条件移到 `ON` 子句

```sql
SELECT users.name, COUNT(articles.id) as article_count
FROM users
LEFT JOIN articles ON users.id = articles.author_id 
    AND articles.create_time >= '2024-01-01'
GROUP BY users.id;
```

---

## 六、聚合函数与 GROUP BY

### 问 12：如何按组统计？

**问题**：按 `user_id` 分组，计算每个用户的"订单总金额"，类似前端的 `reduce` 累加。用什么聚合函数？用什么子句分组？

**答案**：
- `SUM()`：求和（`COUNT()` 是计数）
- `GROUP BY`：按字段分组

```sql
SELECT user_id, SUM(amount) as total_amount
FROM orders
GROUP BY user_id;
```

---

### 问 13：GROUP BY 的陷阱

**问题**：以下 SQL 有什么问题？

```sql
SELECT user_id, name, SUM(amount) as total_amount
FROM orders
GROUP BY user_id;
```

**答案**：`name` 没有被聚合函数包裹，值是不确定的

- `GROUP BY user_id` 把多行聚合成 1 行
- 但 `name` 可能有多个不同的值，数据库返回哪个？

**正确写法**：

```sql
-- 方案 A：用聚合函数包裹
SELECT user_id, MAX(name) as name, SUM(amount) as total_amount
FROM orders
GROUP BY user_id;

-- 方案 B：更好的设计（name 在 users 表）
SELECT o.user_id, u.name, SUM(o.amount) as total_amount
FROM orders o
JOIN users u ON o.user_id = u.id
GROUP BY o.user_id, u.name;
```

---

### 问 14：如何按时间统计？

**问题**：统计"2024 年每个月的订单总额"，如何从 `create_time` 提取"年月"？

**答案**：

```sql
-- 方案 A：YEAR() + MONTH()
SELECT 
    YEAR(create_time) as year,
    MONTH(create_time) as month,
    SUM(amount) as total_amount
FROM orders
GROUP BY YEAR(create_time), MONTH(create_time);

-- 方案 B：DATE_FORMAT()（推荐）
SELECT 
    DATE_FORMAT(create_time, '%Y-%m') as month,
    SUM(amount) as total_amount
FROM orders
GROUP BY DATE_FORMAT(create_time, '%Y-%m');
```

---

### 问 15：WHERE vs HAVING

**问题**：找出"订单总额超过 1000 的用户"，用 `WHERE` 还是 `HAVING`？

```sql
-- 写法 A
WHERE total_amount > 1000

-- 写法 B
HAVING total_amount > 1000
```

**答案**：**`HAVING` 正确**

| 关键字 | 执行时机 | 用途 |
|--------|----------|------|
| `WHERE` | 聚合**之前** | 过滤原始行 |
| `HAVING` | 聚合**之后** | 过滤分组结果 |

```sql
-- 错误：total_amount 是聚合后的别名，WHERE 时还不存在
WHERE total_amount > 1000  -- ❌

-- 正确：HAVING 在 GROUP BY 之后执行
HAVING total_amount > 1000  -- ✅
```

---

## 八、事务（Transaction）

### 问 16：如何确保多个操作要么都成功，要么都失败？

**问题**：用户 A 给用户 B 转账 100 元，需要两个操作：
1. 从 A 的账户扣 100 元
2. 给 B 的账户加 100 元

如果第一步成功，第二步失败了，数据会不一致。有什么机制可以确保"两个操作要么都成功，要么都失败"？

**答案**：使用**事务（Transaction）**

```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 100 WHERE user_id = A;
UPDATE accounts SET balance = balance + 100 WHERE user_id = B;

COMMIT;   -- 提交（确认成功）
-- 或
ROLLBACK; -- 回滚（撤销所有操作）
```

**Node.js 示例**：

```js
try {
    await connection.beginTransaction();
    await connection.execute('UPDATE accounts SET balance = balance - 100 WHERE user_id = A');
    await connection.execute('UPDATE accounts SET balance = balance + 100 WHERE user_id = B');
    await connection.commit();
} catch (err) {
    await connection.rollback();
    throw err;
}
```

---

### 问 17：事务的隔离级别

**问题**：事务 A 读取某行数据后，事务 B 修改并提交。事务 A 再次读取，能看到 B 的修改吗？

**答案**：取决于**隔离级别**

MySQL 默认是 **Repeatable Read（可重复读）**。

**四种隔离级别**（从低到高）：

| 隔离级别 | 脏读 | 不可重复读 | 幻读 |
|---------|------|-----------|------|
| Read Uncommitted | ❌ 可能 | ❌ 可能 | ❌ 可能 |
| Read Committed | ✅ 避免 | ❌ 可能 | ❌ 可能 |
| **Repeatable Read**（MySQL 默认） | ✅ 避免 | ✅ 避免 | ❌ 可能 |
| Serializable | ✅ 避免 | ✅ 避免 | ✅ 避免 |

**三种问题**：

| 问题 | 描述 |
|------|------|
| 脏读 | 读到别人"未提交"的修改 |
| 不可重复读 | 读到别人"已提交"的修改（同一行数据变化） |
| 幻读 | 读到别人"已提交"的新增/删除（行数变化） |

**示例**：
```
事务 A 读 id=1 → name='Alice'
事务 B 更新 id=1 → name='Bob' 并提交
事务 A 再读 id=1 → ?

Read Uncommitted  → 'Bob'
Read Committed    → 'Bob'
Repeatable Read   → 'Alice'（事务内读取结果一致）
```

---

## 九、索引深入理解

### 问 18：组合索引的字段顺序

**问题**：`status` 只有 3 个值（低选择性），`author_id` 有 10000 个值（高选择性）。组合索引 `(status, author_id)` 和 `(author_id, status)` 哪个更好？

**答案**：**选择性高的字段放前面**

```sql
-- 推荐：author_id 放前面
CREATE INDEX idx_author_status ON articles(author_id, status);

-- 不推荐：status 放前面（区分度太低）
CREATE INDEX idx_status_author ON articles(status, author_id);
```

**原则**：
- 选择性 = 不同值的数量 / 总行数
- 选择性越高，越能快速缩小范围

---

### 问 19：全文搜索优化

**问题**：`WHERE title LIKE '%MySQL%'` 无法用索引（`%` 在前）。如何优化"搜索标题包含某词"的需求？

**答案**：

**方案 1：全文索引**
```sql
ALTER TABLE articles ADD FULLTEXT INDEX ft_title (title);
SELECT * FROM articles WHERE MATCH(title) AGAINST('MySQL');
```

**方案 2：搜索引擎**（Elasticsearch）—— 适合复杂搜索需求

---

### 问 20：EXPLAIN 与索引优化

**问题**：查询 `WHERE author_id = 123 ORDER BY create_time DESC LIMIT 10` 很慢，如何优化？

**答案**：

**1. 用 `EXPLAIN` 分析执行计划**
```sql
EXPLAIN SELECT * FROM articles WHERE author_id = 123 ORDER BY create_time DESC LIMIT 10;
```

输出关键字段：
- `key`：实际使用的索引
- `rows`：预计扫描行数
- `Extra`：
  - `Using filesort` ❌：需要额外排序（慢）
  - `Using index` ✅：只用索引完成（快）

**2. 创建覆盖"过滤 + 排序"的组合索引**
```sql
CREATE INDEX idx_author_time ON articles(author_id, create_time);
```

索引本身已按 `author_id` 分组，组内按 `create_time` 排序 → 无需额外排序。
