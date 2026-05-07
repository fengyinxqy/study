# AI 大模型系统学习路线设计

> 从前端开发者到全栈 AI 工程师的分层递进学习路径

---

## 1. 目标与背景

### 学习目标

成为**全栈 AI 工程师**：既能理解 LLM 底层原理，也能独立构建生产级 AI 应用。

### 当前状态

| 维度 | 现状 |
|------|------|
| 职业背景 | 前端开发者，正在转全栈 |
| 已学技术 | MySQL、Redis、Egg.js（均有系统笔记） |
| Python | 入门级，了解基本语法 |
| 数学基础 | 大学有基础但生疏 |
| 学习时间 | 业余 1-2 小时/天 |
| 学习偏好 | 先广后深，苏格拉底式提问法 |

### 成功标准

- 能用 Python + LLM API 构建完整的 AI 应用
- 理解 Transformer、注意力机制、训练流程等核心原理
- 能搭建 RAG 系统和 AI Agent
- 能进行模型微调和本地部署
- 产出与现有笔记风格一致的学习文档

---

## 2. 学习路线：分层递进

### 总览

```
阶段一：AI 全景认知（1-2 周）
  ↓ 建立概念地图
阶段二：LLM API 实战（2-3 周）
  ↓ 能用 AI 做东西
阶段三：必要基础（3-4 周）
  ↓ 补数学和 ML 基础
阶段四：LLM 核心原理（3-4 周）
  ↓ 理解为什么能工作
阶段五：高级应用与工程实践（持续学习）
  → RAG / Agent / 微调 / 部署
```

**总周期**：约 9-13 周完成核心阶段（阶段一至四），阶段五持续学习。

---

### 阶段一：AI 全景认知（1-2 周）

**目标**：建立 AI/ML/DL/LLM 的概念地图，了解整个生态。

**学习内容**：

| 主题 | 具体内容 |
|------|----------|
| 概念层级 | AI → 机器学习 → 深度学习 → 大模型 的包含关系 |
| 主流模型 | GPT 系列、Claude 系列、Llama（开源）、Gemini 的定位和区别 |
| 应用场景 | 对话、代码生成、RAG、Agent、多模态、图像生成 |
| 技术生态 | Python 生态、Hugging Face、LangChain/LlamaIndex、向量数据库 |
| 关键概念 | Token、上下文窗口、温度、幻觉、对齐 |

**产出**：
- `ai/01-AI全景认知.md` — AI 大模型全景图笔记

**类比**：刚接触前端时先了解 Vue/React/Angular 的区别，知道整个生态长什么样。

---

### 阶段二：LLM API 实战（2-3 周）

**目标**：能用 Python 调用 LLM API 构建实际应用，同时强化 Python。

**学习内容**：

| 主题 | 具体内容 |
|------|----------|
| Python 强化 | 异步编程、HTTP 请求、JSON 处理、虚拟环境、包管理 |
| API 调用 | Claude API / OpenAI API（消息格式、流式输出、Token 计费） |
| Prompt Engineering | 系统提示、Few-shot、思维链（CoT）、结构化输出 |
| Tool Use | Function Calling 原理、工具定义、多轮对话中的工具调用 |
| 实战项目 | 构建一个带工具调用的 AI 助手（如：能查天气、搜索网页的聊天机器人） |

**产出**：
- `ai/02-Python-AI开发速查.md` — Python AI 开发常用模式
- `ai/03-Prompt-Engineering.md` — 提示词工程技巧
- `resources/ai-examples/` — 示例代码

**类比**：就像学 Vue 时先学会用组件、写模板，而不是先理解 Virtual DOM。

---

### 阶段三：必要基础（3-4 周）

**目标**：补齐理解 LLM 原理所需的数学和机器学习基础。

**学习内容**：

| 主题 | 具体内容 |
|------|----------|
| 数学复习 | 矩阵运算、概率分布、梯度下降（按需复习，不系统学） |
| ML 核心概念 | 监督/无监督学习、损失函数、过拟合/欠拟合、评估指标 |
| 神经网络 | 前馈网络、反向传播、激活函数、优化器（SGD/Adam） |
| PyTorch 实操 | 张量操作、自动求导、构建简单分类任务 |

**产出**：
- `ai/04-机器学习核心概念.md` — ML 基础笔记（类比前端思维理解）
- `ai/05-PyTorch入门.md` — PyTorch 实操笔记

**类比**：就像学 Vue 之前先理解 DOM 操作、事件循环、闭包这些 JS 基础。

---

### 阶段四：LLM 核心原理（3-4 周）

**目标**：理解 Transformer 和大模型为什么能"理解"语言。

**学习内容**：

| 主题 | 具体内容 |
|------|----------|
| Transformer 架构 | 自注意力机制、多头注意力、位置编码、前馈网络 |
| 架构变体 | 编码器（BERT）vs 解码器（GPT）vs 编码器-解码器（T5） |
| 训练流程 | 预训练（无监督）→ SFT（有监督微调）→ RLHF（人类反馈对齐） |
| Tokenizer | BPE、SentencePiece、文本怎么变成数字 |
| 采样策略 | Temperature、Top-p、Top-k、贪心解码 |
| 模型评估 | 困惑度（Perplexity）、基准测试（MMLU、HumanEval） |

**产出**：
- `ai/06-Transformer原理.md` — Transformer 架构深度笔记
- `ai/07-LLM训练流程.md` — 从预训练到对齐的完整流程

**类比**：就像深入理解 Vue 的响应式原理、Virtual DOM diff、编译器优化。

---

### 阶段五：高级应用与工程实践（持续学习）

**目标**：掌握生产级 AI 应用的核心技术栈。

**学习内容**：

| 主题 | 具体内容 |
|------|----------|
| RAG 系统 | 向量数据库（Milvus/Chroma）、文档切分、Embedding、检索增强生成 |
| AI Agent | ReAct 模式、工具链编排、多 Agent 协作、记忆系统 |
| 模型微调 | LoRA/QLoRA、数据集准备、微调实战（用开源小模型练手） |
| 部署与优化 | 模型量化（GGUF）、本地部署（Ollama）、API 服务搭建 |
| 综合项目 | 构建一个完整的 RAG + Agent 应用 |

**产出**：
- `ai/08-RAG系统设计.md`
- `ai/09-AI-Agent开发.md`
- `ai/10-模型微调实战.md`
- `ai/11-模型部署与优化.md`
- 一个完整的 AI 项目

---

## 3. 内容组织规范

沿用现有仓库的结构，每个阶段产出：

| 文件类型 | 说明 | 对应现有规范 |
|----------|------|-------------|
| `ai/01-*.md` 到 `ai/11-*.md` | 各阶段学习笔记 | 对应 `mysql/02-学习笔记.md` |
| `ai/README.md` | AI 学习目录索引 | 对应 `mysql/README.md` |
| `resources/ai-examples/` | 示例代码 | 对应 `resources/sql-examples/` |

**学习笔记内部结构**（延续苏格拉底式风格）：
- 核心问题引导（先思考再看答案）
- 概念解释（类比前端知识）
- 代码示例
- 关键要点总结

---

## 4. 推荐学习资源

### 课程

| 资源 | 类型 | 适合阶段 |
|------|------|----------|
| [3Blue1Brown: 神经网络](https://www.youtube.com/playlist?list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi) | 视频 | 阶段三 |
| [Andrej Karpathy: Let's build GPT](https://www.youtube.com/watch?v=kCc8FmEb1nY) | 视频 | 阶段四 |
| [DeepLearning.AI: ChatGPT Prompt Engineering](https://www.deeplearning.ai/short-courses/chatgpt-prompt-engineering-for-developers/) | 课程 | 阶段二 |
| [DeepLearning.AI: LangChain](https://www.deeplearning.ai/short-courses/langchain-chat-with-your-data/) | 课程 | 阶段五 |
| [Hugging Face: NLP Course](https://huggingface.co/learn/nlp-course) | 课程 | 阶段四 |

### 书籍

| 书名 | 适合阶段 |
|------|----------|
| 《动手学深度学习》（李沐） | 阶段三-四 |
| 《大规模语言模型：从理论到实践》 | 阶段四 |
| 《构建大语言模型应用》 | 阶段五 |

### 工具

| 工具 | 用途 |
|------|------|
| Python 3.10+ | AI 开发语言 |
| PyTorch | 深度学习框架 |
| Jupyter Notebook | 交互式实验 |
| Ollama | 本地模型运行 |
| Chroma / Milvus | 向量数据库 |

---

## 5. 时间线估算

基于每天 1-2 小时的业余时间：

```
Week 1-2:   阶段一 — AI 全景认知
Week 3-5:   阶段二 — LLM API 实战
Week 6-9:   阶段三 — 必要基础
Week 10-13: 阶段四 — LLM 核心原理
Week 14+:   阶段五 — 高级应用（持续）
```

**里程碑检查点**：
- 第 2 周末：能画出 AI 技术全景图
- 第 5 周末：能用 API 构建一个 AI 应用
- 第 9 周末：能解释神经网络如何学习
- 第 13 周末：能解释 Transformer 为什么能理解语言
- 第 16 周末：能搭建一个 RAG + Agent 应用

---

## 6. 与现有学习路线的关系

AI 学习路线是**独立的新主题**，与现有的全栈学习路线（MySQL → Redis → Docker → Node.js）并行，不替代也不冲突。

建议：
- AI 学习可以和 Docker/Node.js 交替进行，避免单一主题疲劳
- AI 阶段二的 Python 强化对 Node.js 学习也有帮助（双语言能力）
- AI 阶段五的部署实践可以用 Docker 来做，一举两得
