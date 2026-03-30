# Skill: Performance Optimisation

Profile, diagnose, and systematically improve the performance of applications across CPU, memory, I/O, network, and database layers.

---

## Overview

Claude can analyse bottlenecks from profiling data, suggest algorithm improvements, design caching strategies, and review query plans. Use this skill to drive data-led performance improvements rather than premature optimisation.

---

## Task Patterns

### 1. Analyse a Performance Profile

**Prompt template:**
```
Analyse the following [CPU / memory / I/O] profile and identify the top bottlenecks.

Profile output:
[paste flamegraph description / profiler output / top functions by time]

Application context:
- Language/runtime: [e.g., Node.js, Python, JVM]
- Workload: [e.g., web requests, batch processing, stream processing]
- Current P99 latency: [value]
- Target P99 latency: [value]

For each bottleneck:
1. Root cause
2. Estimated impact if fixed
3. Recommended optimisation
```

---

### 2. Optimise an Algorithm

**Prompt template:**
```
The following [language] function is too slow for inputs of size [N].
Current time complexity: [O(?)]

[language]
[paste function]

Requirements:
- Reduce time complexity to [target, e.g., O(n log n)]
- Preserve correctness for all inputs
- Explain the algorithmic improvement

Provide: optimised implementation + complexity analysis.
```

---

### 3. Design a Caching Strategy

**Prompt template:**
```
Design a caching strategy for [feature / endpoint / computation].

Current behaviour: [describe what's slow and why]
Data characteristics:
- Read/write ratio: [e.g., 95% reads]
- Data freshness requirement: [e.g., 30-second staleness acceptable]
- Data size: [e.g., 1KB per item, 1M items total]

Options to consider: in-process cache, distributed cache (Redis/Memcached), CDN, HTTP caching headers.

Recommend the best approach and provide the implementation.
```

---

### 4. Optimise a Hot Database Query

**Prompt template:**
```
This query runs on every page load and takes [X]ms. Target is <[Y]ms.

```sql
[paste query]
```

Table statistics:
- Row count: [N]
- Key columns: [describe]

EXPLAIN ANALYZE output:
[paste]

Current indexes:
[paste]

Suggest: query rewrites, index changes, denormalisation, or caching.
```

---

### 5. Reduce Memory Usage

**Prompt template:**
```
This [language] process consumes too much memory. Target is <[N] MB.

Current peak usage: [N] MB
Observed growth pattern: [constant / gradual leak / spike on load]

Relevant code:
[language]
[paste memory-intensive code sections]

Identify: unnecessary allocations, retained references, large object graphs, or streaming opportunities.
```

---

### 6. Optimise Front-End / Web Performance

**Prompt template:**
```
Analyse and improve the performance of this web page / component.

Current metrics (Lighthouse / WebPageTest):
- LCP: [value]
- FID / INP: [value]
- CLS: [value]
- Total bundle size: [value]

Issues observed: [describe]

Relevant code: [paste HTML/CSS/JS or component code]

Suggest: bundle splitting, lazy loading, image optimisation, render-blocking resource elimination, or layout shift fixes.
```

---

### 7. Async and Concurrency Optimisation

**Prompt template:**
```
This [language] code processes tasks sequentially but could be parallelised.

[language]
[paste code]

Constraints:
- [e.g., max N concurrent operations to avoid rate limits]
- [e.g., results must be processed in order]
- [e.g., failures should not cancel the entire batch]

Rewrite it to use [async/await concurrency / thread pool / worker queue] appropriately.
```

---

## Advanced Techniques

### Capacity Planning

```
Perform a back-of-the-envelope capacity analysis for [service].

Current load:
- [N] requests/second
- Average response payload: [size]
- P99 latency: [value]
- CPU usage: [%]
- Memory usage: [GB]

Projected growth: [N]x over [time period]

Identify: when current infrastructure will be exhausted and what to scale first.
```

### Performance Budget

```
Define a performance budget for [application / feature].

Business requirements:
- [e.g., page loads in <2s on a 4G mobile connection]
- [e.g., API responds in <100ms at P99 under 1000 RPS]

Translate into technical constraints:
- Max bundle size
- Max image payload
- Max time-to-first-byte
- Max database query time

Define automated gates for CI/CD to enforce the budget.
```

### Benchmarking Setup

```
Design a microbenchmark in [language] to compare the performance of these two implementations:

Implementation A:
[language]
[paste]

Implementation B:
[language]
[paste]

Use [benchmarking framework, e.g., Benchmark.js, pytest-benchmark, JMH, criterion].
Control for: JIT warm-up, GC pauses, CPU frequency scaling, and statistical significance.
```

---

## Performance Optimisation Principles

| Principle | Why |
|---|---|
| Measure before optimising | Avoid optimising the wrong thing |
| Fix the biggest bottleneck first | Amdahl's law: small gains elsewhere won't matter |
| Cache reads, not writes | Caching mutations introduces consistency complexity |
| Prefer algorithmic improvements over micro-optimisations | O(n) → O(log n) beats any constant-factor tuning |
| Load test with production-like data | Synthetic data misses real-world distributions |
| Set a performance budget | Makes regressions visible before they reach production |

---

## Performance Optimisation Checklist

- [ ] Profiling data collected (not guesses)
- [ ] Bottleneck identified and root-caused
- [ ] Algorithmic complexity reviewed
- [ ] Database queries analysed with EXPLAIN
- [ ] N+1 query patterns eliminated
- [ ] Caching strategy applied where appropriate
- [ ] Async / parallel execution used where safe
- [ ] Memory allocations reviewed for hot paths
- [ ] Load test confirms improvement under realistic load
- [ ] Performance regression test added to CI
