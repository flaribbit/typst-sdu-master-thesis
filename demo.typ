#import "template.typ": *
#show: project.with(
  学号: [200000000],
  标题: [基于Typst的毕业论文模板],
  title: [Graduation Thesis Template Based on Typst],
  日期: [2024年3月26日],
  作者姓名: [Typst],
  培养单位: [Typst],
  专业名称: [Typst],
  指导教师: [Typst],
  合作导师: [Typst],
  摘要: [#lorem(100)],
  关键词: ("Typst", "毕业论文" ,"模板"),
  abstract: [#lorem(100)],
  keywords: ("Typst", "Thesis", "Template"),
)

= 标题
#add-toc-en(level: 1)[Title]

== 标题
#add-toc-en(level: 2)[Title]

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
