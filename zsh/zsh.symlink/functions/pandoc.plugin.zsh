md2pdf () {
  pandoc -s -V geometry:margin=1in -o ${1}.pdf  ${2}
}

md2docx () {
  pandoc -s -o ${1}.docx  ${2}
}

