# 贡献指南

感谢你对这个全栈技术学习笔记的关注！欢迎以任何方式参与贡献。

---

## 🤝 如何贡献

### 1. 报告问题

发现错误、 typo 或有更好的解释方式？请提交 Issue：

- 📝 描述问题所在位置（技术主题 + 文件 + 章节）
- 🔍 说明问题详情
- 💡 如有可能，提供改进建议

### 2. 改进内容

欢迎改进笔记内容：

- ✏️ 修正错别字或语法错误
- 📖 补充更清晰的解释
- 🔗 添加相关资源链接
- 📝 增加新的练习题

### 3. 添加新技术主题

想添加 Redis、Docker 等新技术笔记：

1. 在根目录创建技术主题文件夹（如 `redis/`, `docker/`）
2. 参考现有结构创建内容文件
3. 更新 `README.md` 添加导航链接
4. 提交 Pull Request

### 4. 分享笔记

如果你有自己的学习心得：

1. Fork 本项目
2. 在 `docs/notes/` 目录下创建你的笔记
3. 提交 Pull Request

---

## 📝 提交规范

### Commit Message 格式

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
docs: 补充 Redis 持久化机制的解释

在 redis/02-学习笔记.md 中添加了 RDB 和 AOF 的对比说明
```

### 文件命名规范

新技术主题的文件结构应遵循：

```
<tech-name>/
├── README.md              # 该主题的目录索引
├── 01-对话记录.md         # 苏格拉底式教学完整对话
├── 02-学习笔记.md         # 核心知识点精简总结
├── 03-练习题.md           # 实战练习题 + 参考答案
└── resources/             # 该主题的示例代码（可选）
```

---

## 🔧 本地开发

```bash
# 1. Fork 项目
# 在 GitHub 上点击 Fork

# 2. 克隆到本地
git clone https://github.com/YOUR_USERNAME/study.git
cd study

# 3. 创建分支
git checkout -b feature/your-feature-name

# 4. 修改内容
# 使用任意 Markdown 编辑器

# 5. 提交更改
git add .
git commit -m "feat: add your feature description"

# 6. 推送到远程
git push origin feature/your-feature-name

# 7. 创建 Pull Request
# 在 GitHub 上提交 PR
```

---

## 📋 Code Review 标准

提交的内容会经过以下检查：

- ✅ 内容准确性（技术概念、代码示例）
- ✅ 与现有风格一致（苏格拉底式提问法）
- ✅ Markdown 格式正确
- ✅ 没有拼写错误
- ✅ 文件结构符合规范（新技术主题）

---

## 🙏 致谢

所有贡献者都会被记录在 [CONTRIBUTORS.md](./CONTRIBUTORS.md) 中。

感谢每一位贡献者！

---

*Last updated: 2026-04-18*
