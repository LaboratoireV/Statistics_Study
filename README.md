# The V Lab Biostatistics Learning Hub

一个面向公共卫生、医学、流行病学与数据科学学习者的双语生物统计学习网站。课程从统计基础与常用检验出发，逐步进入线性回归、逻辑回归、因果推断与生存分析；全部示例均提供可复现的 R 代码。

## 在线网站

访问 [The V Lab Biostatistics Learning Hub](https://laboratoirev.github.io/Statistics_Study/) 查看完整学习路线，并选择英文版、中文版或双语基础概览。

## 文件

- `index.html`：课程总览、推荐学习路线和全部课程入口。
- `biostatistics_bilingual.html`：统计基础的中英双语概览。
- `biostatistics_foundations.html` / `biostatistics_foundations_zh.html`：生物统计基础。
- `medical_statistical_tests_en.html` / `medical_statistical_tests.html`：医学研究常用统计检验。
- `linear_regression_en.html` / `linear_regression.html`：线性回归。
- `logistic_regression_en.html` / `logistic_regression.html`：逻辑回归。
- `causal_inference_en.html` / `causal_inference.html`：因果推断。
- `propensity_score_matching_en.html` / `propensity_score_matching.html`：倾向评分匹配的设计、诊断与效应估计。
- `survival_analysis_en.html` / `survival_analysis.html`：生存分析基础、复杂事件过程与完整应用流程。
- `aft_cox_models_en.html` / `aft_cox_models.html`：AFT 与 Cox PH 生存模型。
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
Rscript -e 'install.packages(c("rmarkdown", "knitr", "survival", "MatchIt"), lib = ".Rlib", repos = "https://cloud.r-project.org")'
```

文档中的全部数据均为固定随机种子生成的模拟数据，不包含真实个人健康信息。
