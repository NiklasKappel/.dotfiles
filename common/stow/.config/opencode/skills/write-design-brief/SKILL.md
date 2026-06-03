---
name: write-design-brief
description: Converts conversation context into a Markdown Design Brief. Use when asked to turn conversation context, interview outcomes, or clarified requirements into a designer handoff brief.
---

Use this skill after a `challenge-idea` Q&A session, or a similar clarification interview, has established the user's intent and domain decisions. Produce a Markdown Design Brief for a software designer who already knows how to create module/interface designs and can inspect existing architecture context separately.

Make the brief self-contained for user intent and domain decisions. Do not include current project-state facts, existing architecture details, implementation details, proposed modules, public classes/functions, signatures, API return shapes, file placement, dependency structure, exception contracts, or designer output-format instructions.

Classify prior Q&A outcomes before writing. Include binding domain decisions, concrete domain values, defaults, ranges, naming choices, domain invalidity rules, rationale, rejected alternatives, non-goals, specific quality attributes, domain-level acceptance criteria, and nontrivial assumptions/risks. Omit design-owned ideas by default, even if they were discussed earlier, unless the user explicitly marks them as important non-binding context.

Use two vocabulary channels. Assume durable project-wide terms are maintained in the project glossary and already known to the designer. Add a `Brief-Local Terms` section only for task-specific or temporary terms needed to understand this handoff.

Distinguish domain invalidity rules from exception contracts. A domain invalidity rule states what the domain must not allow. An exception contract states specific interface behavior, exception classes, or messages; omit exception contracts unless the user explicitly made them a domain requirement.

If required context is missing, ask clarifying questions before drafting. Do not invent unresolved domain decisions.

Use this template:

```markdown
# Design Brief: <Task Name>

## Goal
State the user-visible outcome in one or two paragraphs.

## Problem Context
Explain why this is needed, who or what it serves, and how it will be used.

## Brief-Local Terms
Define task-specific terms that are not durable project-glossary terms.

## Binding Domain Requirements
List functional and domain requirements that must hold. Include agreed concrete values, defaults, domains, ranges, and naming choices when they are domain-level decisions.

## Domain Invalidity Rules
List conditions the domain says must not be allowed. Do not prescribe exception classes, messages, or interface-level error behavior.

## Decisions And Rationale
Record important final decisions, concise reasoning, and important rejected alternatives.

## Non-Goals
List explicit exclusions and deferred capabilities.

## Quality Attributes
List specific design forces such as determinism, testability, extensibility, performance expectations, or maintainability constraints. Avoid generic slogans.

## Domain Acceptance Criteria
List observable domain-level success criteria. Do not write interface-specific tests.

## Assumptions And Risks
List nontrivial assumptions and what breaks if they are false.
```

