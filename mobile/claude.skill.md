# Skill: Mobile Development

Build, review, and optimise mobile applications — cross-platform (React Native, Flutter) and native (Swift, Kotlin) — covering UI, navigation, state, offline support, and app store delivery.

---

## Overview

Claude can write and review React Native, Flutter, Swift (UIKit / SwiftUI), and Kotlin (Jetpack Compose / Views) code, design mobile navigation patterns, implement offline-first data strategies, diagnose performance issues, and prepare apps for App Store and Google Play submission.

---

## Task Patterns

### 1. Build a Screen / View

**Prompt template:**
```
Build a [screen name] screen in [React Native / Flutter / SwiftUI / Jetpack Compose].

Requirements:
- Layout: [describe UI elements and hierarchy]
- Data source: [local state / API call / device storage]
- Navigation: [how users arrive and leave this screen]
- Edge cases: [loading state, empty state, error state]
- Platform conventions: follow [iOS / Android / both] design guidelines

[paste any wireframe description or existing code]
```

---

### 2. Implement Navigation

**Prompt template:**
```
Implement navigation for the following app structure using [React Navigation / Expo Router / Flutter Navigator 2 / UIKit / Jetpack Navigation].

Screens:
- [Screen A] → [Screen B] (on tap)
- [Screen C] → [Screen D] (with params: [describe])
- Tab bar: [Tab 1, Tab 2, Tab 3]
- Modal: [describe modal screens]

Requirements:
- Deep linking support for: [paths]
- Handle back button / swipe back correctly on [iOS / Android]
- Authentication guard: redirect to Login if not authenticated
```

---

### 3. Implement Offline Support

**Prompt template:**
```
Add offline support to the following [React Native / Flutter] feature.

Feature: [describe — e.g., "users can view and create notes"]
Current implementation: [describe how data is fetched/stored now]
Offline behaviour required:
- Read: [e.g., show cached data]
- Write: [e.g., queue mutations and sync on reconnect]

Use [AsyncStorage / SQLite / Realm / Hive / Core Data / Room].
Handle conflict resolution when: [describe conflict scenario].
```

---

### 4. Integrate a Device API

**Prompt template:**
```
Integrate [Camera / GPS / Push Notifications / Biometrics / Contacts / Bluetooth] into a [React Native / Flutter / SwiftUI / Kotlin] app.

Requirements:
- Request permissions correctly on [iOS / Android / both]
- Handle permission denied gracefully (show rationale, guide to settings)
- Handle the happy path: [describe]
- Handle errors: [device not supported, permission permanently denied, etc.]

[paste existing app structure if relevant]
```

---

### 5. Optimise App Performance

**Prompt template:**
```
Optimise the following [React Native / Flutter] code for performance.

[language]
[paste component / widget code]

Observed problem: [e.g., janky scroll, slow screen transitions, high memory usage, excessive re-renders]

Apply:
- List optimisation (FlatList config, ListView.builder, slivers)
- Memoisation and widget rebuild prevention
- Image optimisation and lazy loading
- Background thread offloading for heavy computation
- Bundle / asset size reduction

Explain each change and its impact.
```

---

### 6. Write Mobile Tests

**Prompt template:**
```
Write [unit / widget / integration] tests for the following [React Native / Flutter] code.

[language]
[paste component / widget]

Framework: [Jest + React Native Testing Library / Flutter test / Detox / Maestro]

Cover:
- Renders correctly with required props
- User interactions (tap, swipe, input)
- Async data loading states
- Platform-specific behaviour: [describe]
```

---

### 7. Prepare for App Store Submission

**Prompt template:**
```
I'm preparing [app name] for [App Store / Google Play] submission.

Current state:
- Platform: [iOS / Android / both]
- Framework: [React Native / Flutter / native]
- Known issues: [list]

Generate a submission checklist covering:
- App metadata (name, description, screenshots, keywords)
- Privacy manifest and data usage declarations
- Required permissions and usage strings
- Signing and provisioning (iOS) / keystore and signing (Android)
- Build configuration (release build, minification, ProGuard)
- Common rejection reasons to verify
```

---

## Advanced Techniques

### Performance Profiling Guidance

```
Guide me through profiling performance in my [React Native / Flutter] app.

Symptom: [e.g., list scroll drops below 60fps, app takes 4s to cold start]

Walk through:
1. Which profiling tool to use and how to set it up
2. What metrics to capture
3. How to interpret the flame chart / performance trace
4. Common root causes for this symptom
5. Fixes to try in priority order
```

### State Management Architecture

```
Design a state management architecture for the following [React Native / Flutter] app.

Features: [list main features and their data needs]
Team size: [N developers]
Scale: [number of screens, data sources]

Compare options:
- [e.g., Redux Toolkit / Zustand / Jotai for RN]
- [e.g., Bloc / Riverpod / Provider for Flutter]

Recommend one and show the folder structure, data flow diagram (text), and a concrete example for [feature].
```

### Push Notification Deep Dive

```
Implement a complete push notification system for [React Native / Flutter].

Requirements:
- FCM (Android) + APNs (iOS) via [Firebase / OneSignal / custom backend]
- Handle notification while app is [foreground / background / killed]
- Deep link to specific screen on notification tap
- Badge count management
- Notification categories with action buttons

Show: setup, permission request, token management, payload handling, and deep-link routing code.
```

---

## Mobile Platform Quick Reference

| Concern | iOS | Android |
|---|---|---|
| Navigation back | Swipe right | Back button / gesture |
| Tab bar | Bottom (UITabBar) | Bottom navigation |
| Typography | SF Pro / Dynamic Type | Roboto / sp units |
| Status bar | Light / dark content | Light / dark icons |
| Permissions | Request on first use | Request on first use |
| Background execution | Background modes limited | WorkManager / Services |
| Offline storage | Core Data / UserDefaults | Room / SharedPreferences |

---

## Mobile Checklist

- [ ] Permissions requested with usage rationale and denied state handled
- [ ] App works correctly offline or degrades gracefully
- [ ] Deep links and universal links configured and tested
- [ ] App tested on real device (not just simulator/emulator)
- [ ] Accessibility: Dynamic Type / font scaling, VoiceOver / TalkBack tested
- [ ] Memory leaks checked (Instruments / Android Profiler)
- [ ] Release build tested (debug vs release behaviour differs)
- [ ] Sensitive data not stored in unencrypted local storage
- [ ] Crash reporting integrated (Sentry, Firebase Crashlytics)
- [ ] App Store / Play Store metadata, screenshots, and privacy details complete
