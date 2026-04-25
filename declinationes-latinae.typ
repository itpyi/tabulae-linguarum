#let data-set = (
  "aqua": ([aqua, -ae, #smallcaps[f]. 水],
  [aqu-a], [aqu-ae],
  [aqu-ae],[aqu-ārum],
  [aqu-ae],[aqu-īs],
  [aqu-am],[aqu-ās],
  [aqu-ā], [aqu-īs]),

  "servus": ([servus, -ī, #smallcaps[m]. 奴隶],
  [serv-us], [serv-ī],
  [serv-ī],[serv-ōrum],
  [serv-ō],[serv-īs],
  [serv-um],[serv-ōs],
  [serv-ō], [serv-īs]),

  "donum": ([dōnum, -ī, #smallcaps[n]. 礼物],
  [dōn-um],[dōn-a],
  [dōn-ī], [dōn-ōrum],
  [dōn-ō], [dōn-īs],
  [dōn-um],[dōn-a],
  [dōn-ō], [dōn-īs]),

  "rex": ([rēx, rēgis, #smallcaps[m]. 国王],
  [rēx],[rēg-ēs],
  [rēg-is], [rēg-um],
  [rēg-ī], [rēg-ibus],
  [rēg-em],[rēg-ēs],
  [rēg-e], [rēg-ibus]),

  "corpus": ([corpus, corporis, #smallcaps[n]. 身体],
  [corpus],[corpor-a],
  [corpor-is], [corpor-um],
  [corpor-ī], [corpor-ibus],
  [corpus],[corpor-a],
  [corpor-e], [corpor-ibus]),


  "civis": ([cīvis, -is, #smallcaps[m]. 公民],
  [cīv-is],[cīv-ēs],
  [cīv-is],[cīv-ium],
  [cīv-ī], [cīv-ibus],
  [cīv-em],[cīv-ēs],
  [cīv-e], [cīv-ibus]),

  "mare": ([mare, -is, #smallcaps[n]. 海],
  [mar-e],[mar-ia],
  [mar-is],[mar-ium],
  [mar-ī], [mar-ibus],
  [mar-e],[mar-ia],
  [mar-ī], [mar-ibus]),

  "fructus": ([frūctus, -ūs, #smallcaps[m]. 水果],
  [frūct-us],[frūct-ūs],
  [frūct-ūs], [frūct-uum],
  [frūct-uī], [frūct-ibus],
  [frūct-um],[frūct-ūs],
  [frūct-ū], [frūct-ibus]),

  "cornu": ([cornū, -ūs, #smallcaps[n]. 角],
  [corn-ū],[corn-ua],
  [corn-ūs], [corn-uum],
  [corn-ū], [corn-ibus],
  [corn-ū],[corn-ua],
  [corn-ū], [corn-ibus]),

  "res": ([rēs, reī, #smallcaps[f]. 事物],
  [r-ēs],[r-ēs],
  [r-eī],[r-ērum],
  [r-eī],[r-ēbus],
  [r-em],[r-ēs],
  [r-ē], [r-ēbus]),


  "dies": ([diēs, diēī, #smallcaps[n]. 日子],
  [di-ēs],[di-ēs],
  [di-ēī],[di-ērum],
  [di-ēī],[di-ēbus],
  [di-em],[di-ēs],
  [di-ē], [di-ēbus])
)

// global setting

#import "@preview/zh-kit:0.1.0": *

#set text(font: ("EB Garamond","Kaiti SC"), size: 12pt)


#set page(
  paper: "a4",
  header: [#text(tracking: 0.07em)[TABVLA DECLINATIONVM] #h(1fr) #text(font:"KingHwa_OldSong")[拉丁语名词变格表]],
  margin: (
    top: 5em,
    bottom: 4.5em,
    x: 3em
  ),
  footer: [Q. Vagnius Itpivis fēcit XXII Apr. MMXXVI #h(1fr) ex #link("https://bencrowder.net/latin-declensions/")[tabulā Ben Crowder] adaptātum],
  number-align: center,
  flipped: true
)


#let latin-ordinal(i) = {
  if i == 1{
    [Prīma]
  } else if i == 2{
    [Secunda]
  } else if i == 3{
    [Tertia]
  } else if i == 4{
    [Quārta]
  } else if i == 5{
    [Quīnta]
  }
}

#let cases = ([nom], [gen], [dat], [acc], [abl])

// parsing

#let gender-color(g) = {
  if g == 1 {
    rgb("#0074D9")
  } else if g == -1 {
    rgb("#FF4136")
  } else if g == 0 {
    rgb("#B10DC9")
  }
}

#let g = state("gender", -1)

#let end(a) = {
  context text(fill: gender-color(g.get()))[#a]
}

#let parse-end(noun) = {
  if noun.has("text") {
    let txt = noun.text
    if "-" in txt {
      let parts = txt.split("-")
      return [#parts.at(0)#end[#parts.at(1)]]
    }
  }

  noun
}

#let declinatio-title(i, if-i: false) = [
  #line(length:100%, stroke: gray)
  #v(-0.8em)
  Dēclīnātiō #latin-ordinal(i) #if if-i{[(I-Stirpium)]} #h(1fr) 第#zhnumber-lower(i)变格法#if if-i{[（I-词干）]} 
]

#let meta-style(body, y-shift: 0.13em) = {
  text(fill:gray, size: 0.8em, baseline: y-shift)[#smallcaps[#body]]
}

// cell

#let chart(noun, gender, if-case: true) = {
  if if-case{
  table(
    align: (right, left, left),
    columns: (3em, 6em, 6em),
    stroke: 0pt,
    inset: (y: 0.3em),
    [#context g.update(gender)],table.cell(colspan: 2)[#text(fill: luma(100))[#noun.at(0)]],
    [],[#meta-style(y-shift: 0em)[singvlaris]],[#meta-style(y-shift: 0em)[plvralis]],
    ..range(15).map(i => {
      if calc.rem(i,3) == 0 {
        return [#meta-style(cases.at(calc.floor(i / 3)))]
      } else {
        return [#parse-end(noun.at(calc.floor(i / 3) * 2 + calc.rem(i,3)))]
      }
    })
  )
  } else{
  table(
    align: (left, left),
    columns: (6em, 6em),
    stroke: 0pt,
    inset: (y: 0.3em),
    table.cell(colspan: 2)[#context g.update(gender)#text(fill: luma(100))[#noun.at(0)]],
    [#text(fill:gray, size: 0.8em)[#smallcaps[singvlaris]]],[#text(fill:gray, size: 0.8em)[#smallcaps[plvralis]]],
    ..range(1, 11).map(i => [#parse-end(noun.at(i))])
  )
  }
}



// rendering


#table(
  align: left,
  columns: (1fr,1fr),
  stroke: 0pt,
  row-gutter: 1em,
  column-gutter: 2em,
  [#declinatio-title(1)
    #chart(data-set.aqua, -1)
  ],
  [
  #declinatio-title(2)
  #table(
    align: left,
    columns: (1fr,1fr),
    stroke: 0pt,
    chart(data-set.servus, 1),
    chart(data-set.donum, 0, if-case: false)
  )
  ],
  [#declinatio-title(3)
  #table(
    align: left,
    columns: (1fr,1fr),
    stroke: 0pt,
    chart(data-set.rex, 1),
    chart(data-set.corpus, 0, if-case: false)
  )
  ],
  [#declinatio-title(3, if-i: true)
  #table(
    align: left,
    columns: (1fr,1fr),
    stroke: 0pt,
    chart(data-set.civis, 1),
    chart(data-set.mare, 0, if-case: false)
  )
  ],
  [#declinatio-title(4)
  #table(
    align: left,
    columns: (1fr,1fr),
    stroke: 0pt,
    chart(data-set.fructus, 1),
    chart(data-set.cornu, 0, if-case: false)
  )
  ],
  [#declinatio-title(5)
  #table(
    align: left,
    columns: (1fr,1fr),
    stroke: 0pt,
    chart(data-set.res, -1),
    chart(data-set.dies, 1, if-case: false)
  )
  ],
)