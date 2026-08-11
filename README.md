# Public Health Biostatistics HTML

已生成中英文两个完整版本的 public health biostatistics 入门学习模块，并提供双语入口页。

## 文件

- `biostatistics_bilingual.html`：中英双语入口页。
- `biostatistics_bilingual.Rmd`：中英双语入口页的 R Markdown 源文件。
- `biostatistics_foundations.html`：完整英文版单文件 HTML。
- `biostatistics_foundations_zh.html`：完整中文版单文件 HTML。
- `biostatistics_foundations.Rmd`：英文 R Markdown 源文件。
- `biostatistics_foundations_zh.Rmd`：中文 R Markdown 源文件。
- `styles.css`：页面样式与手机、打印适配。
- `render.R`：可重复渲染脚本。

## 重新渲染

在这个目录中运行：

```bash
Rscript render.R
```

当前项目已使用 `.Rlib` 作为本地 R package library。若依赖不存在，可运行：

```bash
mkdir -p .Rlib
Rscript -e 'install.packages(c("rmarkdown", "knitr"), lib = ".Rlib", repos = "https://cloud.r-project.org")'
```

文档中的全部数据均为固定随机种子生成的模拟数据，不包含真实个人健康信息。
