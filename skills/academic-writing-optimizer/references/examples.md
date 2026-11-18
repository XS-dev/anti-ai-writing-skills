# 科研语句修订示例与反例

以下示例展示如何在去除 AI 套话、补足概念解释与保护科学严谨性之间取得平衡。应用到具体手稿时，均须以论文实际公式和实验记录为准。

## E1. 删掉段尾空泛宣传，保留核心任务

原句：

> With richer measurements acquired, this multi-frame encoding scheme holds great potential to improve reconstruction quality, underscoring an urgent need for effective and efficient reconstruction algorithms.

诊断：前文已交代多帧采样；本句滑向“潜力巨大、迫切需要、高效准确”的连续宣传套话，却没有说明重建任务到底处理什么输入输出。

建议稿：

> Reconstruction combines these coded measurements to recover the target signal across spatial and frequency channels.

变更说明：删去无证据支撑的预期收益与“迫切需求”套话。若作者希望保留精度与计算开销这一任务目标，可补充 `accurately and at low computational cost` 作为目标限定，但不能写成 `The additional frames guarantee accurate reconstruction`（将目标误写为无条件保证）。

## E2. 局部核心概念首次出现时给出具体指代

原表达：

> nonuniform measurement sensitivity across subspace directions

读者疑问：`direction` 指图像几何方向、频率通道，还是线性代数子空间基向量？

可用短解释：

> Each subspace direction represents a joint variation pattern across channels, rather than an isolated change in a single channel.

保留原则：首次解释清楚后，后文稳定使用同一术语（如 `subspace direction`），不要为了词汇多样性轮换成 `component`、`mode`、`channel axis`。

## E3. 用可观察的系统响应解释抽象属性

建议写法：

> Perturbing the signal along a low-sensitivity direction produces only a weak change in the recorded measurements, making that component harder to recover under sensor noise.

避免只重复同义抽象词（如 `low sensitivity causes severe ill-posedness and reconstruction difficulty`），也避免把子空间方向偷换为单个原始通道。

## E4. 说明“标量权重”究竟固定了哪个自由度

过度压缩的原句：

> Branch-wise scalar penalties impose identical regularization strength and prior allocation across all components.

更易懂的改写：

> Using a single scalar weight per branch shares the same penalty across all components. Although the two branches may take different scalar weights, neither weight varies from one component to another.

注意边界：这只是客观描述优化接口的自由度，不得夸大写成 `Scalar weighting assigns equal weights to both branches and ignores forward measurement physics`。

## E5. 挑战句不能只写“应该怎么做”

原句：

> When complementary priors are combined for regularization, their contributions must be coordinated with operator conditioning.

诊断：这是设计目标（“必须协调”），没有指出已有方式在什么条件下受限。

建议稿：

> With scalar branch weights, both the total regularization strength and the relative weight between the two priors remain fixed across components within each stage, even when measurement noise affects those components unequally.

## E6. 后果从句不要把前文换词再说一遍

原句尾：

> ... restricting component-wise flexibility, thereby limiting the model's ability to accommodate unequal measurement constraints across components.

诊断：`restricting flexibility` 与 `limiting the ability to accommodate` 属于同义反复，读者仍不知道具体少了什么控制能力。

具体化改写：

> ... so increasing regularization on weakly measured components simultaneously over-smooths strongly measured ones.

（注：仅在数学形式或实验确实支持该耦合效应时采用；若仅支持自由度受限，则停在权重无法独立调节这一层，不凭空编造视觉伪影结论。）

## E7. 段落过渡需建立桥梁，但不替全部文献背锅

生硬过渡：

> Deep inverse solvers have achieved substantial progress. However, multi-branch reconstruction still faces two critical challenges.

可填充的实质过渡框架：

> [Existing unrolled solvers effectively leverage learned image priors under standard forward operators.] When [a specific conditioning property of the target operator] arises, however, [the specific coupling step in standard formulations] leaves [a concrete bottleneck] unresolved.

若文献调研仅证明某一方法子类使用标量罚项，应明确限定到该子类，不得泛化为 `all prior learning-based methods`。

## E8. 区分“保留闭式更新”与“首次实现闭式求解”

易误导写法：

> ... enabling a closed-form variable update.

当基准方法原本就有闭式解、本文在扩展权重自由度后依然维持该性质时，准确写法应为：

> ... preserving a closed-form variable update evaluated component-wise in the shared eigenbasis.

同时切勿将“子问题存在闭式唯一解”拔高为“证明了端到端网络全局收敛”。

## E9. 把数学性质直接落到中心名词上，避免修饰堆叠

原句：

> Strictly positive weights generated from the operator spectrum define the metric matrices in its eigenvector basis, preserving a closed-form update.

精简后：

> Weights generated from the operator spectrum define positive-definite metric matrices in its eigenvector basis, preserving a closed-form update.

说明：`positive-definite` 已蕴含特征值严格为正；引言概述可省去重复副词，而在方法节公式中完整保留正下界参数定义。

## E10. 辅助模块用具体输入输出动作描述

空泛写法：

> The cross-stage module propagates useful reconstruction information across iterations.

具体写法：

> Between adjacent stages, the transition module maps the latest estimate increment into a shared feature input for both prior branches.

明确区分“相邻阶段估计之差（estimate increment）”“观测残差（measurement residual）”与“真实误差（ground-truth error）”，润色时绝不能混用。

## E11. 砍掉防御性套话，保留真实适用条件

冗余套话：

> It could potentially be argued that the proposed formulation might offer improvements in certain scenarios.

有对照实验支撑时直接陈述：

> Across the three benchmark datasets, the proposed formulation reduces reconstruction RMSE by 8%–14% under unseen noise levels.

与此同时，`under calibrated operator perturbations`、`for the fixed quadratic subproblem` 这类界定事实范围的状语属于科学严谨性保障，**绝不能**当作“防御性 AI 味”删掉。

## E12. 抽象动词搭配须核对宾语是否准确

不严谨写法：

> combining calibrated physics with learned priors

修正：被标定的是前向观测矩阵或成像模型参数，而非物理定律本身：

> combining a calibrated forward model with learned priors

## E13. 作者锁定的收束句式：区分风格润色与证据审计

当作者明确要求保留某句强总结（例如 `These results indicate that component-wise metric conditioning provides a practical basis for ...`）时：
- **风格层面**：尊重作者选定的句式骨架，不擅自改成平庸的 `highlights the importance of ...`；
- **证据层面**：若句中出现 `universal paradigm` 等超出实验覆盖范围的词汇，在修订说明中单独提示证据边界，不假借语法润色静默替换作者核心论断。

## E14. 数值加权聚合不能润色成“严格保幅”

原意正确表述：

> The nonlocal branch uses normalized similarity scores to compute a weighted average of neighboring features.

错误润色：

> The nonlocal branch preserves the exact amplitude of every local feature.

原因：加权平均会改变输出数值分布，“利用未归一化特征的幅值信息”不等于“每个位置的幅值原样不变”。

## E15. 不应被误判为“AI 味”而机械误删的合理写法

| 表面特征 | 科研论文中应予保留的合理情形 |
|---|---|
| 三条贡献列表 | 核心方法、支撑组件、系统验证确系三层工作，且符合领域惯例 |
| `We` 平行开头 | `We propose / We introduce / We evaluate` 构成清晰的贡献索引 |
| 加粗小标题 | 挑战段或消融段用短标题帮助审稿人快速定位论点 |
| 专业连字符 | `multi-scale`、`signal-to-noise`、`positive-definite`、`closed-form` 及数值区间 `10–20 dB` |
| 被动语态 | 聚焦客观处理流程（如 `The sensor response is calibrated prior to training`） |
| 条件限定从句 | 界定定理成立条件、测试噪声区间或固定超参数协议 |
| `robust`、`efficient` | 后文紧跟抗噪曲线或运行时间/显存对比表时，属于有据可查的技术指标 |

## E16. 定稿核对与文本润色严禁混为一谈

错误做法：用户询问“当前 LaTeX 稿是否已恢复到上周锁定版”，助手先顺手润色三处语病，再回答“现已一致”。

正确做法：锁定比对基准，忽略纯断行/空格差异，逐句列出“完全一致”“经授权的格式/引文变更”与“未授权的措辞或含义差异”，未经指令绝不触碰原稿。
