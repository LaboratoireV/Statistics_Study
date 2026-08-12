# The V Lab Learning & Project Hub

LaboratoireV GitHub 账号的综合学习与项目门户，同时保留完整的双语生物统计课程。首页集中索引账号 7 个公开仓库中的 50 个独立 HTML 文件，并连接流行病学、数据可视化、R Markdown、合成健康数据项目、Snowflake 教程，以及 Alberta Health Data Atlas 互动网站。

## 在线网站

访问 [The V Lab Learning & Project Hub](https://laboratoirev.github.io/Statistics_Study/) 浏览账号项目、搜索全部 HTML，或继续使用生物统计推荐学习路线。

## 账号级目录

目录于 2026-08-12 对 7 个公开仓库完成核验：

- 50 个独立 HTML 文件，其中 48 个已通过 GitHub Pages 公开访问；
- 2 个 `SNOWFLAKE_Skills` HTML 仍为公开源码，因该仓库尚未启用 Pages 而明确标为 source-only；
- 8 个 `includes/` 页眉/页脚构建片段不计入独立页面；
- `HealthcareData_Knowledge` 没有仓库 HTML，但其 Alberta Health Data Atlas 作为独立互动应用纳入门户；
- 首页目录为静态 HTML，搜索和筛选仅在浏览器本地执行，不调用 GitHub API，也不收集用户输入。

## 文件

- `index.html`：账号项目总览、50 个 HTML 的搜索目录，以及生物统计推荐学习路线和课程入口。
- `biostatistics_bilingual.html`：统计基础的中英双语概览。
- `biostatistics_foundations.html` / `biostatistics_foundations_zh.html`：生物统计基础。
- `medical_statistical_tests_en.html` / `medical_statistical_tests.html`：医学研究常用统计检验。
- `linear_regression_en.html` / `linear_regression.html`：线性回归。
- `logistic_regression_en.html` / `logistic_regression.html`：逻辑回归。
- `design_of_experiments_en.html` / `design_of_experiments.html`：随机化、区组、析因设计、随机化推断与功效。
- `clinical_trials_en.html` / `clinical_trials.html`：临床试验设计、estimand、常用结局模型、缺失数据与报告。
- `poisson_zero_inflated_models_en.html` / `poisson_zero_inflated_models.html`：Poisson、负二项与零膨胀计数模型。
- `multilevel_modelling_en.html` / `multilevel_modelling.html`：聚类与纵向数据的多层模型、方差分解、部分汇聚、LMM 与 GLMM。
- `longitudinal_data_analysis_en.html` / `longitudinal_data_analysis.html`：重复测量、协方差结构、边际模型与混合效应轨迹。
- `causal_inference_en.html` / `causal_inference.html`：因果推断。
- `propensity_score_matching_en.html` / `propensity_score_matching.html`：倾向评分匹配的设计、诊断与效应估计。
- `survival_analysis_en.html` / `survival_analysis.html`：生存分析基础、复杂事件过程与完整应用流程。
- `aft_cox_models_en.html` / `aft_cox_models.html`：AFT 与 Cox PH 生存模型。
- `meta_analysis_en.html` / `meta_analysis.html`：医学与心理学中的效应量、异质性、森林图与敏感性分析。
- `includes/vlab-brand.html`：学习页面共用的 The V Lab 品牌组件。
- `og-learning-hub.png`：学习网站的社交分享预览图。
- `og.png`：原统计基础模块的分享预览图，供旧链接兼容使用。
- `.nojekyll`：让 GitHub Pages 原样发布静态文件。
- `styles.css`：页面样式与手机、打印适配。
- `render.R`：自动发现项目根目录中的全部 Rmd 并生成同名 HTML。

## 重新渲染

`.Rmd` 源文件仅保存在本地工作副本中，并通过 `.gitignore` 排除，不发布到 GitHub。生成的 HTML 会显示教学代码，但不再嵌入可下载的完整 Rmd 源文件。

在包含本地 Rmd 源文件的工作副本中运行：

```bash
Rscript render.R
```

当前项目已使用 `.Rlib` 作为本地 R package library。若依赖不存在，可运行：

```bash
mkdir -p .Rlib
Rscript -e 'install.packages(c("rmarkdown", "knitr", "survival", "nlme", "MatchIt", "lme4"), lib = ".Rlib", repos = "https://cloud.r-project.org")'
```

文档中的全部数据均为固定随机种子生成的模拟数据，不包含真实个人健康信息。
