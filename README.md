# Public Health Biostatistics HTML

已生成中英文两个完整版本的 public health biostatistics 入门学习模块，并提供双语入口页。

## 在线网站

访问 [The V Lab Public Health Biostatistics 网站](https://laboratoirev.github.io/Statistics_Study/) 选择英文版、中文版或双语课程概览。

## 文件

- `index.html`：The V Lab 网站首页。
- `biostatistics_bilingual.html`：中英双语入口页。
- `biostatistics_foundations.html`：完整英文版单文件 HTML。
- `biostatistics_foundations_zh.html`：完整中文版单文件 HTML。
- `includes/vlab-brand.html`：三个页面共用的 The V Lab 品牌组件。
- `og.png`：网站链接分享预览图。
- `.nojekyll`：让 GitHub Pages 原样发布静态文件。
- `styles.css`：页面样式与手机、打印适配。
- `render.R`：可重复渲染脚本。

## 重新渲染

三份 `.Rmd` 源文件仅保存在本地工作副本中，并通过 `.gitignore` 排除，不发布到 GitHub。生成的 HTML 会显示教学代码，但不再嵌入可下载的完整 Rmd 源文件。

在包含本地 Rmd 源文件的工作副本中运行：

```bash
Rscript render.R
```

当前项目已使用 `.Rlib` 作为本地 R package library。若依赖不存在，可运行：

```bash
mkdir -p .Rlib
Rscript -e 'install.packages(c("rmarkdown", "knitr"), lib = ".Rlib", repos = "https://cloud.r-project.org")'
```

文档中的全部数据均为固定随机种子生成的模拟数据，不包含真实个人健康信息。
