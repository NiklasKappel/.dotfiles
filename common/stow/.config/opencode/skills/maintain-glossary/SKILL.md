---
name: maintain-glossary
description: Maintains project glossaries in `AGENTS.md` files. Use when asked to create, update, review, or continuously maintain project-specific term definitions.
---

Maintain a glossary of project-specific terms in a `## Glossary` section in `AGENTS.md` in the project root.

If there is a conflict between how a term is defined in the glossary and how it is used in the conversation, ask the user to resolve it.

Keep entries concise. Prefer one-line entries in the form `- Term: brief definition.`

All of the following points must apply to each glossary entry:
- A new team member would be confused without the entry.
- The entry does not reveal implementation details or data schemas.
- The entry is not obvious to a software developer.
- The entry is not obvious to a professional working in the business domain of the project.

