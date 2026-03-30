# Skill: Frontend Development

Build, review, and optimise frontend code — components, state management, styling, accessibility, performance, and cross-browser compatibility.

---

## Overview

Claude can write and review React, Vue, Svelte, and vanilla JS/TS components, design CSS layouts, implement accessible UI patterns, debug rendering issues, optimise bundle size and Core Web Vitals, and generate component tests.

---

## Task Patterns

### 1. Generate a UI Component

**Prompt template:**
```
Build a [component name] component in [React / Vue / Svelte / vanilla JS].

Requirements:
- Props / inputs: [list with types and defaults]
- Behaviour: [describe interactions, states, transitions]
- Styling: [CSS modules / Tailwind / styled-components / plain CSS]
- Accessibility: keyboard navigable, screen reader friendly
- Edge cases: [empty state, loading state, error state]

[paste any existing design tokens or style guide snippets]
```

---

### 2. Implement a Layout

**Prompt template:**
```
Implement the following layout using [CSS Grid / Flexbox / Tailwind].

Layout description: [describe columns, rows, responsive breakpoints]
[paste design or ASCII mockup if available]

Requirements:
- Responsive: [breakpoints, e.g., mobile-first, 3 columns at ≥1024px]
- No fixed pixel widths for primary layout regions
- Works in Chrome, Firefox, Safari (last 2 major versions)
```

---

### 3. Add State Management

**Prompt template:**
```
Add state management to the following [React / Vue] component tree.

Current components: [describe component hierarchy]
State to manage: [describe shared state, e.g., user auth, cart, theme]
Preferred approach: [useState + Context / Redux Toolkit / Zustand / Pinia / signals]

Requirements:
- Minimal re-renders
- Devtools-friendly (named actions/slices)
- TypeScript types for all state shapes
```

---

### 4. Implement a Form with Validation

**Prompt template:**
```
Build a [form name] form in [React / Vue / HTML] with client-side validation.

Fields:
- [field name]: [type, required/optional, validation rules]
- [field name]: [type, required/optional, validation rules]

Requirements:
- Show inline errors on blur and on submit attempt
- Disable submit while loading
- Handle server-side validation errors returned as JSON
- Fully keyboard accessible and screen reader friendly
- Use [React Hook Form / VeeValidate / native constraint API / Zod]
```

---

### 5. Optimise a Component for Performance

**Prompt template:**
```
Optimise the following [React / Vue] component for performance.

[language]
[paste component code]

Current problem: [e.g., re-renders on every parent update, slow list rendering, large bundle size]

Apply:
- Appropriate memoisation (useMemo, useCallback, memo, computed)
- List virtualisation if applicable
- Lazy loading for heavy dependencies
- Avoid unnecessary DOM operations

Explain each change and why it helps.
```

---

### 6. Debug a UI Issue

**Prompt template:**
```
Debug the following frontend issue.

Framework: [React / Vue / Svelte]
Problem: [describe what is happening vs what should happen]
Steps to reproduce: [list steps]

Relevant code:
[language]
[paste component(s)]

Console errors: [paste if any]
Network failures: [paste if any]

Identify the root cause and provide a fix.
```

---

### 7. Write Component Tests

**Prompt template:**
```
Write [unit / integration] tests for the following [React / Vue] component.

[language]
[paste component]

Testing library: [React Testing Library / Vue Test Utils / Vitest / Jest]

Cover:
- Default render with required props
- Each interactive state (hover, focus, active, disabled)
- User interactions (click, type, submit)
- Edge cases: [empty list, long text, null prop]
- Accessibility queries (getByRole, getByLabelText)
```

---

## Advanced Techniques

### Core Web Vitals Audit

```
Audit the following [page / component] code for Core Web Vitals impact.

[paste component tree or page code]

Analyse:
- LCP: largest contentful paint — is the hero image/text render-blocking?
- CLS: cumulative layout shift — are dimensions reserved before content loads?
- INP: interaction to next paint — are event handlers synchronous and fast?
- FID / TBT: is the main thread blocked during load?

Provide specific code changes to improve each metric.
```

### Accessibility Audit

```
Audit the following [language] component for WCAG 2.2 AA accessibility issues.

[paste component code]

Check:
- Semantic HTML (headings, landmarks, lists)
- ARIA roles, labels, and descriptions
- Keyboard navigation (focus order, focus trap in modals, escape key)
- Colour contrast (flag any hard-coded colours)
- Screen reader announcements for dynamic content
- Image alt text
- Form label associations

For each issue: WCAG criterion, severity, and remediation code.
```

### Bundle Size Analysis

```
I'm importing the following dependencies in my frontend:

[paste import statements]

Identify:
1. Which imports are loading the entire library instead of tree-shaking
2. Which can be replaced with smaller alternatives
3. Which should be dynamically imported (code-split)

Rewrite the imports and any necessary component code to minimise bundle impact.
```

---

## Frontend Patterns Quick Reference

| Pattern | Use Case |
|---|---|
| Compound components | Shared state between parent and child components |
| Render props | Reusable logic with custom rendering |
| Custom hooks | Reusable stateful logic |
| Container / Presenter | Separate data fetching from rendering |
| Optimistic updates | Instant UI feedback before server confirms |
| Suspense + lazy | Code-split routes and heavy components |
| Portal | Render outside DOM hierarchy (modals, tooltips) |

---

## Frontend Checklist

- [ ] Component is accessible (keyboard, screen reader, ARIA)
- [ ] Form inputs have associated labels
- [ ] Interactive elements have visible focus indicators
- [ ] Colour contrast meets WCAG AA (4.5:1 text, 3:1 UI)
- [ ] Loading, empty, and error states handled
- [ ] No unnecessary re-renders (memoisation applied where needed)
- [ ] Tests cover user interactions, not implementation details
- [ ] Images have meaningful alt text
- [ ] No layout shift on content load
- [ ] Responsive across target breakpoints
