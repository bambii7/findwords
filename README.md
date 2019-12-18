
# Findwords

`findwords <dictionary> <availablechars> <?min_word_length>`

Finds all words in dictionary given combination of characters.
Will search for permutations of characters passed. An optional min length parameter is passed, defaults to 3.

 `./findwords sample/words_alpha.txt foobar 4`

Outputs:

```
foobar
afro
barf
boar
boof
boor
bora
boro
broo
faro
fora
forb
frab
raob
roof
```

The accuracy is dependant on the ditionary supplied.
Useful for word search games ;)

There are sample dictionary include, others are available https://github.com/dwyl/english-words