import sequtils, strutils

var dictionary: seq[string] = @[
  "Abc",
  "Foo",
  "Bar",
  "Oof",
]

const search_chars = @['a', 'b', 'c']

var temp_string = ""

proc matcher(str: string): bool =
  temp_string = toLowerAscii(str)
  for character in search_chars:
    let found = temp_string.find(character)
    if(found > -1):
      temp_string.delete(found, 0)
  return temp_string.len == 0

for word in dictionary:
  if(matcher(word)):
    echo word

# dictionary.keepIf(matcher)
