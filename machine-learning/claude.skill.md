# Skill: Machine Learning

Design, implement, train, evaluate, and deploy machine learning models — from classical algorithms to deep learning — with a focus on practical, production-ready code.

---

## Overview

Claude can help with the full ML lifecycle: problem framing, dataset preparation, feature engineering, model selection, hyperparameter tuning, evaluation, interpretability, and deployment. Supports Python (scikit-learn, PyTorch, TensorFlow/Keras, HuggingFace, XGBoost) and MLOps tooling (MLflow, DVC, BentoML, SageMaker).

---

## Task Patterns

### 1. Frame an ML Problem

**Prompt template:**
```
Help me frame the following business problem as an ML task.

Business problem: [describe in plain language]
Available data: [describe tables/files, rows, relevant columns, time range]
Success metric (business): [e.g., reduce customer churn by 15%]

Determine:
1. ML task type (classification / regression / ranking / clustering / anomaly detection)
2. Target variable definition
3. Evaluation metric(s) and why they match the business goal
4. Baseline to beat (heuristic or naive model)
5. Key risks: data leakage, concept drift, feedback loops
```

---

### 2. Build a Training Pipeline

**Prompt template:**
```
Write a [scikit-learn / PyTorch / Keras / XGBoost] training pipeline for:

Task: [classification / regression / etc.]
Target: [column name]
Features: [list or describe]

Data: [paste schema or sample]

Pipeline should:
1. Split into train / validation / test (stratified if classification)
2. Preprocess: impute, encode, scale (use Pipeline/ColumnTransformer)
3. Train [model name or "suggest best model for this task"]
4. Evaluate on validation set: [metrics]
5. Log experiment with [MLflow / Weights & Biases / print]
6. Save the trained model artefact
```

---

### 3. Tune Hyperparameters

**Prompt template:**
```
Tune the hyperparameters of the following [model] using [GridSearchCV / RandomizedSearchCV / Optuna / Ray Tune].

Model code:
[language]
[paste model definition]

Search space:
- [parameter]: [range or choices]
- [parameter]: [range or choices]

Objective: maximise [metric] on validation set.
Budget: [N trials / time limit].

Return: best params, best score, and a visualisation of the search results.
```

---

### 4. Evaluate a Model

**Prompt template:**
```
Evaluate the following [classification / regression] model thoroughly.

[language]
[paste model evaluation code or predictions arrays]

For [classification]: confusion matrix, precision, recall, F1, ROC-AUC, PR-AUC, calibration curve.
For [regression]: MAE, RMSE, R², residual plot, prediction vs actual plot.

Also:
- Evaluate by subgroup: [demographic / category column]
- Identify failure modes: where does the model perform worst?
- Compare to baseline: [describe baseline]
```

---

### 5. Add Model Explainability

**Prompt template:**
```
Add explainability to the following trained [model type] model.

[language]
[paste model loading / prediction code]

Use [SHAP / LIME / Integrated Gradients / attention weights].

Produce:
1. Global feature importance (bar plot)
2. SHAP summary plot (beeswarm)
3. Local explanation for a specific prediction: [sample input]
4. Identify top 3 features driving predictions
```

---

### 6. Serve a Model as an API

**Prompt template:**
```
Wrap the following trained [sklearn / PyTorch / Keras] model in a [FastAPI / Flask / BentoML] REST API.

Model: [describe input features and output]
Endpoint: POST /predict
Input schema: [JSON with field names and types]
Output schema: [prediction + confidence / probabilities]

Requirements:
- Input validation with descriptive errors
- Model loaded once at startup (not per request)
- Structured logging of each prediction
- /health endpoint for readiness probe
- Docker-ready (include Dockerfile)
```

---

### 7. Handle Class Imbalance

**Prompt template:**
```
My binary classification dataset is heavily imbalanced:
- Positive class: [N] samples ([X]%)
- Negative class: [N] samples ([Y]%)

[language]
[paste current model/pipeline code]

Apply and compare:
1. Class weights
2. SMOTE / ADASYN oversampling
3. Undersampling
4. Threshold tuning

Evaluate each using PR-AUC (not accuracy). Recommend the best approach for this case.
```

---

## Advanced Techniques

### Fine-Tune a Pre-Trained Model

```
Fine-tune [BERT / GPT-2 / ResNet-50 / any HuggingFace model] for [task].

Task: [text classification / named entity recognition / image classification / etc.]
Dataset: [describe: N samples, classes]
[paste sample data]

Provide:
1. Data preprocessing and tokenisation
2. Model definition with classification head
3. Training loop with gradient accumulation, mixed precision, and early stopping
4. Evaluation on validation set
5. Saving the fine-tuned model for inference
```

### Detect and Mitigate Data Leakage

```
Review the following ML pipeline for data leakage:

[language]
[paste pipeline / preprocessing code]

Check for:
- Preprocessing fitted on full dataset before split
- Future information in features (target encoding, time-series look-ahead)
- ID or proxy columns that encode the target
- Test set used for model selection decisions

Flag each leak, explain the contamination, and rewrite the pipeline to eliminate it.
```

### Concept Drift Monitoring

```
Design a concept drift monitoring system for a model serving [task description].

Model: [type, features, output]
Serving environment: [batch scoring daily / real-time API]

Design:
1. Input feature drift detection (PSI, KS test, evidently AI)
2. Output distribution monitoring
3. Label drift (if labels available with delay)
4. Alerting thresholds and escalation
5. Retraining trigger strategy
```

---

## ML Evaluation Metric Quick Reference

| Task | Primary Metric | Secondary |
|---|---|---|
| Binary classification (balanced) | ROC-AUC | F1 |
| Binary classification (imbalanced) | PR-AUC | Recall at fixed precision |
| Multi-class classification | Macro F1 | Confusion matrix |
| Regression | RMSE | MAE, R² |
| Ranking | NDCG | MAP |
| Anomaly detection | F1 at threshold | PR curve |
| Generative (text) | BLEU / ROUGE | Human eval |

---

## Machine Learning Checklist

- [ ] Target variable and success metric aligned with business goal
- [ ] Data leakage checked in preprocessing pipeline
- [ ] Train / validation / test split done before any preprocessing
- [ ] Baseline model defined and measured
- [ ] Evaluation metrics appropriate for class balance and business cost
- [ ] Model evaluated by subgroup (bias / fairness check)
- [ ] Hyperparameter tuning performed and logged
- [ ] Model artefact versioned and reproducible (seed set)
- [ ] Explainability analysis completed
- [ ] Deployment environment tested (latency, memory usage)
- [ ] Monitoring and drift detection in place
