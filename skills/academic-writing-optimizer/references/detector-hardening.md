# 降 AI 率实操与检测报告排查

当任务需要压低英文（或中译英）科研手稿在朱雀等 AIGC 检测器中的 AI 率，同时必须严格保留技术事实、术语、引用编号与专业语法时，按本参考执行。

## 一、为什么“越改越回”：必须避开的高危重写反模式

单纯“换词润色”或把平铺直叙改写得更“地道”，常常会引入语言模型最典型的高概率句法模板，导致检测分数不降反升（实测曾出现 `0.9954 -> 0.9985`）。重写草稿完成后，必须对**新写出的句子**反查以下四类高权重触发点：

1. **高密度 `Humanizer §1` 对仗对比（`X rather than Y` / `not X but Y`）**
   - 同一段落中仅出现 1–2 处 `... limits rather than fluid mechanics`、`... shifts smoothly rather than carving out ...`，或对称句 `avoids X, yet ...`、`sidesteps A but trades B for C`，就足以使整段 AIGC 值接近 `1.0`。
   - **改法**：直接用正面陈述说出真实限制或权衡，删除无信息增量的对照半句。

2. **冒号阶段式展开（Colon staging）与倒装存在句**
   - 如 `... adds a timing constraint as well: sweeping ...`、`... makes this trade-off steeper: narrowing ...`，或倒装主语句 `Underlying both encoding schemes are physical constraints inside the chip itself.`。
   - **改法**：拆成正常主谓宾句号短句或直接用 `because` / `when` 连接；禁止句末加 `as well`、`itself`/`themselves` 做节奏点缀。

3. **LLM 偏好隐喻动词与“巧词”**
   - 如 `carving out`、`sidesteps`、`squeezes`、`pixel budget`、`makes ... steeper` 等生动但非物理实指的表达，在统计检测器中辨识度极高。
   - **改法**：回退到直白、标准的科研物理动词（`limits`, `hinders`, `increases`, `lowers`, `prevents`, `produces`, `reduces`）。

4. **`Humanizer §15` 句尾 `-ing` 分词结果尾巴**
   - 如 `..., making high sensitivity hard to keep near room temperature`、`..., leaving carrier mobilities low`。
   - **改法**：改为带明确主语与有限动词的从句（`, so carrier mobilities and diffusion lengths stay low`、`..., which lowers sensitivity near room temperature`）。

## 二、稳定过检的正向改写原则

对照已通过低 AI 率段落（实测 AIGC `< 0.10`）与原始技术草稿，稳定有效的英文改写遵循四条原则：

1. **一比一锚定“对象与条件 → 物理机制/限制 → 直接后果”**：去掉“段首宏观伞句（face challenges in A, B, and C）”和“段尾升华总结（Addressing these bottlenecks requires coordinated progress across...）”，直接写具体问题。
2. **用有限动词与因果连词替代修辞结构**：优先使用 `When ...`, `Because ...`, `so ...`, `which ...`, `while ...` 形成直白的主谓宾技术陈述，与作者原始论文语流保持一致。
3. **重整骨架而非局部换词**：如果某段被判高 AI，不要只把形容词换成近义词；必须打散原句的“总—分—对比—总结”模板，改为长短自然交错（例如 10–35 词混合）的事实句群。
4. **交付前用脚本或清单自检新草稿**：重点核查 `§1`（rather than / not X but Y）、`§6`（三元排比）、`§8`（长破折号 `—` 与装饰冒号 `:`）、`§12`（AI 词表）、`§15`（`, making/leaving/...ing`）与 `§18`（繁冗谓语替代 `is/are/has`），保证**新改写段落为零命中**。

## 三、对比示例

**反例（引入多个 LLM 句法模板，实测 AIGC `0.9985`）：**
> Photolithography and lift-off run into chemical and alignment limits rather than fluid mechanics: repeating alignment and exposure over dozens of quantum-dot layers accumulates overlay error... An alternative is to assign distinct bandgaps or local optical resonators to adjacent pixels, which sidesteps multi-junction growth but trades spatial sampling density for spectral channels within a fixed pixel budget [1,2].

**正例（剥离对仗、冒号、隐喻，直白陈述物理事实与权衡）：**
> Micro-nanofabrication by multi-step photolithography and lift-off encounters different yield losses. Repeated alignment across dozens of quantum-dot layers builds up overlay error, while developers and polar stripping solvents attack previously deposited films and damage their surface passivation [1]. ... In array-based spatial encoding, assigning distinct bandgaps or optical resonators to different pixels lowers spatial sampling density whenever more spectral channels are added [2,3].

**反例（倒装主语 + 冒号 + `-ing` 尾巴 + 隐喻动词，实测与前句共致 `0.5030`）：**
> Underlying both encoding schemes are physical constraints inside the focal-plane detector chip itself. ... Extending detection into the MWIR and LWIR bands makes this trade-off steeper: narrowing the nanocrystal bandgap raises thermally excited carrier concentrations exponentially alongside faster Auger recombination, making high sensitivity hard to keep near room temperature [4–6]. Shrinking pixel pitches below 5 μm further squeezes the integration capacitance...

**正例（直接主谓宾 + 有限动词因果从句）：**
> At the back end of the detector system, infrared photodetector chips face physical limits in carrier transport, thermal dark current, and small-pixel array integration. ... When the detection range shifts to the MWIR and LWIR bands, thermal carrier generation in narrow-bandgap nanocrystals grows exponentially and Auger recombination speeds up, which lowers sensitivity near room temperature [4–6]. At pixel pitches below 5 μm, the reduced integration capacitance available inside each readout unit cell leads to faster dark-current saturation, stronger inter-pixel crosstalk, and higher readout noise during weak-light detection [7,8].

## 四、检测报告切片定位与参考文献误判处理

1. **逐片段回溯原文定位**：拿到朱雀等分片报告后，先核对高 AI 片段对应正文哪几段，不要盲目修改已经低分通过的段落（如 AIGC `< 0.15` 的段落应保持不动）。
2. **识别参考文献列表的格式误判**：标准化期刊文献格式（尤其是 SPIE / IEEE 样式中包含高频重复的 `[doi:...]`、卷期页码与标准缩写）常因结构高度规则被切片判为疑似 AI（实测单段文献列表可达 `0.52`–`0.99`）。**绝对不能**为了降分而删改真实参考文献作者、标题、卷期或 DOI；应向用户指明哪些片段属于 References 误报，并仅针对正文片段做去 AI 重写或剥离文献节复测纯正文。
