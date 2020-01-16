import sequtils, strutils, os, algorithm

proc tidy*(s: string): string =
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

proc paramOrDefault(paramIndex: int, default: int): int =
  try:
    result = parseInt(paramStr(paramIndex))
  except:
    result = default

# proc perm[T](a: openarray[T], n: int, use: var seq[bool]): seq[seq[T]] =
#   result = newSeq[seq[T]]()
#   if n <= 0: return
#   for i in 0 .. a.high:
#     if not use[i]:
#       if n == 1:
#         result.add(@[a[i]])
#       else:
#         use[i] = true
#         for j in perm(a, n - 1, use):
#           result.add(a[i] & j)
#         use[i] = false

# proc permutations[T](a: openarray[T], n: int): seq[seq[T]] =
#   var use = newSeq[bool](a.len)
#   perm(a, n, use)

# proc toString(str: seq[char]): string =
#   result = newStringOfCap(len(str))
#   for ch in str:
#     add(result, ch)

# # Generating permutation using Heap Algorithm
# proc heapPermutation(a, size, n):

#     # if size becomes 1 then prints the obtained
#     # permutation
#     if (size == 1):
#         printArr(a, n)
#         return

#     for i in range(size):
#         heapPermutation(a,size-1,n);

#         # if size is odd, swap first and last
#         # element
#         # else If size is even, swap ith and last element
#         if size&1:
#             a[0], a[size-1] = a[size-1],a[0]
#         else:
#             a[i], a[size-1] = a[size-1],a[i]

when isMainModule:
  if paramCount() == 2 or paramCount() == 3:
    let filename:string = paramStr(1)
    let search:string = paramStr(2).tidy
    let minLength = paramOrDefault(3, 3)

    var lineCount = 0
    var matchCount = 0
    var matches: seq[string] = @[]
    for word in lines(filename):
      lineCount.inc
      if(word.len >= minLength and matcher(word.tidy, search)):
        matches.add(word.tidy)
        matchCount.inc

    # let perms = permutations(search, 4)
    # for perm in perms:
    #   echo "perm ", perm.toString
    # echo "total perms ", perms.len

    matches.sort(stringCompareHighToLow)
    printResults(matches)

    echo "lines searched: ", $lineCount
    echo "matched: ", $matchCount
