# AI 大模型学习路线实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 在学习笔记仓库中创建 AI 大模型学习路线的完整目录结构和骨架笔记文件，延续苏格拉底式提问法风格。

**Architecture:** 纯 Markdown 文档仓库，无代码构建。在 `ai/` 目录下创建 11 个学习笔记文件 + 1 个目录索引，在 `resources/ai-examples/` 下创建示例代码目录，更新根目录 README 和学习路线图。

**Tech Stack:** Markdown, Python (示例代码)

---

## 文件结构总览

```
study/
├── ai/                              # 新增：AI 学习目录
│   ├── README.md                    # 目录索引
│   ├── 01-AI全景认知.md             # 阶段一
│   ├── 02-Python-AI开发速查.md      # 阶段二
│   ├── 03-Prompt-Engineering.md     # 阶段二
│   ├── 04-机器学习核心概念.md        # 阶段三
│   ├── 05-PyTorch入门.md            # 阶段三
│   ├── 06-Transformer原理.md        # 阶段四
│   ├── 07-LLM训练流程.md            # 阶段四
│   ├── 08-RAG系统设计.md            # 阶段五
│   ├── 09-AI-Agent开发.md           # 阶段五
│   ├── 10-模型微调实战.md           # 阶段五
│   └── 11-模型部署与优化.md         # 阶段五
├── resources/
│   └── ai-examples/                 # 新增：AI 示例代码
│       └── hello_claude.py          # 第一个 API 调用示例
├── README.md                        # 修改：添加 AI 导航
└── docs/
    └── 学习路线图.md                 # 修改：添加 AI 学习进度
```

---

### Task 1: 创建 ai/ 目录索引

**Files:**
- Create: `ai/README.md`

- [ ] **Step 1: 创建 ai 目录**

```bash
mkdir -p c:/Users/admin/Desktop/study/ai
```

- [ ] **Step 2: 创建 ai/README.md**

创建 `ai/README.md`，包含：
- 标题和简介（学习者背景、学习方式）
- 文件说明表格（11 个笔记文件的链接和说明）
- 推荐学习顺序
- 五阶段知识点分布表
- 学习建议

参考 `mysql/README.md` 的结构，内容对应设计文档中的五个阶段。

- [ ] **Step 3: 提交**

```bash
git add ai/README.md
git commit -m "feat: 添加 AI 大模型学习目录索引"
```

---

### Task 2: 创建阶段一笔记 — AI 全景认知

**Files:**
- Create: `ai/01-AI全景认知.md`

- [ ] **Step 1: 创建 ai/01-AI全景认知.md**

创建文件，延续苏格拉底式提问法风格，包含以下章节：

```
## 一、AI 的层级关系
### 问 1：AI、机器学习、深度学习、大模型是什么关系？
（用同心圆/嵌套关系解释，类比前端：JavaScript → Vue → Vue 3 Composition API）

### 问 2：机器学习和传统编程有什么区别？
（输入+规则→输出 vs 输入+输出→规则，类比前端：手写 CSS vs Tailwind 自动生成）

## 二、大模型家族
### 问 3：主流大模型有哪些？它们有什么区别？
（GPT系列、Claude系列、Llama开源系列、Gemini 的定位对比表）

### 问 4：开源模型和闭源模型有什么区别？
（类比前端：Vue开源 vs 某些商业UI框架闭源）

## 三、LLM 能做什么
### 问 5：大模型有哪些应用场景？
（对话、代码生成、RAG、Agent、多模态、图像生成 — 每个给一个具体例子）

## 四、关键概念
### 问 6：什么是 Token？为什么 API 按 Token 计费？
（类比前端：HTTP 请求的 payload 大小）

### 问 7：什么是上下文窗口？
（类比前端：浏览器的 history 栈大小限制）

### 问 8：什么是"幻觉"？为什么大模型会编造答案？
（类比前端：前端表单校验不能替代后端校验 — LLM 输出不能完全信任）

### 问 9：什么是对齐（Alignment）？
（类比前端：UI 设计规范 — 让模型输出符合人类期望）

## 五、技术生态
### 问 10：AI 开发的技术栈是什么样的？
（Python 生态、Hugging Face、LangChain、向量数据库 全景图）

## 关键要点总结
```

每个问题包含：问题 → 答案 → 类比前端 → 代码/图表示例（如适用）。

- [ ] **Step 2: 提交**

```bash
git add ai/01-AI全景认知.md
git commit -m "feat: 添加 AI 全景认知学习笔记"
```

---

### Task 3: 创建阶段二笔记 — Python AI 开发速查

**Files:**
- Create: `ai/02-Python-AI开发速查.md`

- [ ] **Step 1: 创建 ai/02-Python-AI开发速查.md**

创建文件，包含以下章节：

```
## 一、Python 环境管理
### 问 1：Python 的虚拟环境是什么？为什么需要？
（类比前端：node_modules 和 package.json 的项目隔离）

### 问 2：pip 和 npm 的对应关系是什么？
（pip install ≈ npm install, requirements.txt ≈ package.json）

## 二、AI 开发常用 Python 特性
### 问 3：异步编程（async/await）怎么用？
（类比前端：Promise 和 async/await，几乎一样）

### 问 4：JSON 处理有什么技巧？
（类比前端：JSON.parse/stringify）

### 问 5：HTTP 请求怎么发？
（requests 库，类比前端的 fetch/axios）

## 三、AI 开发常用模式
### 问 6：流式输出怎么处理？
（SSE/Stream，类比前端的 EventSource）

### 问 7：环境变量怎么管理？
（.env 文件，类比前端的 .env.local）

## 关键要点总结
## 速查表：Python vs JavaScript 对照
```

- [ ] **Step 2: 提交**

```bash
git add ai/02-Python-AI开发速查.md
git commit -m "feat: 添加 Python AI 开发速查笔记"
```

---

### Task 4: 创建阶段二笔记 — Prompt Engineering

**Files:**
- Create: `ai/03-Prompt-Engineering.md`

- [ ] **Step 1: 创建 ai/03-Prompt-Engineering.md**

创建文件，包含以下章节：

```
## 一、Prompt 基础
### 问 1：什么是 Prompt Engineering？为什么重要？
（类比前端：你写的需求描述越清晰，设计师出的页面越符合预期）

### 问 2：系统提示（System Prompt）和用户提示有什么区别？
（类比前端：全局配置 vs 页面级参数）

## 二、核心技巧
### 问 3：什么是 Few-shot？为什么给例子比描述规则更有效？
（类比前端：Storybook 的用法展示 vs 纯文档描述）

### 问 4：什么是思维链（Chain of Thought）？
（类比前端：console.log 调试 — 让模型"打印"推理过程）

### 问 5：怎么让模型输出结构化数据（JSON）？
（类比前端：TypeScript 类型约束 — 给模型一个"类型定义"）

## 三、高级技巧
### 问 6：Temperature 和 Top-p 怎么调？
（类比前端：随机性旋钮 — 0 = 确定性，1 = 创造性）

### 问 7：怎么减少幻觉？
（引用上下文、要求引用来源、降低温度）

## 四、实战模板
（常见场景的 Prompt 模板：代码审查、文档生成、数据分析等）

## 关键要点总结
```

- [ ] **Step 2: 提交**

```bash
git add ai/03-Prompt-Engineering.md
git commit -m "feat: 添加 Prompt Engineering 学习笔记"
```

---

### Task 5: 创建阶段三笔记 — 机器学习核心概念

**Files:**
- Create: `ai/04-机器学习核心概念.md`

- [ ] **Step 1: 创建 ai/04-机器学习核心概念.md**

创建文件，包含以下章节：

```
## 一、机器学习基础
### 问 1：监督学习和无监督学习有什么区别？
（类比前端：有标注的设计稿 vs 无标注的竞品分析）

### 问 2：分类和回归有什么区别？
（类比前端：select 下拉选值 vs input 输入数值）

## 二、核心概念
### 问 3：什么是损失函数？为什么要"损失"？
（类比前端：Lighthouse 评分 — 距离完美有多远）

### 问 4：什么是梯度下降？模型怎么"学习"？
（类比前端：热力图优化 — 哪个方向改能让性能更好）

### 问 5：什么是过拟合？怎么避免？
（类比前端：只在 Chrome 测试通过就上线 — 在其他浏览器崩了）

### 问 6：什么是评估指标（精确率、召回率、F1）？
（类比前端：搜索功能的准确性和覆盖率）

## 三、数学基础速查
### 问 7：矩阵运算在 AI 中怎么用？
（数据批量处理，类比前端：Array.map 批量转换）

### 问 8：概率论在 AI 中怎么用？
（模型输出是概率分布，类比前端：搜索建议的排序权重）

## 关键要点总结
```

- [ ] **Step 2: 提交**

```bash
git add ai/04-机器学习核心概念.md
git commit -m "feat: 添加机器学习核心概念学习笔记"
```

---

### Task 6: 创建阶段三笔记 — PyTorch 入门

**Files:**
- Create: `ai/05-PyTorch入门.md`

- [ ] **Step 1: 创建 ai/05-PyTorch入门.md**

创建文件，包含以下章节：

```
## 一、PyTorch 基础
### 问 1：PyTorch 是什么？和 TensorFlow 什么关系？
（类比前端：Vue vs React — 两个主流框架，PyTorch 更受研究者欢迎）

### 问 2：什么是张量（Tensor）？
（类比前端：多维数组，就像嵌套的 Array — 0d=标量, 1d=向量, 2d=矩阵）

## 二、核心操作
### 问 3：张量的基本操作有哪些？
（创建、索引、切片、变形、运算 — 对照 NumPy/JS Array）

### 问 4：什么是自动求导（Autograd）？
（类比前端：Vue 的响应式系统 — 自动追踪依赖并计算变化）

## 三、构建模型
### 问 5：怎么用 PyTorch 构建一个简单的神经网络？
（nn.Module，类比前端的 Component — 继承基类，定义前向传播）

### 问 6：训练循环是什么样的？
（forward → loss → backward → step，类比前端：render → diff → patch → commit）

## 四、实战：手写数字识别
（用 MNIST 数据集跑一个完整训练流程）

## 关键要点总结
```

- [ ] **Step 2: 提交**

```bash
git add ai/05-PyTorch入门.md
git commit -m "feat: 添加 PyTorch 入门学习笔记"
```

---

### Task 7: 创建阶段四笔记 — Transformer 原理

**Files:**
- Create: `ai/06-Transformer原理.md`

- [ ] **Step 1: 创建 ai/06-Transformer原理.md**

创建文件，包含以下章节：

```
## 一、为什么需要 Transformer
### 问 1：RNN 和 LSTM 有什么问题？为什么需要新架构？
（类比前端：jQuery 时代的问题 — 代码难以并行化、难以处理长序列）

### 问 2：Transformer 的核心创新是什么？
（注意力机制 — 让模型同时看所有位置，而不是一个一个看）

## 二、自注意力机制
### 问 3：什么是自注意力（Self-Attention）？
（类比前端：搜索引擎 — 每个词去"搜索"其他词的相关性）

### 问 4：Query、Key、Value 是什么？
（类比前端：搜索框输入=Query, 索引=Key, 页面内容=Value）

### 问 5：什么是多头注意力（Multi-Head Attention）？
（类比前端：多个搜索引擎同时搜索不同维度的信息）

## 三、Transformer 架构
### 问 6：位置编码是什么？为什么需要？
（类比前端：数组的 index — Transformer 本身不知道顺序）

### 问 7：编码器和解码器有什么区别？
（BERT=编码器, GPT=解码器, T5=编码器+解码器）

## 四、从 Transformer 到 GPT
### 问 8：GPT 为什么只用解码器？
（生成任务的特点 — 每次只能看到前面的内容）

## 关键要点总结
```

- [ ] **Step 2: 提交**

```bash
git add ai/06-Transformer原理.md
git commit -m "feat: 添加 Transformer 原理学习笔记"
```

---

### Task 8: 创建阶段四笔记 — LLM 训练流程

**Files:**
- Create: `ai/07-LLM训练流程.md`

- [ ] **Step 1: 创建 ai/07-LLM训练流程.md**

创建文件，包含以下章节：

```
## 一、预训练
### 问 1：预训练（Pre-training）在做什么？
（类比前端：读完所有文档和源码 — 建立通用知识基础）

### 问 2：什么是自回归语言模型？
（类比前端：根据上文自动补全 — 就像 IDE 的智能提示）

### 问 3：预训练需要多少数据和算力？
（类比前端：构建整个 npm registry 的索引 — 海量数据 + 大量计算）

## 二、微调与对齐
### 问 4：为什么预训练之后还要微调？
（类比前端：学完 JavaScript 还要学 Vue — 通用能力需要针对任务适配）

### 问 5：SFT（有监督微调）怎么做？
（类比前端：用设计稿（标注数据）来规范输出格式）

### 问 6：RLHF 是什么？为什么需要人类反馈？
（类比前端：A/B 测试 — 让用户选择更好的版本，模型据此优化）

## 三、Tokenizer
### 问 7：文本怎么变成数字？
（类比前端：把字符串编码成 UTF-8 字节 — Tokenizer 把文本切成 Token）

### 问 8：BPE 算法是怎么工作的？
（类比前端：CSS 压缩 — 合并常见片段为更短的表示）

## 四、采样与评估
### 问 9：Temperature、Top-p、Top-k 怎么控制输出？
（类比前端：搜索结果排序策略 — 严格匹配 vs 模糊推荐）

### 问 10：怎么评估一个 LLM 的能力？
（困惑度、MMLU、HumanEval 等基准测试）

## 关键要点总结
```

- [ ] **Step 2: 提交**

```bash
git add ai/07-LLM训练流程.md
git commit -m "feat: 添加 LLM 训练流程学习笔记"
```

---

### Task 9: 创建阶段五笔记 — RAG 系统设计

**Files:**
- Create: `ai/08-RAG系统设计.md`

- [ ] **Step 1: 创建 ai/08-RAG系统设计.md**

创建文件，包含以下章节：

```
## 一、为什么需要 RAG
### 问 1：LLM 有什么局限？为什么不能直接用？
（知识截止日期、幻觉、无法访问私有数据 — 类比前端：纯前端应用的局限）

### 问 2：RAG 是什么？怎么解决这些问题？
（检索+生成 — 类比前端：先调 API 拿数据，再渲染页面）

## 二、核心组件
### 问 3：什么是 Embedding？
（把文本变成向量 — 类比前端：把设计稿转成组件代码的"特征码"）

### 问 4：什么是向量数据库？
（专门存储和检索向量的数据库 — 类比前端：搜索引擎的倒排索引）

### 问 5：文档怎么切分？
（Chunking 策略 — 类比前端：长列表的虚拟滚动分片）

## 三、RAG 流程
### 问 6：RAG 的完整流程是什么？
（文档处理 → 向量化 → 存储 → 检索 → 生成）

### 问 7：怎么评估 RAG 的效果？
（检索准确率、回答质量、引用正确性）

## 四、实战：搭建 RAG 系统
（用 LangChain + Chroma 搭建一个简单的文档问答系统）

## 关键要点总结
```

- [ ] **Step 2: 提交**

```bash
git add ai/08-RAG系统设计.md
git commit -m "feat: 添加 RAG 系统设计学习笔记"
```

---

### Task 10: 创建阶段五笔记 — AI Agent 开发

**Files:**
- Create: `ai/09-AI-Agent开发.md`

- [ ] **Step 1: 创建 ai/09-AI-Agent开发.md**

创建文件，包含以下章节：

```
## 一、什么是 AI Agent
### 问 1：Agent 和普通的 LLM 对话有什么区别？
（类比前端：静态页面 vs 有交互的 SPA — Agent 能"行动"而不只是"回答"）

### 问 2：Agent 的核心能力是什么？
（规划、工具调用、记忆 — 类比前端：路由、API调用、状态管理）

## 二、ReAct 模式
### 问 3：ReAct 是什么？
（Reasoning + Acting — 思考→行动→观察→思考... 循环）

### 问 4：怎么让 LLM 调用外部工具？
（Function Calling / Tool Use — 类比前端的事件回调）

## 三、工具链编排
### 问 5：怎么设计 Agent 的工具集？
（单一职责、清晰描述、错误处理 — 类比前端的工具函数设计）

### 问 6：多个 Agent 怎么协作？
（类比前端：微前端架构 — 每个 Agent 负责一个领域）

## 四、记忆系统
### 问 7：Agent 怎么记住上下文？
（短期记忆=对话历史，长期记忆=向量数据库 — 类比前端：useState vs localStorage）

## 五、实战：构建一个 Agent
（用 Claude API 的 Tool Use 构建一个能搜索网页、查询天气的 Agent）

## 关键要点总结
```

- [ ] **Step 2: 提交**

```bash
git add ai/09-AI-Agent开发.md
git commit -m "feat: 添加 AI Agent 开发学习笔记"
```

---

### Task 11: 创建阶段五笔记 — 模型微调实战

**Files:**
- Create: `ai/10-模型微调实战.md`

- [ ] **Step 1: 创建 ai/10-模型微调实战.md**

创建文件，包含以下章节：

```
## 一、为什么要微调
### 问 1：Prompt Engineering 和微调有什么区别？
（类比前端：CSS 覆写 vs 改源码 — Prompt 是外部调整，微调是内部改造）

### 问 2：什么时候该用微调？
（数据量大、任务特定、需要持续优化 — 不是所有场景都需要）

## 二、微调方法
### 问 3：全量微调和 LoRA 有什么区别？
（类比前端：重写整个组件 vs 用 mixin/插件扩展 — LoRA 只改一小部分参数）

### 问 4：QLoRA 是什么？为什么更省资源？
（量化 + LoRA — 类比前端：代码压缩 + 按需加载）

## 三、数据准备
### 问 5：微调数据集怎么准备？
（格式、清洗、标注 — 类比前端：设计系统的组件文档）

### 问 6：数据质量 vs 数据数量，哪个更重要？
（质量优先 — 类比前端：10 个高质量组件 vs 100 个低质量组件）

## 四、实战：用 LoRA 微调开源模型
（用 Hugging Face + PEFT 微调一个小模型完成特定任务）

## 关键要点总结
```

- [ ] **Step 2: 提交**

```bash
git add ai/10-模型微调实战.md
git commit -m "feat: 添加模型微调实战学习笔记"
```

---

### Task 12: 创建阶段五笔记 — 模型部署与优化

**Files:**
- Create: `ai/11-模型部署与优化.md`

- [ ] **Step 1: 创建 ai/11-模型部署与优化.md**

创建文件，包含以下章节：

```
## 一、为什么需要本地部署
### 问 1：用 API 和本地部署有什么区别？
（类比前端：用 CDN 的库 vs npm install 到本地 — 成本、隐私、延迟的权衡）

### 问 2：本地部署需要什么硬件？
（GPU 显存、内存、存储 — 类比前端：开发机配置要求）

## 二、模型量化
### 问 3：什么是模型量化？
（类比前端：图片压缩 — 把 32 位浮点压成 4/8 位整数，体积小但略有损失）

### 问 4：GGUF 格式是什么？
（类比前端：Webpack 打包产物 — 专门为推理优化的模型格式）

## 三、部署工具
### 问 5：Ollama 是什么？怎么用？
（本地模型运行工具 — 类比前端：npx 一键运行）

### 问 6：怎么搭建模型 API 服务？
（vLLM / TGI — 类比前端：Express 搭建 API 服务）

## 四、性能优化
### 问 7：推理速度怎么优化？
（批处理、KV Cache、投机采样 — 类比前端：虚拟列表、缓存、预加载）

### 问 8：成本怎么控制？
（模型选择、缓存策略、按需加载 — 类比前端：性能预算）

## 关键要点总结
```

- [ ] **Step 2: 提交**

```bash
git add ai/11-模型部署与优化.md
git commit -m "feat: 添加模型部署与优化学习笔记"
```

---

### Task 13: 创建 AI 示例代码目录

**Files:**
- Create: `resources/ai-examples/hello_claude.py`

- [ ] **Step 1: 创建 resources/ai-examples 目录**

```bash
mkdir -p c:/Users/admin/Desktop/study/resources/ai-examples
```

- [ ] **Step 2: 创建 hello_claude.py**

创建一个 Claude API 调用示例，包含：
- 安装说明注释（pip install anthropic）
- 基础消息发送
- 流式输出
- 环境变量配置说明

```python
# hello_claude.py — 第一个 Claude API 调用
# 安装：pip install anthropic
# 配置：设置环境变量 ANTHROPIC_API_KEY

import anthropic
import os

# 基础调用
def basic_call():
    client = anthropic.Anthropic()  # 自动读取 ANTHROPIC_API_KEY
    message = client.messages.create(
        model="claude-sonnet-4-20250514",
        max_tokens=1024,
        messages=[
            {"role": "user", "content": "用一句话解释什么是大语言模型"}
        ]
    )
    print(message.content[0].text)

# 流式输出
def stream_call():
    client = anthropic.Anthropic()
    with client.messages.stream(
        model="claude-sonnet-4-20250514",
        max_tokens=1024,
        messages=[
            {"role": "user", "content": "用三句话介绍 Transformer 架构"}
        ]
    ) as stream:
        for text in stream.text_stream:
            print(text, end="", flush=True)
    print()  # 换行

if __name__ == "__main__":
    print("=== 基础调用 ===")
    basic_call()
    print("\n=== 流式输出 ===")
    stream_call()
```

- [ ] **Step 3: 提交**

```bash
git add resources/ai-examples/hello_claude.py
git commit -m "feat: 添加 Claude API 调用示例代码"
```

---

### Task 14: 更新根目录 README.md

**Files:**
- Modify: `README.md`

- [ ] **Step 1: 在 README.md 的"内容导航 > 已完成的教程"表格末尾添加 AI 行**

在表格最后一行（Egg.js 行）之后添加：

```markdown
| [AI 大模型](./ai/) | LLM 学习路线 | 全景认知、API 实战、ML 基础、Transformer 原理、RAG/Agent/微调/部署 |
```

- [ ] **Step 2: 在"计划中的教程"表格中移除或更新 AI 相关条目**

如果已有 AI 相关计划条目，更新其状态为进行中。

- [ ] **Step 3: 在学习路线 ASCII 图中添加 AI 阶段**

在 `④ Node.js 后端开发` 之后添加：

```
│  ⑤ AI 大模型（进行中）                                                    │
│     全景认知 → API 实战 → ML 基础 → Transformer → RAG/Agent/微调/部署      │
│     📝 进行中                                                               │
```

- [ ] **Step 4: 提交**

```bash
git add README.md
git commit -m "docs: 在 README 中添加 AI 大模型学习导航"
```

---

### Task 15: 更新学习路线图

**Files:**
- Modify: `docs/学习路线图.md`

- [ ] **Step 1: 在"当前进度"区域添加 AI 进度条**

在 `Node.js 后端` 行之后添加：

```
AI 大模型     ██░░░░░░░░░░░░░░░░░░  10%
├─ 全景认知   ░░░░░░░░░░░░░░░░░░░░   0%
├─ API 实战   ░░░░░░░░░░░░░░░░░░░░   0%
├─ ML 基础    ░░░░░░░░░░░░░░░░░░░░   0%
├─ 原理深入   ░░░░░░░░░░░░░░░░░░░░   0%
└─ 高级应用   ░░░░░░░░░░░░░░░░░░░░   0%
```

- [ ] **Step 2: 添加"阶段六：AI 大模型学习"**

在"阶段五：综合实战"之后添加新章节，内容对应设计文档的五个阶段。

- [ ] **Step 3: 更新"技术学习时间表"**

添加 AI 相关技术行：

```markdown
| AI/LLM 全景 | Week 1-2 | 📅 计划 | 🔴 高 |
| LLM API 实战 | Week 3-5 | 📅 计划 | 🔴 高 |
| 机器学习基础 | Week 6-9 | 📅 计划 | 🟡 中 |
| Transformer | Week 10-13 | 📅 计划 | 🟡 中 |
| RAG/Agent/微调 | Week 14+ | 📅 计划 | 🔴 高 |
```

- [ ] **Step 4: 更新"推荐学习资源"**

在书籍和在线资源部分添加 AI 相关资源。

- [ ] **Step 5: 提交**

```bash
git add docs/学习路线图.md
git commit -m "docs: 在学习路线图中添加 AI 大模型学习进度"
```

---

## 自检清单

- [ ] 所有 11 个笔记文件均使用苏格拉底式提问法（问 1、问 2...）
- [ ] 每个笔记都包含"类比前端"解释
- [ ] 文件命名与设计文档一致（01-*.md 到 11-*.md）
- [ ] ai/README.md 包含完整的文件索引和学习顺序
- [ ] 示例代码可直接运行（需配置 API Key）
- [ ] 根目录 README.md 包含 AI 导航链接
- [ ] 学习路线图已更新 AI 进度
- [ ] 所有 commit 使用 `feat:` 或 `docs:` 前缀
