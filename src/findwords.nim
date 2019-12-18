import sequtils, strutils, os

proc tidy(s: string): string =
  s.strip.toLowerAscii

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

    var lineCount = 0
    var matchCount = 0
    for word in lines(filename):
      lineCount.inc
      if(matcher(word.tidy, search)):
        matchCount.inc
        echo word

    echo "lines searched: ", $lineCount
    echo "matched: ", $matchCount
