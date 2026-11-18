# 学术写作优化 Skill (`academic-writing-optimizer`)

本包用于中文与英文科研文本的起草、审阅、去 AI 味、降低 AIGC 检测率、修改与定稿版本核对。重点是面向大同行（非完全对口子领域）的研究读者解释核心概念、补足段落过渡、减少空泛与防御性套话，并严格保留作者已经确定的技术事实与证据边界。

## 使用方法

将本目录作为一个完整 skill 放入 Agent 的 `skills/` 目录中，入口为 `SKILL.md`。

示例请求：

> 使用 `academic-writing-optimizer`，只诊断 Introduction 第一段。读者熟悉机器学习但不熟悉压缩感知成像。优先解释核心概念，删除空泛评价；不要修改方法名、证据或其余段落。先给主要问题，再给一版建议稿，并区分表达变化和信息删改。

> 使用 `academic-writing-optimizer` 修订第二、三段之间的过渡。依据已提供的代表论文概括有证据支撑的共同做法，不把特定先验假设归于全部方法，不添加新实验结论。

> 使用 `academic-writing-optimizer` 并参考 `detector-hardening.md`，针对朱雀检测标红的正文段落降低 AI 率，保留全部物理参数、术语定义与引用编号，并区分参考文献列表的格式误判。

## 目录结构

- `SKILL.md`：执行入口，包含编辑模式、七步工作流程、分章节规则、Humanizer 学术适配与交付检查。
- `references/detector-hardening.md`：降 AI 率实操反模式排查（对仗、冒号阶段展开、倒装、隐喻巧词、`-ing` 尾巴）与检测报告误报识别。
- `references/reader-feedback.md`：大同行审阅反馈的规则化整理与验收标准。
- `references/section-rules.md`：引言、摘要、相关工作、方法、实验与结论各章节职责与组织准则。
- `references/examples.md`：科研语句修订正反例及不可机械删除的合理学术写法。
- `templates/revision-report.md`：任务约束、主张和版本变更记录模板。
- `templates/acceptance-checklist.md`：成稿验收清单与 10 项失真回归测试。

## 边界说明

本包不判断文本作者身份，也不允许为迎合检测器评分而篡改科学事实、实验条件、数学定义或真实参考文献条目。

版本：1.0.0。
