import sequtils, strutils, os, streams

var temp_string = ""

proc matcher(str: string, search: string): bool =
  temp_string = toLowerAscii(str.strip)
  for character in search:
    let found = temp_string.find(char(character))
    if(found > -1):
      temp_string.delete(found, 0)
  return temp_string.len == 0

when isMainModule:
  if paramCount() == 2:
    let file:string = paramStr(1)
    let search:string = paramStr(2).toLowerAscii

    var strm = newFileStream(file, fmRead)
    var word = ""
    
    if not isNil(strm):
      while strm.readLine(word):
        if(matcher(word, search)):
          echo word
      strm.close()
