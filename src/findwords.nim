import sequtils, strutils, os, algorithm

proc tidy(s: string): string =
  s.strip.toLowerAscii

proc matcher(str: string, search: string): bool =
  var temp_string = str
  for character in search:
    let found = temp_string.find(character)
    if(found > -1):
      temp_string.delete(found, found)
  return temp_string.len == 0

proc printResults(results: seq[string]): void =
  for word in results:
    echo word

proc stringCompareHighToLow(x, y: string): int =
  if x.len() > y.len() or x.len() == y.len():
    -1
  else:
    1

when isMainModule:
  if paramCount() == 2:
    let filename:string = paramStr(1)
    let search:string = paramStr(2).tidy

    var lineCount = 0
    var matchCount = 0
    var matches: seq[string] = @[]
    for word in lines(filename):
      lineCount.inc
      if(matcher(word.tidy, search)):
        matches.add(word.tidy)
        matchCount.inc

    matches.sort(stringCompareHighToLow)
    printResults(matches)

    echo "lines searched: ", $lineCount
    echo "matched: ", $matchCount
