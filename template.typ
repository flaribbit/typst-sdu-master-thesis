#set text(size: 12pt, font: "Source Han Serif SC")
#set par(justify: true, leading: 12pt, first-line-indent: 2em)
#set block(above: 16pt)
#set heading(numbering: "1.")
#set math.equation(numbering: "1.")
#show heading.where(level: 1): it => {
  it
  counter(math.equation).update(0)
  counter("figure2").step()
  counter("table2").step()
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

= title

#figure2(rect[Hello], caption: [这是一张图片], caption-en: [This is a figure])<fig1>

#figure2(rect[Hello], caption: [这是一张图片], caption-en: [This is a figure])<fig2>

$ f(x)=e^x sin(x) $<eq1>

$ f(x)=e^x sin(x) $<eq2>

= title

#figure2(rect[Hello], caption: [这是一张图片], caption-en: [This is a figure])<fig3>

#figure2(rect[Hello], caption: [这是一张图片], caption-en: [This is a figure])<fig4>

#table2(rect[Hello], caption: [这是一张表格], caption-en: [This is a table])<tab1>

@fig1 @fig2 @eq1 @eq2 @tab1
