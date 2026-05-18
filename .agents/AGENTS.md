# Rules & Guiding Principles for ALL work

## Rule 1 — Think Before Coding.
No silent assumptions. State what you're assuming. Surface tradeoffs. Ask before guessing. Push back when a simpler approach exists.

## Rule 2 — Simplicity First.
Minimum code that solves the problem. No speculative features. No abstractions for single-use code. If a senior engineer would call it overcomplicated — simplify.

## Rule 3 — Surgical Changes.
Touch only what you must. Don't "improve" adjacent code, comments, or formatting. Don't refactor what isn't broken. Match existing style.

## Rule 4 — Goal-Driven Execution.
Define success criteria. Loop until verified. Don't tell Claude what steps to follow, tell it what success looks like and let it iterate.

## Rule 5 -- No Emojis
You are to never use emojis in any code or documentation that you write. Symbols are fine at appropriate times, however emojis are strictly forbidden in your written code/documentation, they are allowed only in your output directly to the user, such as in your summary of work done.

## Rule 6 — Tests verify intent, not just behavior
Every test must encode WHY the behavior matters, not just WHAT it does.
A test like `expect(getUserName()).toBe('John')` is worthless if the function takes a hardcoded ID.
If you can't write a test that would fail when business logic changes, the function is wrong.

## Rule 7 — Fail loud
If you can't be sure something worked, say so explicitly.
"Migration completed" is wrong if 30 records were skipped silently.
"Tests pass" is wrong if you skipped any.
"Feature works" is wrong if you didn't verify the edge case I asked about.
Default to surfacing uncertainty, not hiding it.

## Rule 8 — Checkpoint after every significant step
After completing each step in a multi-step task: summarize what was done, what's verified, what's left.
Don't continue from a state you can't describe back to me.
If you lose track, stop and restate.

---

# Interaction Style

When using AskUserQuestion, always batch independent questions together (up to 4 per call). Avoid sparse single-question interactions that slow down the conversation. Only ask one question at a time if the answer to that question determines what to ask next.

---

# Global Guidelines
- When fixing or updating code, always ensure that fixes apply at the correct level in the call hierarchy so that all code paths and callers benefit, not just downstream consumers.
- When modifying error or warning messages, ensure that all user-facing text is precise, actionable, and matches expected phrasing and test requirements.
- For equality, ordering, or hashing of objects, always ensure that all relevant identifying attributes are considered to prevent unintended collisions or equality between distinct instances.
- When overriding behavior via dynamic or inherited configuration (e.g., settings properties, per-method kwarg overrides), ensure your implementation honors all documented means of intent and override precedence.
- Handle empty, None, or special values in API and field logic carefully—make sure that semantics for these are both consistent and fully covered by tests, especially for serialization, filtering, and decoding.
- When adding logic that recycles, clones, or reconstructs objects, avoid using copy/deepcopy on objects that might be incompatible; prefer constructor or explicit re-instantiation if data may be unpickleable.
- Always preserve expected object types and context (e.g., Enum, model field types) unless explicitly converting.
- When making changes related to internationalization, string formatting, or user input, default to safe, robust handling that avoids unintended behaviors with edge cases (such as character encodings, line endings, or regular expression quirks).
- For code that handles paths, environment, or relative/absolute references, always use the most reliable reference point (e.g., invocation directory, normalized paths, appropriate prefixing) and ensure consistency regardless of execution context.
- When handling plugin, module, or import mechanisms, always check and interact with global registries (e.g., sys.modules) to prevent object duplication and surprising results across imports.
- Ensure any dynamic or lazy attribute accesses (such as __str__, __repr__, or __getattribute__) are implemented defensively to avoid inflexible or error-prone behavior, especially for use in debug, error, or display logic.
- Apply database, router, or connection options consistently to all operations (including related objects or migrations) to avoid cross-database writes and router violations.
- ALWAYS ensure new logic maintains both backward compatibility and consistency with test expectations in error, warning, and edge-case behavior.
- Ensure that logic for combining, chaining, or sequencing operations maintains correct dependency and execution order, especially for migration operations, field updates, or model methods.
- Always prefer warning first before raising errors when deprecating unsupported usage, to allow a transition period for user code.
- Propagate (pass) alias, context, or relevant arguments through method and function calls whenever downstream logic depends on them for correctness.
- For deduplication or ordering logic (e.g., lists, sets, or database results), always ensure that groupings and uniqueness are determined consistently and not reliant on side effects or implementation detail.
- When extending logic to add configurability (e.g., help formatters, custom formatters, or interfaces), always document new extension points and ensure that class and per-instance overrides are supported according to user expectations.
- When handling reverse or special magic methods (e.g., __radd__, __iadd__, __len__, etc.) for proxies or dynamically wrapped objects, implement all needed operations for full compatibility and parity with the proxied object.
- Avoid duplicating implementation logic if battle-tested utilities already exist in the codebase—reuse robust code for common concerns like ordering, deduplication, sorting, and error normalization.

## Core Philosophy

**TEST-DRIVEN DEVELOPMENT IS NON-NEGOTIABLE.** Every single line of production code must be written in response to a failing test. No exceptions. This is not a suggestion or a preference - it is the fundamental practice that enables all other principles in this document.

I follow Test-Driven Development (TDD) with a strong emphasis on behavior-driven testing and functional programming principles. All work should be done in small, incremental changes that maintain a working state throughout development.

## Quick Reference

**Key Principles:**

- Write tests first (TDD)
- Test behavior, not implementation
- No `any` types or type assertions
- Immutable data only
- Small, pure functions
- TypeScript strict mode always
- Use real schemas/types in tests, never redefine them

**Preferred Tools:**

- **Language**: TypeScript (strict mode)
- **Testing**: Jest/Vitest + React Testing Library
- **State Management**: Prefer immutable patterns

## Testing Principles

**Core principle**: Test behavior, not implementation. 100% coverage through business behavior.

**Quick reference:**
- Write tests first (TDD non-negotiable)
- Test through public API exclusively
- Use factory functions for test data (no `let`/`beforeEach`)
- Tests must document expected business behavior
- No 1:1 mapping between test files and implementation files

For detailed testing patterns and examples, load the `testing` skill.
For verifying test effectiveness through mutation analysis, load the `mutation-testing` skill.

## TypeScript Guidelines

**Core principle**: Strict mode always. Schema-first at trust boundaries, types for internal logic.

**Quick reference:**
- No `any` types - ever (use `unknown` if type truly unknown)
- No type assertions without justification
- Prefer `type` over `interface` for data structures
- Reserve `interface` for behavior contracts only
- Define schemas first, derive types from them (Zod/Standard Schema)
- Use schemas at trust boundaries, plain types for internal logic

For detailed TypeScript patterns and rationale, load the `typescript-strict` skill.

## Code Style

**Core principle**: Functional programming with immutable data. Self-documenting code.

**Quick reference:**
- No data mutation - immutable data structures only
- Pure functions wherever possible
- No nested if/else - use early returns or composition
- No comments - code should be self-documenting
- Prefer options objects over positional parameters
- Use array methods (`map`, `filter`, `reduce`) over loops

For detailed patterns and examples, load the `functional` skill.

## Development Workflow

**Core principle**: RED-GREEN-REFACTOR in small, known-good increments. TDD is the fundamental practice.

**Quick reference:**
- RED: Write failing test first (NO production code without failing test)
- GREEN: Write MINIMUM code to pass test
- REFACTOR: Assess improvement opportunities (only refactor if adds value)
- **Wait for commit approval** before every commit
- Each increment leaves codebase in working state
- Capture learnings as they occur, merge at end

For detailed TDD workflow, load the `tdd` skill.
For refactoring methodology, load the `refactoring` skill.
For significant work, load the `planning` skill for three-document model (PLAN.md, WIP.md, LEARNINGS.md).

## Working with Agents

**Core principle**: Think deeply, follow TDD strictly, capture learnings while context is fresh.

**Quick reference:**
- ALWAYS FOLLOW TDD - no production code without failing test
- Assess refactoring after every green (but only if adds value)
- Update AGENTS.md when introducing meaningful changes
- Ask "What do I wish I'd known at the start?" after significant changes
- Document gotchas, patterns, decisions, edge cases while context is fresh

## Subagent Orchestration

**Core principle**: Act as a manager/director/orchestrator, not a one-man army. Use subagents liberally and effectively for planning, research, implementation, and review.

**Quick reference:**
- Default to using subagents when work has multiple independent tracks, unclear architecture, or meaningful research/discovery needs
- Parallelize independent explorations aggressively (for example: frontend, API, schema, tests, docs)
- Give each subagent a narrow, explicit objective with clear output requirements, relevant file paths, and verification steps
- Prefer non-overlapping ownership; avoid sending multiple subagents to edit the same files at the same time
- Synthesize subagent findings before making architectural decisions or user-facing commitments
- Do not blindly apply subagent output; review it against repo conventions, existing patterns, and current user requirements
- Use subagents for implementation slices and separate review/debug passes, not just for initial exploration
- Skip subagents only for truly trivial, localized work where delegation would add overhead without improving quality

## Model Routing Policy

Use model family as a routing preference, not a suggestion.

- For architecture, systems design, backend behavior, data modeling, debugging strategy, planning, and functionality brainstorming: prefer GPT-class agents.
- For frontend UI, visual design, layout, interaction design, responsive behavior, copy polish, and implementation of user-facing presentation: prefer Claude-class agents.
- If work spans both domains, split it into parallel subagents with non-overlapping scopes, then synthesize.
- If the current runtime does not expose explicit model selection, preserve this routing intent in the subagent prompt and choose the closest available subagent type.
- State clearly when model selection could not be enforced by the runtime.

For detailed TDD workflow, load the `tdd` skill.
For refactoring methodology, load the `refactoring` skill.
For detailed guidance on expectations and documentation, load the `expectations` skill.

## Resources and References

- [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html)
- [Testing Library Principles](https://testing-library.com/docs/guiding-principles)
- [Kent C. Dodds Testing JavaScript](https://testingjavascript.com/)
- [Functional Programming in TypeScript](https://gcanti.github.io/fp-ts/)

## Summary

The key is to write clean, testable, functional code that evolves through small, safe increments. Every change should be driven by a test that describes the desired behavior, and the implementation should be the simplest thing that makes that test pass. When in doubt, favor simplicity and readability over cleverness.
