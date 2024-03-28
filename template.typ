// font names
#let 宋体 = ("Times New Roman", "SimSun")
#let 黑体 = ("Times New Roman", "SimHei")
#let 字号 = (
  初号: 42pt, 小初: 36pt, 一号: 26pt, 小一: 24pt, 二号: 22pt, 小二: 18pt,
  三号: 16pt, 小三: 15pt, 四号: 14pt, 小四: 12pt, 五号: 10.5pt, 小五: 9pt,
)
// helper function to format number
#let format-num(..nums)=nums.pos().map(str).join("-")
// define custom figure function
#let figure2(body, caption: none, caption-en: none)={
  set text(size: 字号.五号)
  counter("figure2").step(level: 2)
  figure(body)
  let num = counter("figure2").display(format-num)
  if caption!=none {
    block[#h(1fr)图#num #caption#h(1fr)]
  }
  if caption-en!=none{
    block[#h(1fr)Fig. #num #caption-en#h(1fr)]
  }
}
// define custom table function
#let table2(body, caption: none, caption-en: none)={
  set text(size: 字号.五号)
  counter("table2").step(level: 2)
  let num = counter("table2").display(format-num)
  if caption!=none {
    block[#h(1fr)表#num #caption#h(1fr)]
  }
  if caption-en!=none{
    block[#h(1fr)Tab. #num #caption-en#h(1fr)]
  }
  figure(body)
}
// helper functions
#let placeholder(len)=[#for i in range(len){"文本"}]
#let indent()=h(2em)
#let underline-box(width, body: []) = box(body, width: width, stroke: (bottom: 0.5pt), outset: (bottom: 4pt))
#let add-toc-en(body, level: 1, numbering: true)=context metadata((type: "toc-en", level: level, body: body, numbering: numbering, pagestyle: page.numbering))

// 封面页
#let project(
  分类号: [],
  密级: [],
  学号: [],
  标题: [],
  title: [],
  日期: [2024年3月1日],
  作者姓名: [],
  培养单位: [],
  专业名称: [],
  指导教师: [],
  合作导师: [],
  摘要: [],
  关键词: (),
  abstract: [],
  keywords: (),
  body
)={
// 中文粗体设置
import "@preview/cuti:0.2.0": show-cn-fakebold
show: show-cn-fakebold
// font, paragraph, page settings
set text(size: 字号.小四, font: 宋体)
set par(justify: true, leading: 1em, first-line-indent: 2em)
set block(above: 1em)
set page(paper: "a4", margin: (top: 2.8cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm))
// #set block(above: 16pt)
// numbering settings
set heading(numbering: "1.1")
set math.equation(numbering: "1")
show heading.where(level: 1): it => {
  set text(size: 字号.小三, font: 黑体)
  set block(above: 24pt, below: 18pt)
  if it.numbering==none {
    align(center, it.body)
    return
  }
  counter(math.equation).update(0)
  counter("figure2").step()
  counter("table2").step()
  align(center, box(it))
}
show heading.where(level: 2): it => {
  set text(size: 字号.四号, font: 黑体)
  set block(above: 24pt, below: 6pt)
  par(first-line-indent: 0pt, box(it))
}
show heading.where(level: 3): it => {
  set text(size: 字号.小四, font: 黑体)
  par(first-line-indent: 0pt, box(it))
}
// override default reference format
show ref: it => {
  if it.element == none { return it }
  if it.element.func()==math.equation{
    let loc = it.element.location()
    let chap = counter(heading.where(level: 1)).at(loc).first()
    let num = counter(math.equation).at(loc).first()
    return [公式#chap\-#num]
  }
  let el = it.element.child.children.first()
  if el.has("key") {
    if el.key == "figure2"{
      let num = counter("figure2").at(it.element.location())
      // update num manually
      if num.len()==1 { num.push(1) } else { num.at(1) += 1 }
      return [图#format-num(..num)]
    } else if el.key == "table2"{
      let num = counter("table2").at(it.element.location())
      // update num manually
      if num.len()==1 { num.push(1) } else { num.at(1) += 1 }
      return [表#format-num(..num)]
    }
  }
  return it
}
// override default numbering for equation with (1-1) format
set math.equation(numbering: num=>{
  let chap = counter(heading.where(level:1)).get().first()
  [(#chap\-#num)]
})


// 封面页
{
  set text(size: 字号.四号, weight: "bold")
  set par(first-line-indent: 0pt)
  par[分类号：#分类号#h(1fr)单位代码：#box(width: 4em)[10422]]
  par[密#h(1em)级：#密级#h(1fr)学#h(2em)号：#box(width: 4em, 学号)]
  v(20pt)
  align(center, image("assets/sdu.png"))
  {
    set text(size: 字号.小二)
    place(dy: 1em, box(width: 100%, align(center, {
      标题
      parbreak()
      title
    })))
    par[论文题目：]
  }
  v(4.4cm)
  {
    set align(center)
    set block(above: 1.6em)
    [作　者　姓　名 ];underline-box(11em, body: 作者姓名);parbreak()
    [培　养　单　位 ];underline-box(11em, body: 培养单位);parbreak()
    [专　业　名　称 ];underline-box(11em, body: 专业名称);parbreak()
    [指　导　教　师 ];underline-box(11em, body: 指导教师);parbreak()
    [合　作　导　师 ];underline-box(11em, body: 合作导师);parbreak()
    v(1.3cm)
    text(size: 字号.小二, 日期)
  }
}
pagebreak()
pagebreak()

// 声明页
{
  set text(size: 字号.四号)
  set par(leading: 1.5em)
  set block(above: 1.5em)
  align(center, text(size: 字号.三号, weight: "bold")[原 创 性 声 明])
  par[本人郑重声明：所呈交的学位论文，是本人在导师的指导下，独立进行研究所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的科研成果。对本文的研究作出重要贡献的个人和集体，均已在文中以明确方式标明。本声明的法律责任由本人承担。]
  v(2em)
  par(first-line-indent: 0pt)[论文作者签名：#underline-box(6em)#h(4em)日  期：#underline-box(8em)]
  v(4em)
  align(center, text(size: 字号.三号, weight: "bold")[关于学位论文使用授权的声明])
  par[本人同意学校保留或向国家有关部门或机构送交论文的印刷件和电子版，允许论文被查阅和借阅；本人授权山东大学可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或其他复制手段保存论文和汇编本学位论文。]
  par[(保密论文在解密后应遵守此规定)]
  v(2em)
  par(first-line-indent: 0pt)[论文作者签名：#underline-box(5em) 导师签名：#underline-box(5em) 日  期：#underline-box(6em)]
}
pagebreak()

// 中文摘要页
set text(size: 字号.小四)
set page(numbering: "I", header: {
  set block(above: 6pt)
  set text(size: 字号.五号)
  align(center)[山东大学硕士学位论文]
  line(length: 100%, stroke: 0.5pt)
})
counter(page).update(1)
heading(level: 1, numbering: none)[摘#h(2em)要]
add-toc-en(level: 1, numbering: none)[Chinese Abstract]
摘要
par(first-line-indent: 0pt)[*关键词：*#关键词.join("；")]
pagebreak()

// 英文摘要页
heading(level: 1, numbering: none)[Abstract]
add-toc-en(level: 1, numbering: none)[English Abstract]
abstract
par(first-line-indent: 0pt)[*Keywords:* #keywords.join("; ")]
pagebreak()

// 中文目录页
{
  set par(first-line-indent: 0pt)
  heading(level: 1, numbering: none, outlined: false)[目#h(2em)录]
  outline(indent: true, title: none)
}
pagebreak()

// 英文目录页
context{
  set par(first-line-indent: 0pt)
  heading(level: 1, numbering: none, outlined: false)[CONTENTS]
  let elems=query(metadata)
  for e in elems {
    let v=e.value
    if v.type=="toc-en" {
      let loc = e.location()
      let page = numbering(v.pagestyle, ..counter(page).at(loc))
      h(1em*(v.level -1))
      if v.numbering!=none {
        numbering("1.1 ", ..counter(heading).at(loc))
      }
      [#v.body#box(width:1fr,repeat[.])#page]
      parbreak()
    }
  }
}

// 内容开始
set page(numbering: "1")
counter(page).update(1)
pagebreak()
body
}
