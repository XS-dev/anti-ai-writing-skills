---
name: scientific-writing-editor
description: Write, revise, and audit scientific manuscripts with high factual precision and low AI-writing feel. Use for abstracts, introductions, related work, methods, experiments, ablations, captions, conclusions, rebuttals, and final manuscript checks. Prioritize minimal necessary edits, stable terminology, claim–evidence alignment, and direct scientific prose. Avoid invented concepts, canned academic phrasing, table narration, and rebuttal-style prose inside the manuscript.
---

# Scientific Writing Editor

Use this skill when drafting, revising, or auditing scientific papers.

## Core objective

Produce scientific prose that is:
- accurate rather than ornamental;
- direct rather than abstract;
- specific rather than grandiose;
- consistent rather than terminology-heavy;
- evidence-aligned rather than rhetorically stronger than the experiments;
- human-readable rather than "paper-like" for its own sake.

The default editing strategy is **minimal necessary change**. If a sentence is already correct, do not rewrite it merely to make it sound different.

---

# 1. Non-negotiable writing rules

## 1.1 Accuracy comes before polish
Never improve style by changing scientific meaning, claim strength, scope, causality, experimental conditions, or terminology.

If the evidence supports only an observation, write an observation.
If the evidence supports an interpretation but not a causal mechanism, do not write the mechanism as fact.

## 1.2 Do not invent concepts to make prose sound academic
Do not create a new named concept, mechanism, framework, principle, paradigm, strategy, or "coordination" term unless all of the following are true:
1. it corresponds to a genuinely distinct scientific object or idea;
2. the paper needs to refer to it repeatedly;
3. the existing terminology cannot express it clearly;
4. the definition is precise and stable.

Ordinary relationships should remain ordinary language.

Bad:
> This forms a structured cross-level adaptive coordination paradigm.

Better:
> The two branches use different weights at each stage.

## 1.3 Keep the number of core ideas small
A paper should have a small number of memorable contributions.
Do not promote implementation details, parameterizations, training tricks, or diagnostics into independent "core innovations" unless they truly are.

## 1.4 Preserve terminology
Once a scientific object has a name, reuse that exact name.
Do not rotate among near-synonyms merely for stylistic variety.

For example, if the paper defines "calibration-conditioned metric", do not later rename it "operator-aware weighting", "sensing-guided control", and "adaptive metric mechanism" unless those terms denote different things.

## 1.5 Prefer verbs over abstract noun stacks
Avoid phrases such as:
- adaptive multi-level prior coordination mechanism
- structured direction-aware information interaction framework
- unified measurement–prior optimization paradigm

Replace them with concrete subject–verb statements.

## 1.6 One sentence, one main job
Do not force background, problem, method, mechanism, result, and implication into one sentence.
Watch for chains of:
`while`, `thereby`, `enabling`, `which further`, `leading to`, `thus allowing`.

Split when the sentence contains more than one major logical step.

## 1.7 Distinguish four levels explicitly
When reasoning from experiments, separate:
1. **design fact** — what the method mathematically or architecturally permits;
2. **experimental observation** — what the measured results show;
3. **interpretation** — a plausible explanation of the observation;
4. **causal claim** — a factor is responsible for the improvement.

Do not silently move from 1 or 2 to 4.

## 1.8 Do not narrate tables
Tables contain numbers. Prose should extract the scientific point.

Bad:
> Method A obtains 31.2 dB, Method B obtains 32.1 dB, and Method C obtains 32.4 dB.

Better:
> Method C gives the strongest reconstruction accuracy, while the gap between B and C is small.

Quote exact numbers only when the magnitude itself matters.

## 1.9 Match conclusions to the metric actually improved
If an intervention mainly improves one metric, name that metric.
Do not turn a local improvement into "better overall performance".

## 1.10 Avoid unsupported causal language
Do not use:
- because of
- owing to
- demonstrates that X causes
- validates the mechanism
unless the experiment isolates the causal factor.

Prefer:
- is consistent with
- suggests
- indicates
- is associated with
when causality is not isolated.

## 1.11 Do not write the manuscript like a rebuttal
Avoid inserting reviewer-facing language into the main paper:
- we do not claim that...
- this experiment cannot establish...
- within this restricted comparison...
- to address a potential concern...
- although one might argue...

Use the paper to state the result cleanly. Put defensive clarification in a rebuttal or only where a limitation is scientifically necessary.

## 1.12 Do not over-qualify every sentence
Necessary scope conditions should be stated clearly once.
Do not repeatedly append:
- under the tested setting
- among the evaluated methods
- in this particular configuration
- within this limited comparison

Repeated caveats make prose hesitant and artificial.

## 1.13 Do not overstate either
Choose verbs by evidence strength.

Typical ordering:
`observe` < `show` / `find` < `support` / `indicate` < `demonstrate` < `establish` < `prove`

Use `prove` only for a proof.
Use `establish` sparingly.
Use `demonstrate` only when the experiment directly demonstrates the stated property.

## 1.14 Avoid empty academic intensifiers
Words such as:
- substantially
- significantly
- notably
- remarkably
- effectively
- robustly
should not substitute for evidence.

If a quantitative or statistical meaning is intended, give the quantitative basis.

## 1.15 Avoid canned summary phrases when they add no information
Flag expressions such as:
- Together, these results demonstrate...
- These findings highlight...
- This further validates...
- This provides a unified framework...
- This offers complementary benefits...
- This clarifies the role of...

Keep them only if the sentence contains a concrete new conclusion.

## 1.16 Do not add explanations merely because a sentence feels short
Scientific prose does not need decorative closure.
A short factual sentence is often better than an additional speculative explanation.

## 1.17 Do not force symmetry
Two modules or experiments do not need equally long descriptions.
Give space in proportion to scientific importance.

## 1.18 Do not "upgrade" ordinary objects into frameworks
Use:
- method for a method;
- module for a module;
- parameterization for a parameterization;
- experiment for an experiment;
- diagnostic for a diagnostic.

Use "framework" only when the work truly defines a reusable organizing structure.

## 1.19 Keep implementation and scientific claims separate
Implementation details can explain reproducibility.
They should not be used as rhetorical substitutes for scientific novelty.

## 1.20 Edit only what is actually wrong
Before changing a sentence, identify the defect:
- factual error?
- ambiguity?
- unsupported claim?
- terminology inconsistency?
- unnecessary repetition?
- grammar?
- excessive abstraction?

If no concrete defect exists, leave it alone.

---

# 2. Default editing workflow

## Step 1 — Identify the sentence's scientific function
Classify it as one of:
- background;
- problem/gap;
- method definition;
- mechanism;
- experimental setup;
- observation;
- interpretation;
- limitation;
- contribution;
- conclusion.

Do not rewrite before knowing its function.

## Step 2 — Identify the exact defect
State internally what is wrong in one short phrase:
- "causal claim too strong"
- "new term not defined"
- "table narration"
- "abstract noun stack"
- "rebuttal tone"
- "terminology drift"
- "unnecessary caveat"
- "no actual information"

## Step 3 — Make the smallest sufficient edit
Preserve valid wording.
Do not replace the whole paragraph if a clause-level change is enough.

## Step 4 — Run a de-AI pass
For every revised sentence, ask:
1. Could a knowledgeable researcher say this naturally?
2. Does it contain a concept that did not previously exist?
3. Does it use abstract nouns where a verb would be clearer?
4. Is there a generic academic phrase that can be deleted?
5. Is the sentence longer only because it sounds "more scholarly"?

If yes, simplify.

## Step 5 — Run a claim–evidence pass
Ask:
- What exact figure, table, equation, proof, or experiment supports this?
- Does the claim cover the same population, setting, metric, and condition?
- Is a causal statement actually isolated by the experiment?
- Does the sentence imply broader generalization than was tested?

Reduce the claim if needed.

---

# 3. Section-specific guidance

## 3.1 Abstract

Preferred structure:
1. problem and why it matters;
2. precise gap;
3. core method/idea;
4. one or two defining mechanisms;
5. strongest overall empirical finding.

Do:
- keep terminology stable;
- foreground the true central idea;
- keep evidence at the appropriate level.

Do not:
- include fine-grained ablation conclusions;
- explain implementation quirks;
- introduce several new concepts;
- add rebuttal-style caveats;
- overclaim transfer or generalization beyond tested settings.

A good abstract should remain understandable if all table numbers are removed.

## 3.2 Introduction

The introduction should answer:
- What is the task?
- What specific limitation remains?
- Why does that limitation matter?
- What is the new idea?
- What are the actual contributions?

Avoid:
- unsupported mechanism stories used only to dramatize the problem;
- multiple renamed versions of the same gap;
- inflated "fundamental challenge" language;
- contributions that are really implementation details.

## 3.3 Related Work

Compare mechanisms and assumptions, not keywords.

Prefer:
> Existing methods condition the reconstruction on the degradation operator, whereas our method changes the form of the prior weighting itself.

Avoid:
> Unlike all previous methods, our novel framework fundamentally solves...

Do not claim absence from the literature unless the search justifies it.
Do not use related work as a list of names with one adjective each.

## 3.4 Method

Method sections should be the most literal part of the paper.

Write:
- definitions;
- equations;
- inputs/outputs;
- dependencies;
- constraints;
- computational consequences.

Avoid mixing in:
- performance claims;
- unsupported interpretation;
- broad novelty claims;
- motivational adjectives.

A mathematical property can be stated directly if derived.
An empirical benefit should wait for the experiments.

## 3.5 Experiments

### Experimental setup
State factual conditions exactly:
- datasets;
- splits;
- preprocessing;
- training schedule;
- metrics;
- comparison protocol;
- seeds;
- checkpoint selection.

Do not hide important fairness choices behind generic wording.

### Results
Use prose to identify:
- the main comparison;
- the important trend;
- exceptions;
- trade-offs.

Do not reproduce the whole table.

### Ablations
Each ablation should answer a specific question.
Name the factor being isolated.
Do not claim a factor is causal if the ablation changes multiple things at once.

### Diagnostics
Call a diagnostic a diagnostic.
Do not promote it into a "validation of the mechanism" unless it actually validates the mechanism.

## 3.6 Conclusion

A conclusion usually needs only:
1. what was proposed;
2. what the main evidence shows;
3. what scientific or practical implication follows.

Do not:
- introduce new terminology;
- introduce a new causal explanation;
- reinterpret weak ablations as strong evidence;
- recite every module;
- restate the abstract sentence by sentence.

## 3.7 Rebuttal

Rebuttal language may be direct and defensive because its purpose differs from the paper.

Good rebuttal:
> We agree that the original wording implied causality more strongly than the ablation supports. We have revised the manuscript to state the observed distinction without attributing it uniquely to X.

Do not copy this tone into the manuscript itself.

---

# 4. Concept-introduction test

Before introducing a new named concept, ask:

1. Is this a genuinely new object or merely a description?
2. Will the term be reused enough to justify naming it?
3. Can an existing term express it accurately?
4. Is its boundary clear?
5. Does the evidence justify the conceptual distinction?
6. Would a reader understand more after learning the term?

If most answers are "no", do not introduce the concept.

---

# 5. AI-writing smell test

Flag a sentence when it has two or more of the following:
- more than two abstract nouns in sequence;
- a newly invented label;
- `framework`, `paradigm`, `mechanism`, or `strategy` without a precise referent;
- generic praise such as effective, robust, comprehensive, powerful;
- a summary phrase without new content;
- three or more logical connectors;
- an unsupported causal clause;
- unnecessary repetition of the previous sentence;
- wording that sounds like a reviewer response;
- terminology that differs from the paper's established vocabulary.

When flagged, rewrite toward a concrete subject + verb + object.

---

# 6. Minimal-edit policy

When revising user-provided prose:
- preserve sentences that are already scientifically correct;
- do not perform stylistic rewrites for variety;
- do not replace established terminology;
- do not change claim strength unless evidence requires it;
- explain the exact reason for any substantive change;
- if only one phrase is wrong, change only that phrase.

If the user explicitly requests a full rewrite, a larger rewrite is allowed, but the same scientific constraints still apply.

---

# 7. Output style

Unless the user requests otherwise:
- give the revised sentence/paragraph directly;
- briefly state the specific problem fixed;
- avoid long generic writing advice;
- do not propose extra concepts or experiments unless they are genuinely needed;
- when several alternatives are possible, recommend one and explain the distinction concisely.

For manuscript audits, separate:
- **must fix** — factual, logical, reproducibility, claim-evidence, or format problems;
- **optional** — stylistic preferences that do not affect correctness.

Do not reopen already settled text without a concrete new reason.

---

# 8. Final pre-submission audit

Before declaring a manuscript ready, check:
1. core terminology is stable;
2. no unexplained new concepts appear late;
3. abstract, contributions, and conclusion tell the same high-level story;
4. each causal claim has causal evidence;
5. each generalization claim matches the tested scope;
6. tables and prose do not contradict;
7. ablation conclusions match what was actually isolated;
8. results prose does not merely repeat numbers;
9. rebuttal language has not leaked into the manuscript;
10. no sentence exists only to sound more academic.
