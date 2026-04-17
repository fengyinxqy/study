# 📚 MySQL 从入门到实战

> 前端开发者转全栈的 MySQL 学习笔记 —— 零基础到理解索引、事务、查询优化

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-blue.svg)](https://www.mysql.com/)
[![Level](https://img.shields.io/badge/Level-Beginner-green.svg)]

---

## 🎯 适合人群

- ✅ 有前端开发经验（熟悉 JavaScript/Vue）
- ✅ 数据库零基础或只写过简单 CRUD
- ✅ 想系统理解索引、事务、查询优化等核心概念
- ✅ 希望通过类比前端思维来理解后端概念

## 🗺️ 学习路线图

```
┌─────────────────────────────────────────────────────────────────┐
│                      MySQL 学习路径                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ① 基础查询 → ② 多表连接 → ③ 聚合统计 → ④ 索引优化 → ⑤ 事务    │
│     ↓            ↓            ↓            ↓            ↓       │
│  LIMIT/OFFSET  JOIN       GROUP BY     B+ 树         ACID       │
│  LIKE          LEFT JOIN   HAVING       最左前缀      隔离级别    │
│  ORDER BY      外键        聚合函数     EXPLAIN                   │
│                                                                 │
│  ⑥ 实战练习 → ⑦ 表设计 → ⑧ 性能调优 → ⑨ 扩展主题                 │
│     ↓            ↓            ↓            ↓                    │
│  综合 SQL     三范式       慢查询       全文索引                  │
│  分页搜索     一对多       执行计划     视图                     │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## 📖 内容导航

### MySQL 核心教程

| 章节 | 主题 | 内容 |
|------|------|------|
| [01](./mysql/01-对话记录.md) | 完整对话记录 | 苏格拉底式教学全程记录 |
| [02](./mysql/02-学习笔记.md) | 精简学习笔记 | 核心知识点提炼 |
| [03](./mysql/03-练习题.md) | 实战练习题 | 10 道练习题 + 参考答案 |

### 核心知识点

| 模块 | 关键概念 |
|------|----------|
| **分页查询** | `LIMIT`, `OFFSET`, `ORDER BY` 保证稳定性 |
| **模糊搜索** | `LIKE` 三种模式，`%`在前无法用索引 |
| **索引** | B+ 树、单列/组合索引、最左前缀匹配 |
| **表设计** | 三范式、外键关联、一对多关系 |
| **JOIN** | `INNER JOIN` vs `LEFT JOIN`、WHERE 陷阱 |
| **聚合** | `COUNT/SUM/GROUP BY`、`WHERE` vs `HAVING` |
| **事务** | `COMMIT/ROLLBACK`、隔离级别、脏读/不可重复读/幻读 |
| **性能优化** | `EXPLAIN` 分析、选择性高的字段放前面 |

## 🚀 快速开始

### 环境准备

```bash
# 安装 MySQL 8.0+
# Windows: 下载 MySQL Installer
# macOS: brew install mysql
# Linux: sudo apt-get install mysql-server

# 验证安装
mysql --version

# 登录 MySQL
mysql -u root -p
```

### 创建练习数据库

```sql
-- 创建数据库
CREATE DATABASE study DEFAULT CHARACTER SET utf8mb4;

-- 使用数据库
USE study;

-- 导入示例表结构（见 resources/sql-examples/）
```

## 📝 学习方式

本教程采用 **苏格拉底式提问法**：

1. 🤔 **先思考** —— 阅读问题后暂停，尝试用自己的理解回答
2. 💡 **再看答案** —— 对比自己的理解和正确解释
3. ✍️ **动手实践** —— 在 MySQL 中实际执行 SQL 验证
4. 📖 **记录心得** —— 把新的理解记录到笔记中

## 🏷️ 技术栈

| 技术 | 版本 | 用途 |
|------|------|------|
| MySQL | 8.0+ | 关系型数据库 |
| Markdown | - | 文档编写 |

## 📚 延伸学习

- [ ] 窗口函数（MySQL 8.0+）
- [ ] 存储过程与函数
- [ ] 触发器
- [ ] 视图
- [ ] 备份与恢复
- [ ] 主从复制

## 📂 项目目录

| 目录 | 说明 |
|------|------|
| [docs/](./docs/) | 关于作者、学习路线图 |
| [mysql/](./mysql/) | MySQL 核心教程 |
| [resources/](./resources/) | SQL 示例代码 |

## 🤝 参与贡献

欢迎提交 Issue 或 Pull Request 来改进这份笔记！

详见 [CONTRIBUTING.md](./CONTRIBUTING.md)

## 📄 License

MIT License - See [LICENSE](LICENSE) for details.

---

<div align="center">

**🎉 祝你学习愉快，早日成为全栈开发者！**

*Last updated: 2026-04-17*

</div>
