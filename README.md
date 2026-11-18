# Anti-AI Writing Skills (`anti-ai-writing-skills`)

面向 **Antigravity / Magpie / DSH / Claude Code / Codex** 等支持 `SKILL.md` 的 Agent 客户端整理的**去 AI 味、降 AIGC 检测率与科研论文精修 Skill 合集**。

核心理念：**去 AI 味不是“换同义词”或“故意写错语法”，而是砍掉空泛修辞、防御性废话与统计高概率句法模板，用具体主谓宾、稳定术语和严格对齐的证据把事实讲清楚。**

---

## 收录 Skill 一览

| Skill 名称 | 适用语言 | 核心定位 | 典型使用场景 | 来源与协议 |
| :--- | :---: | :--- | :--- | :--- |
| **[`academic-writing-optimizer`](./skills/academic-writing-optimizer/)** | 中 / 英 | **科研全章法优化 + 降 AIGC 检测率实操** | 面向大同行解释核心概念、补足引言过渡、排查朱雀等 AIGC 检测器高危句式（`rather than` 对仗、冒号展开、倒装、`-ing` 尾巴、参考文献误报）及定稿逐句核对 | 原创整理（MIT，基于 Humanizer 3.0 学术适配） |
| **[`scientific-writing-editor`](./skills/scientific-writing-editor/)** | 英（兼顾中文说明） | **通用科研论文低 AI 感精修（最小必要修改）** | 20 条铁律 + 5 步 `de-AI pass` + 20 点投稿前自检表：专治乱造概念、抽象名词堆叠、表格复读机、空洞副词及把正文写成 rebuttal | 原创整理（MIT） |
| **[`anti-defensive-writing`](./skills/anti-defensive-writing/)** | 英 | **清理 AI 防御性废话与免责套话** | 删除道歉式铺垫、条件反射式 `"not X but Y"` / `"This paper does not claim..."`、假想反驳与层层叠加的缓和词，同时保留真实适用边界 | 整理收录（MIT） |
| **[`humanizer`](./skills/humanizer/)** | 英 | **通用英文 25 类 AI 写作痕迹清洗（v3.0.0）** | 博客、文档、邮件与日常英文文本去 AI 腔（基于 Wikipedia *Signs of AI writing* 归纳的 25 类高频模式） | 上游开源 [@blader/humanizer](https://github.com/blader/humanizer)（MIT） |

---

## 怎么选？（推荐组合流）

```text
日常英文 / 技术博客 / 说明文档 ──────────► humanizer
                                              │
英文通用论述（去免责铺垫、增强直接自信度） ─► anti-defensive-writing
                                              │
英文科研手稿日常改稿（最小改动 + 严守证据）► scientific-writing-editor
                                              │
中英论文大同行可读性重构 / 过 AIGC 检测器 ─► academic-writing-optimizer
```

- **写通用英文 / README / 博客**：直接调用 `/humanizer`。
- **改英文论文单段（怕改坏原意）**：优先调用 `/scientific-writing-editor`（默认遵循 Minimal-Edit 最小必要修改原则，不动已正确的句子）。
- **初稿充满了 `We do not claim...` / `Rather than X, we argue Y...`**：调用 `/anti-defensive-writing` 一键清理防御性姿态。
- **跨小同行投稿引言难懂，或需要在朱雀等 AIGC 检测中压低正文 AI 率**：调用 `/academic-writing-optimizer`（内置 [`detector-hardening.md`](./skills/academic-writing-optimizer/references/detector-hardening.md) 反模式排查与参考文献格式误报识别）。

---

## 快速安装

### 方式一：使用 `skills` CLI 一键安装（推荐）

```bash
# 安装合集内的全部 4 个 Skill（全局）
npx skills add XS-dev/anti-ai-writing-skills --global

# 或按需只安装某一个 Skill
npx skills add XS-dev/anti-ai-writing-skills --skill academic-writing-optimizer --global
npx skills add XS-dev/anti-ai-writing-skills --skill scientific-writing-editor --global
npx skills add XS-dev/anti-ai-writing-skills --skill anti-defensive-writing --global
npx skills add XS-dev/anti-ai-writing-skills --skill humanizer --global
```

### 方式二：安装到本机 Antigravity / Magpie / DSH / Claude / Codex

克隆本仓库后运行自带脚本（支持全部安装或指定 `--skill` / `--target`）：

**Windows (PowerShell):**

```powershell
git clone https://github.com/XS-dev/anti-ai-writing-skills.git
cd anti-ai-writing-skills

# 默认安装到本机已存在的客户端目录（Antigravity / Magpie / DSH）
pwsh ./scripts/install.ps1

# 或指定目标客户端与单个 Skill
pwsh ./scripts/install.ps1 -Target antigravity -Skill scientific-writing-editor
pwsh ./scripts/install.ps1 -Target magpie
```

**macOS / Linux (Bash):**

```bash
git clone https://github.com/XS-dev/anti-ai-writing-skills.git
cd anti-ai-writing-skills

# 默认安装到已检测到的客户端目录
bash ./scripts/install.sh

# 或指定目标客户端（antigravity | magpie | dsh | claude | codex | all）
bash ./scripts/install.sh --target antigravity
```

### 方式三：手动复制目录

直接将 `skills/<skill-name>` 文件夹复制到对应客户端的技能目录即可：

- **Antigravity**：`~/.gemini/config/skills/`
- **Magpie 技能主库**：`~/.config/magpie/library/skills/`
- **DSH**：`~/.dsh/skills/`
- **Claude Code**：`~/.claude/skills/`
- **Codex**：`~/.codex/skills/`

---

## 目录结构

```text
anti-ai-writing-skills/
├── skills/
│   ├── academic-writing-optimizer/   # 中英科研写作优化 + 降 AIGC 检测率实操
│   │   ├── SKILL.md
│   │   ├── references/
│   │   │   ├── detector-hardening.md # 朱雀等检测器高危句法反模式与误报排查
│   │   │   ├── examples.md           # 16 组正反修订示例与保留边界
│   │   │   ├── reader-feedback.md    # 大同行审阅意见转化规则
│   │   │   └── section-rules.md      # 各章节职责准则
│   │   └── templates/
│   │       ├── acceptance-checklist.md
│   │       └── revision-report.md
│   ├── scientific-writing-editor/    # 英文科研最小必要修改 + 20 点自检表
│   │   ├── SKILL.md
│   │   ├── checklists/20-point-checklist.md
│   │   └── memory-summary.txt
│   ├── anti-defensive-writing/       # 去除防御性铺垫与过度免责套话
│   │   └── SKILL.md
│   └── humanizer/                    # 通用英文去 AI 痕迹 (v3.0.0, by blader)
│       ├── SKILL.md
│       └── LICENSE
├── scripts/
│   ├── install.ps1                   # Windows 一键安装脚本
│   └── install.sh                    # macOS / Linux 一键安装脚本
├── .claude-plugin/                   # Claude Code Plugin 清单
└── LICENSE
```

---

## 致谢与开源协议 (Credits & License)

本仓库采用 **[MIT License](./LICENSE)** 开源：

- `academic-writing-optimizer`、`scientific-writing-editor`、`anti-defensive-writing`：以 MIT 协议发布，欢迎自由修改、复用与分发。
- `skills/humanizer/`：完整保留自 **[Siqi Chen (@blader) / humanizer](https://github.com/blader/humanizer)**（v3.0.0，MIT License，基于维基百科 [WikiProject AI Cleanup: Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing)），其原始版权声明完整保留于 [`skills/humanizer/LICENSE`](./skills/humanizer/LICENSE)。
