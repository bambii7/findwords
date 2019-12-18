
# Findwords

`findwords <dictionary> <availablechars>`

Finds all words in dictionary given combination of characters.
Will search for permutations of characters passed.

 `./findwords sample/words_alpha.txt foobar`

Outputs:

```
  foobar
  for
  fora
  forb
  fr
  fra
  frab
  fro
```

The accuracy is dependant on the ditionary supplied.
Useful for word search games ;)

There are sample dictionary include, others are available https://github.com/dwyl/english-words