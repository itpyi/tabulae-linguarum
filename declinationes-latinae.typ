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

// Data

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

#let declinatio-title(i, if-i: false) = [
  #line(length:100%, stroke: gray)
  #v(-0.8em)
  Dēclīnātiō #latin-ordinal(i) #if if-i{[(I-Stirpium)]} #h(1fr) 第#zhnumber-lower(i)变格法#if if-i{[（I-词干）]} 
]

#let chart(noun, gender, if-case: true) = {
  if if-case{
  table(
    align: (right, left, left),
    columns: (3em, 6em, 6em),
    stroke: 0pt,
    inset: (y: 0.3em),
    [#context g.update(gender)],table.cell(colspan: 2)[#text(fill: luma(100))[#noun.at(0)]],
    [],[#text(fill:gray, size: 0.8em)[#smallcaps[singvlaris]]],[#text(fill:gray, size: 0.8em)[#smallcaps[plvralis]]],
    [#text(fill:gray, size: 0.8em, baseline: 0.13em)[#smallcaps[nom]]],[#noun.at(1)],[#noun.at(2)],
    [#text(fill:gray, size: 0.8em, baseline: 0.13em)[#smallcaps[gen]]],[#noun.at(3)],[#noun.at(4)],
    [#text(fill:gray, size: 0.8em, baseline: 0.13em)[#smallcaps[dat]]],[#noun.at(5)],[#noun.at(6)],
    [#text(fill:gray, size: 0.8em, baseline: 0.13em)[#smallcaps[acc]]],[#noun.at(7)],[#noun.at(8)],
    [#text(fill:gray, size: 0.8em, baseline: 0.13em)[#smallcaps[abl]]],[#noun.at(9)],[#noun.at(10)],
  )
  } else{
  table(
    align: (left, left),
    columns: (6em, 6em),
    stroke: 0pt,
    inset: (y: 0.3em),
    table.cell(colspan: 2)[#context g.update(gender)#text(fill: luma(100))[#noun.at(0)]],
    [#text(fill:gray, size: 0.8em)[#smallcaps[singvlaris]]],[#text(fill:gray, size: 0.8em)[#smallcaps[plvralis]]],
    [#noun.at(1)],[#noun.at(2)],
    [#noun.at(3)],[#noun.at(4)],
    [#noun.at(5)],[#noun.at(6)],
    [#noun.at(7)],[#noun.at(8)],
    [#noun.at(9)],[#noun.at(10)],
  )
  }
}


// ===================================== //

#let aqua = ([aqua, -ae, F. 水],
  [aqu#end[a]], [aqu#end[ae]],
  [aqu#end[ae]],[aqu#end[ārum]],
  [aqu#end[ae]],[aqu#end[īs]],
  [aqu#end[am]],[aqu#end[ās]],
  [aqu#end[ā]], [aqu#end[īs]])

#let servus = ([servus, -ī, M. 奴隶],
  [serv#end[us]], [serv#end[ī]],
  [serv#end[ī]],[serv#end[ōrum]],
  [serv#end[ō]],[serv#end[īs]],
  [serv#end[um]],[serv#end[ōs]],
  [serv#end[ō]], [serv#end[īs]])

#let donum = ([dōnum, -ī, N. 礼物],
  [dōn#end[um]],[dōn#end[a]],
  [dōn#end[ī]], [dōn#end[ōrum]],
  [dōn#end[ō]], [dōn#end[īs]],
  [dōn#end[um]],[dōn#end[a]],
  [dōn#end[ō]], [dōn#end[īs]])

#let rex = ([rēx, rēgis, M. 国王],
  [rēx],[rēg#end[ēs]],
  [rēg#end[is]], [rēg#end[um]],
  [rēg#end[ī]], [rēg#end[ibus]],
  [rēg#end[em]],[rēg#end[ēs]],
  [rēg#end[e]], [rēg#end[ibus]])

#let corpus = ([corpus, corporis, N. 身体],
  [corpus],[corpor#end[a]],
  [corpor#end[is]], [corpor#end[um]],
  [corpor#end[ī]], [corpor#end[ibus]],
  [corpus],[corpor#end[a]],
  [corpor#end[e]], [corpor#end[ibus]])


#let civis = ([cīvis, -is, M. 公民],
  [cīv#end[is]],[cīv#end[ēs]],
  [cīv#end[is]],[cīv#end[ium]],
  [cīv#end[ī]], [cīv#end[ibus]],
  [cīv#end[em]],[cīv#end[ēs]],
  [cīv#end[e]], [cīv#end[ibus]])

#let mare = ([mare, -is, N. 海],
  [mar#end[e]],[mar#end[ia]],
  [mar#end[is]],[mar#end[ium]],
  [mar#end[ī]], [mar#end[ibus]],
  [mar#end[e]],[mar#end[ia]],
  [mar#end[ī]], [mar#end[ibus]])

#let fructus = ([frūctus, -ūs, M. 水果],
  [frūct#end[us]],[frūct#end[ūs]],
  [frūct#end[ūs]], [frūct#end[uum]],
  [frūct#end[uī]], [frūct#end[ibus]],
  [frūct#end[um]],[frūct#end[ūs]],
  [frūct#end[ū]], [frūct#end[ibus]])

#let cornu = ([cornū, -ūs, N. 角],
  [corn#end[ū]],[corn#end[ua]],
  [corn#end[ūs]], [corn#end[uum]],
  [corn#end[ū]], [corn#end[ibus]],
  [corn#end[ū]],[corn#end[ua]],
  [corn#end[ū]], [corn#end[ibus]])


#let res = ([rēs, reī, F. 事物],
  [r#end[ēs]],[r#end[ēs]],
  [r#end[eī]],[r#end[ērum]],
  [r#end[eī]],[r#end[ēbus]],
  [r#end[em]],[r#end[ēs]],
  [r#end[ē]], [r#end[ēbus]])


#let dies = ([diēs, diēī, M. 日子],
  [di#end[ēs]],[di#end[ēs]],
  [di#end[ēī]],[di#end[ērum]],
  [di#end[ēī]],[di#end[ēbus]],
  [di#end[em]],[di#end[ēs]],
  [di#end[ē]], [di#end[ēbus]])


// ===================================== //


#table(
  align: left,
  columns: (1fr,1fr),
  stroke: 0pt,
  row-gutter: 1em,
  column-gutter: 2em,
  [#declinatio-title(1)
    #chart(aqua, -1)
  ],
  [
  #declinatio-title(2)
  #table(
    align: left,
    columns: (1fr,1fr),
    stroke: 0pt,
    chart(servus, 1),
    chart(donum, 0, if-case: false)
  )
  ],
  [#declinatio-title(3)
  #table(
    align: left,
    columns: (1fr,1fr),
    stroke: 0pt,
    chart(rex, 1),
    chart(corpus, 0, if-case: false)
  )
  ],
  [#declinatio-title(3, if-i: true)
  #table(
    align: left,
    columns: (1fr,1fr),
    stroke: 0pt,
    chart(civis, 1),
    chart(mare, 0, if-case: false)
  )
  ],
  [#declinatio-title(4)
  #table(
    align: left,
    columns: (1fr,1fr),
    stroke: 0pt,
    chart(fructus, 1),
    chart(cornu, 0, if-case: false)
  )
  ],
  [#declinatio-title(5)
  #table(
    align: left,
    columns: (1fr,1fr),
    stroke: 0pt,
    chart(res, -1),
    chart(dies, 1, if-case: false)
  )
  ],
)