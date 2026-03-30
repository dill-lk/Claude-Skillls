# Skill: Accessibility

Build and audit accessible software — following WCAG guidelines, testing with assistive technologies, and making digital products usable by everyone.

---

## Overview

Claude can audit code for WCAG 2.2 AA/AAA violations, write accessible components (modals, menus, forms, tables, carousels), generate ARIA patterns, advise on colour contrast, and produce remediation reports with code examples. Use this skill to bake accessibility in from the start and to fix existing issues.

---

## Task Patterns

### 1. Accessibility Audit

**Prompt template:**
```
Audit the following [HTML / React / Vue / Angular] code for WCAG 2.2 AA accessibility issues.

[language]
[paste code]

Check:
- Perceivable: alt text, captions, colour contrast, text resize
- Operable: keyboard access, focus management, no seizure triggers, skip links
- Understandable: labels, error messages, consistent navigation
- Robust: valid HTML, ARIA used correctly, works with screen readers

For each issue:
- WCAG criterion (e.g., 1.1.1 Non-text Content — Level A)
- Severity (Blocker / Critical / Major / Minor)
- Affected element / line
- Remediation with corrected code
```

---

### 2. Make a Component Keyboard Accessible

**Prompt template:**
```
Make the following [component type, e.g., dropdown menu / accordion / tab panel / modal / date picker] fully keyboard accessible.

[language]
[paste component code]

Implement:
- Correct ARIA role, states, and properties
- Full keyboard interaction pattern (as per APG: https://www.w3.org/WAI/ARIA/apg/)
- Focus management (where focus goes on open/close)
- Escape key closes / cancels
- Arrow key navigation where appropriate
- Screen reader announcements for state changes
```

---

### 3. Fix Form Accessibility

**Prompt template:**
```
Fix the accessibility of the following form.

[language]
[paste form code]

Ensure:
- Every input has an associated <label> (not placeholder-only)
- Required fields marked visibly and with aria-required
- Error messages linked to inputs via aria-describedby
- Errors announced to screen readers on validation failure
- Fieldsets and legends used for grouped inputs (radio, checkbox groups)
- Autocomplete attributes set correctly
- No colour-only indicators
```

---

### 4. Write an Accessible Modal / Dialog

**Prompt template:**
```
Write an accessible modal dialog in [React / Vue / vanilla JS / HTML].

Requirements:
- role="dialog", aria-modal="true", aria-labelledby pointing to title
- Focus trapped inside modal while open
- Focus returns to trigger element on close
- Escape key closes the modal
- Screen reader reads dialog title on open
- Backdrop click closes modal (optional, configurable)
- No scroll on background content while modal is open
```

---

### 5. Colour Contrast Audit

**Prompt template:**
```
Audit the following colour palette / CSS for WCAG colour contrast compliance.

[paste CSS variables, colour tokens, or hex values with context of use]

For each colour combination:
1. Foreground / background colours
2. Computed contrast ratio
3. WCAG AA pass/fail (4.5:1 for text, 3:1 for large text and UI components)
4. WCAG AAA pass/fail (7:1 for text)
5. Suggested accessible alternative if failing
```

---

### 6. Make a Table Accessible

**Prompt template:**
```
Make the following HTML table fully accessible.

[paste table HTML]

Apply:
- <caption> describing the table's purpose
- <th> with scope="col" or scope="row"
- <thead>, <tbody>, <tfoot> used correctly
- aria-sort on sortable columns
- Summary for complex tables (if applicable)
- Responsive strategy: [horizontal scroll with tabindex / card layout on mobile]
```

---

### 7. Accessibility Testing Checklist

**Prompt template:**
```
Generate a manual accessibility testing checklist for [feature name].

Feature: [describe the UI and user flows]
Target WCAG level: [AA / AAA]
Platforms: [Web / iOS / Android]

Include tests for:
- Keyboard-only navigation
- Screen reader (NVDA/JAWS on Windows, VoiceOver on Mac/iOS, TalkBack on Android)
- 200% and 400% browser zoom
- Windows High Contrast mode
- Reduced motion preferences
- Touch target size (≥ 44×44px)
```

---

## Advanced Techniques

### Live Region and Dynamic Content

```
The following [React / Vue] component updates dynamically (e.g., loading results, form validation, toast notifications).

[language]
[paste component]

Add appropriate ARIA live regions:
- aria-live="polite" for non-urgent updates
- aria-live="assertive" for urgent alerts
- role="status" or role="alert" where appropriate
- Ensure screen readers announce changes without being disruptive

Show before/after and explain when each live region type should be used.
```

### Skip Navigation and Landmark Architecture

```
Review and improve the landmark / navigation architecture of the following page layout.

[paste page HTML skeleton]

Ensure:
- Single <main> landmark
- <nav> landmarks labelled if multiple (aria-label)
- <header>, <footer>, <aside> used semantically
- Skip link at top: "Skip to main content" (visible on focus)
- Heading hierarchy is logical (h1 → h2 → h3, no skips)
- Focus order matches visual reading order
```

### Accessible SVG and Icons

```
Make the following [inline SVG icon / icon font usage / SVG chart] accessible.

[paste SVG or icon usage code]

Apply the correct pattern based on use case:
- Decorative (hidden from AT): aria-hidden="true"
- Informative (standalone meaning): role="img" + aria-label
- Functional (button/link icon): accessible label on the control, icon aria-hidden
- Complex chart: <title>, <desc>, and a linked table fallback
```

---

## WCAG 2.2 Quick Reference (AA)

| Criterion | Level | Rule |
|---|---|---|
| 1.1.1 Non-text Content | A | All images have alt text |
| 1.3.1 Info and Relationships | A | Structure conveyed programmatically |
| 1.3.5 Identify Input Purpose | AA | Autocomplete attributes on personal data inputs |
| 1.4.3 Contrast (Minimum) | AA | 4.5:1 for text, 3:1 for large text |
| 1.4.4 Resize Text | AA | Text resizable to 200% without loss of content |
| 1.4.11 Non-text Contrast | AA | 3:1 for UI components and focus indicators |
| 1.4.12 Text Spacing | AA | No loss of content when spacing is increased |
| 2.1.1 Keyboard | A | All functionality operable via keyboard |
| 2.4.3 Focus Order | A | Focus order is logical |
| 2.4.7 Focus Visible | AA | Keyboard focus indicator visible |
| 2.4.11 Focus Appearance | AA | Focus indicator meets minimum size and contrast |
| 3.3.1 Error Identification | A | Errors described in text |
| 3.3.2 Labels or Instructions | A | Inputs have labels |
| 4.1.2 Name, Role, Value | A | UI components have name/role/value |
| 4.1.3 Status Messages | AA | Status messages announced without focus |

---

## Accessibility Checklist

- [ ] All images have meaningful alt text (or alt="" if decorative)
- [ ] All form inputs have associated labels
- [ ] Colour is not the sole indicator of any information
- [ ] Colour contrast meets WCAG AA (4.5:1 text, 3:1 UI/large text)
- [ ] All functionality operable by keyboard alone
- [ ] Focus indicator visible on all interactive elements
- [ ] Focus order matches visual reading order
- [ ] ARIA roles, states, and properties used correctly
- [ ] Dynamic content changes announced via live regions
- [ ] Modal dialogs trap focus and return focus on close
- [ ] Page has a logical heading hierarchy (h1 → h2 → h3)
- [ ] Skip navigation link present
- [ ] Tested with keyboard navigation end-to-end
- [ ] Tested with screen reader (VoiceOver / NVDA / TalkBack)
- [ ] No content flashes more than 3 times per second
