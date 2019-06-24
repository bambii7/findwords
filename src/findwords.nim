import sequtils, strutils, os

proc tidy(str: string): string =
  str.strip.toLowerAscii

proc matcher(str: string, search: string): bool =
  var temp_string = str
  for character in search:
    let found = temp_string.find(character)
    if(found > -1):
      temp_string.delete(found, found)
  return temp_string.len == 0

when isMainModule:
  if paramCount() == 2:
    let filename:string = paramStr(1)
    let search:string = paramStr(2).tidy

    var lines = 0
    for word in lines(filename):
      lines.inc
      if(matcher(word.tidy, search)):
        echo word

    echo "lines: ", $lines
