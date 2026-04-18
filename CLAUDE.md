# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## 项目概述

这是一个**全栈技术学习笔记仓库**，记录从前端（Vue/JavaScript）向全栈开发者转型的学习过程。

**学习理念**：苏格拉底式提问法 —— 通过思考问题建立深度理解，类比前端知识理解后端概念。

**仓库性质**：纯 Markdown 文档，无代码构建流程

---

## 目录结构

```
study/
├── README.md              # 项目总览
├── mysql/                 # MySQL 数据库教程
│   ├── 01-对话记录.md     # 苏格拉底式教学完整对话
│   ├── 02-学习笔记.md     # 核心知识点精简总结
│   ├── 03-练习题.md       # 实战练习题 + 参考答案
│   └── README.md          # 目录索引
├── docs/                  # 补充文档（关于作者、学习路线图）
├── resources/             # 各技术的示例代码
│   └── sql-examples/
│       └── init-database.sql
└── CONTRIBUTING.md        # 贡献指南
```

**后续扩展**：新主题（如 Redis、Docker、Node.js 等）按相同结构添加独立目录。

---

## 内容组织规范

每个技术主题目录应包含：

| 文件 | 说明 |
|------|------|
| `01-对话记录.md` | 苏格拉底式教学完整对话记录 |
| `02-学习笔记.md` | 核心知识点精简总结 |
| `03-练习题.md` | 实战练习题 + 参考答案 |
| `README.md` | 该主题的目录索引 |

---

## Git 提交规范

Commit message 格式：
```
<type>: <description>

[optional body]
```

**type 包括：**
- `docs`: 文档内容修改
- `fix`: 修正错误
- `feat`: 新增内容
- `refactor`: 重构
- `chore`: 其他修改

**示例：**
```
docs: 补充索引选择性的解释

在 mysql/02-学习笔记.md 中添加了关于字段选择性的详细说明
```

---

## 编辑指南

- 使用任意 Markdown 编辑器进行本地修改
- 无需运行测试或构建命令
- 确保 Markdown 格式正确（标题层级、代码块）
- 保持技术内容的准确性（语法、概念解释）
- 新增技术主题时，在 `README.md` 中添加导航链接

---

## 相关文档

- [CONTRIBUTING.md](./CONTRIBUTING.md) - 贡献指南与本地开发流程
- [docs/学习路线图.md](./docs/学习路线图.md) - 学习进度与计划
