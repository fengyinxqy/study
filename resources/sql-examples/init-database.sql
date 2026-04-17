-- =====================================================
-- MySQL 学习示例数据库
-- 用途：配合学习笔记进行实践练习
-- =====================================================

-- 1. 创建数据库
-- =====================================================
CREATE DATABASE IF NOT EXISTS study DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE study;

-- 2. 创建用户表
-- =====================================================
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. 创建文章表
-- =====================================================
CREATE TABLE articles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    author_id INT NOT NULL,
    status ENUM('draft', 'published', 'archived') DEFAULT 'draft',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. 创建评论表
-- =====================================================
CREATE TABLE comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL,
    article_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (article_id) REFERENCES articles(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. 创建订单表
-- =====================================================
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 6. 创建账户表（用于事务练习）
-- =====================================================
CREATE TABLE accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE NOT NULL,
    balance DECIMAL(10, 2) NOT NULL DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 7. 插入示例数据
-- =====================================================

-- 用户数据
INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('David', 'david@example.com'),
('Eve', 'eve@example.com');

-- 文章数据
INSERT INTO articles (title, content, author_id, status) VALUES
('MySQL 入门教程', 'MySQL 是一门...', 1, 'published'),
('Vue3 响应式原理', 'Vue3 的响应式基于 Proxy...', 1, 'published'),
('JavaScript 闭包详解', '闭包是...', 2, 'published'),
('React Hooks 最佳实践', 'React Hooks 让...', 2, 'published'),
('Node.js 性能优化', 'Node.js 性能优化...', 3, 'draft'),
('TypeScript 高级类型', 'TypeScript 的类型系统...', 3, 'published');

-- 评论数据
INSERT INTO comments (content, article_id, user_id) VALUES
('写得太好了！', 1, 2),
('学到了不少东西', 1, 3),
('期待更新！', 1, 4),
('有更深入的吗？', 2, 2),
('感谢分享', 3, 1),
('已收藏', 4, 5),
('能不能讲讲原理？', 4, 3);

-- 订单数据
INSERT INTO orders (user_id, amount) VALUES
(1, 100.00),
(1, 250.00),
(2, 150.00),
(2, 200.00),
(2, 50.00),
(3, 300.00),
(4, 75.00);

-- 账户数据
INSERT INTO accounts (user_id, balance) VALUES
(1, 1000.00),
(2, 500.00),
(3, 750.00),
(4, 200.00),
(5, 100.00);

-- 8. 创建索引
-- =====================================================

-- 单列索引
CREATE INDEX idx_articles_author ON articles(author_id);
CREATE INDEX idx_articles_status ON articles(status);
CREATE INDEX idx_orders_user ON orders(user_id);

-- 组合索引（用于优化 WHERE + ORDER BY 查询）
CREATE INDEX idx_author_time ON articles(author_id, created_at);

-- 9. 创建视图（可选）
-- =====================================================

-- 用户统计视图
CREATE VIEW user_stats AS
SELECT
    u.id,
    u.name,
    u.email,
    COUNT(DISTINCT a.id) as article_count,
    COUNT(DISTINCT c.id) as comment_count,
    COALESCE(SUM(o.amount), 0) as total_orders
FROM users u
LEFT JOIN articles a ON u.id = a.author_id
LEFT JOIN comments c ON u.id = c.user_id
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name, u.email;

-- 10. 常用查询示例
-- =====================================================

-- 查询每个作者的文章数量
SELECT u.name, COUNT(a.id) as article_count
FROM users u
LEFT JOIN articles a ON u.id = a.author_id
GROUP BY u.id, u.name;

-- 查询最新的 5 篇文章（包含作者名）
SELECT a.title, u.name as author, a.created_at
FROM articles a
JOIN users u ON a.author_id = u.id
WHERE a.status = 'published'
ORDER BY a.created_at DESC
LIMIT 5;

-- 查询每篇文章的评论数量
SELECT a.title, COUNT(c.id) as comment_count
FROM articles a
LEFT JOIN comments c ON a.id = c.article_id
GROUP BY a.id, a.title
ORDER BY comment_count DESC;

-- 查询订单总金额超过 200 的用户
SELECT u.name, SUM(o.amount) as total_amount
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name
HAVING SUM(o.amount) > 200;

-- =====================================================
-- 练习建议
-- =====================================================
-- 1. 先执行上面的 CREATE TABLE 和 INSERT 语句创建环境
-- 2. 尝试自己写查询语句
-- 3. 使用 EXPLAIN 分析执行计划
-- 4. 对比练习题中的参考答案
-- =====================================================
