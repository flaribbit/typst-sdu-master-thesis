// font names
#let songti = ("Times New Roman", "Source Han Serif SC", "Noto Serif", "Simsun")
#let heiti = ("Times New Roman", "Source Han Sans", "Noto Sans", "SimHei")
// font, paragraph, page settings
#set text(size: 12pt, font: songti)
#set par(justify: true, leading: 1.3em, first-line-indent: 2em)
#set page(paper: "a4", margin: (top: 2.8cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm))
#set block(above: 16pt)
// numbering settings
#set heading(numbering: "1.1")
#set math.equation(numbering: "1")
#show heading.where(level: 1): it => {
  set text(size: 15pt)
  if it.numbering==none { return align(center, it.body) }
  counter(math.equation).update(0)
  counter("figure2").step()
  counter("table2").step()
  align(center, box(it))
}
#show heading.where(level: 2): it => {
  set text(size: 14pt)
  par(first-line-indent: 0pt, box(it))
}
#show heading.where(level: 3): it => {
  set text(size: 13pt)
  par(first-line-indent: 0pt, box(it))
}
// helper function to format number
#let format-num(..nums)=nums.pos().map(str).join("-")
// override default reference format
#show ref: it => {
  if it.element == none { return it }
  if it.element.func()==math.equation{
    let loc = it.element.location()
    let chap = counter(heading.where(level: 1)).at(loc).first()
    let num = counter(math.equation).at(loc).first()
    return [公式#chap\-#num]
  }
  let el = it.element.children.at(0)
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
#set math.equation(numbering: num=>{
  let chap = counter(heading.where(level:1)).get().first()
  [(#chap\-#num)]
})
// define custom figure function
#let figure2(body, caption: none, caption-en: none)={
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
#let placeholder(len)=for i in range(len){"文本"}
#let indent()=h(2em)
#let underline-box(width) = box(width: width, stroke: (bottom: 0.5pt), outset: (bottom: 2pt))
#let h1(body) = {
  v(24pt)
  heading(body, level: 1, numbering: none)
  v(18pt)
}

#set text(size: 14pt)
#align(center, text(size: 16pt, weight: "bold")[原 创 性 声 明])

本人郑重声明：所呈交的学位论文，是本人在导师的指导下，独立进行研究所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的科研成果。对本文的研究作出重要贡献的个人和集体，均已在文中以明确方式标明。本声明的法律责任由本人承担。

#v(2em)
#par(first-line-indent: 0pt)[论文作者签名：#underline-box(6em)#h(4em)日  期：#underline-box(8em)]


#v(4em)
#align(center, text(size: 16pt, weight: "bold")[关于学位论文使用授权的声明])

本人同意学校保留或向国家有关部门或机构送交论文的印刷件和电子版，允许论文被查阅和借阅；本人授权山东大学可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或其他复制手段保存论文和汇编本学位论文。

(保密论文在解密后应遵守此规定)

#v(2em)
#par(first-line-indent: 0pt)[论文作者签名：#underline-box(5em) 导师签名：#underline-box(5em) 日  期：#underline-box(6em)]

#pagebreak()

#set text(size: 12pt)
#h1[摘#h(2em)要]

#lorem(100)

#par(first-line-indent: 0pt)[*关键词：*关键词1；关键词2；关键词3；关键词4]

#pagebreak()

#h1[Abstract]

#lorem(100)

#par(first-line-indent: 0pt)[*Keywords:* keyword1; keyword2; keyword3; keyword4]

#pagebreak()

#{
  set par(first-line-indent: 0pt)
  heading(level: 1, numbering: none, outlined: false)[目#h(2em)录]
  outline(indent: true, title: none)
}

#pagebreak()

#{
  set par(first-line-indent: 0pt)
  heading(level: 1, numbering: none, outlined: false)[CONTENTS]
  locate(loc=>{
    let elms = query(<eoutline>, loc)
    for elm in elms {
      let data = elm.value
      let loc = elm.location()
      par[#h(2em*data.level)#data.text#box(width:1fr,repeat[.])#loc.page()]
    }
  })
}

#pagebreak()

= 标题

== 标题

#placeholder(40)

#figure2(rect[Hello], caption: [这是一张图片], caption-en: [This is a figure])<fig1>

#placeholder(60)

== 标题

#placeholder(30)

=== 标题

#placeholder(80)

#figure2(rect[Hello], caption: [这是一张图片], caption-en: [This is a figure])<fig2>

#placeholder(60)

$ f(x)=e^x sin(x) $<eq1>

#placeholder(20)

$ f(x)=e^x sin(x) $<eq2>

= 标题

#figure2(rect[Hello], caption: [这是一张图片], caption-en: [This is a figure])<fig3>

#figure2(rect[Hello], caption: [这是一张图片], caption-en: [This is a figure])<fig4>

#table2(rect[Hello], caption: [这是一张表格], caption-en: [This is a table])<tab1>

@fig1 @fig2 @eq1 @eq2 @tab1
