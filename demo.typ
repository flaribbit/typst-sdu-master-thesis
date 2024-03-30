#import "template.typ": *
#show: project.with(
  分类号: [XXXXX.X],
  密级: [公开],
  学号: [200000000],
  标题: [基于Typst的毕业论文模板],
  title: [Graduation Thesis Template Based on Typst],
  日期: [2024年3月26日],
  作者姓名: [Typst],
  培养单位: [Typst],
  专业名称: [Typst],
  指导教师: [Typst],
  合作导师: [Typst],
  摘要: [Typst 是一门面向出版与学术写作的可编程标记语言。它于 2023 年 4 月正式开源，从 0.1.0 版本到现在的 0.9.0 版本，已经成熟稳定许多。Typst 提供了更好的中文与 CJK 语言支持，能够满足复杂的排版需求。相较于传统的 LaTeX 和简单的 Markdown，Typst 在使用体验上更加简单，无需引入大量宏包，语法也更加简洁。它支持自动处理中英文之间的空格、中文标点压缩，以及英文 kerning、alternates 和 ligatures。Typst 还内置了脚注、参考文献、数学公式字体更换等功能。你可以通过 Typst CLI 命令行工具或在 VS Code 中使用 Typst 插件来编辑，而且 Typst 的包管理器能够按需自动下载所需资源，保持安装简洁。未来，Typst有望与Web更紧密结合，成为出版领域的一股新势力。],
  关键词: ("Typst", "毕业论文" ,"模板"),
  abstract: [Typst is a programmable markup language designed for publishing and academic writing. It was officially open-sourced in April 2023 and has matured significantly from version 0.1.0 to the current 0.9.0 release. Typst provides enhanced support for Chinese and CJK languages, catering to complex typesetting requirements. Compared to traditional LaTeX and simple Markdown, Typst offers a more straightforward user experience, eliminating the need for extensive macro packages, and its syntax is concise. It automatically handles spacing between Chinese and English, compresses Chinese punctuation, and supports English kerning, alternates, and ligatures. Typst also includes built-in features like footnotes, bibliography management, and font customization for mathematical formulas. You can edit documents using the Typst CLI command-line tool or the Typst extension in Visual Studio Code. Its package manager ensures minimal installation complexity by automatically downloading necessary resources. In the future, Typst aims to integrate more closely with the web and become a powerful force in the publishing domain.],
  keywords: ("Typst", "Thesis", "Template"),
)

= 标题
#add-toc-en(level: 1)[Title]

== 标题
#add-toc-en(level: 2)[Title]

引用参考文献@Crichton2024。

#placeholder(40)

#placeholder(40)

#figure2(rect[Hello], caption: [这是一张图片], caption-en: [This is a figure])<fig1>

#placeholder(60)

== 标题
#add-toc-en(level: 2)[Title]

#placeholder(30)

=== 标题
#add-toc-en(level: 3)[Title]

#placeholder(80)

#figure2(rect[Hello], caption: [这是一张图片], caption-en: [This is a figure])<fig2>

#placeholder(60)

$ f(x)=e^x sin(x) $<eq1>

#placeholder(20)

$ f(x)=e^x sin(x) $<eq2>

= 标题
#add-toc-en(level: 1)[Title]

#figure2(rect[Hello], caption: [这是一张图片], caption-en: [This is a figure])<fig3>

#figure2(rect[Hello], caption: [这是一张图片], caption-en: [This is a figure])<fig4>

#table2(rect[Hello], caption: [这是一张表格], caption-en: [This is a table])<tab1>

@fig1 @fig2 @eq1 @eq2 @tab1

#pagebreak()
#add-toc-en(level: 1, numbered: false)[Reference]
#bibliography("ref.bib")
