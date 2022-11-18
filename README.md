# common_sequences

## Set up, usage, & testing
1. `git clone git@github.com:rrabinovitch/common_sequences.git`
2. `cd common_sequences`
3. `rspec` ==> should produce 11 passing tests
4. running `ruby solution.rb pride_and_prejudice.txt` from the command line should produce the following output:
```
i do not - 61
i am sure - 61
as soon as - 55
she could not - 49
that he had - 37
in the world - 34
it would be - 33
i am not - 32
i dare say - 31
could not be - 30
it was not - 30
that he was - 29
that it was - 28
on the subject - 28
as well as - 27
would have been - 27
by no means - 26
one of the - 25
he had been - 25
and she was - 25
that she had - 24
the rest of - 23
it was a - 23
i did not - 23
in spite of - 23
a great deal - 23
uncle and aunt - 22
do not know - 22
she did not - 22
i have not - 22
not to be - 21
mrs bennet was - 21
it is a - 20
you do not - 20
could not have - 20
i have been - 20
she had been - 20
that she was - 20
could not help - 20
as much as - 20
it is not - 19
it will be - 19
mr and mrs - 19
that i am - 19
but it is - 19
that she could - 18
project gutenbergtm electronic - 18
the project gutenberg - 18
be able to - 18
i assure you - 18
that he should - 18
will not be - 18
it to be - 18
there was a - 18
of mr darcy - 18
as to the - 18
had not been - 18
the honour of - 18
to make her - 18
and it was - 17
the same time - 17
made no answer - 17
to be sure - 17
mr collins was - 17
i am afraid - 17
in love with - 17
to be in - 17
as they were - 17
the next morning - 17
which she had - 17
miss de bourgh - 17
of the family - 16
you will not - 16
a young man - 16
i should be - 16
you will be - 16
he did not - 16
at the same - 16
i will not - 16
and i am - 15
she was not - 15
out of the - 15
she would not - 15
am sure i - 15
but i am - 15
rest of the - 15
but it was - 15
him to be - 15
the whole of - 15
a few minutes - 15
that she would - 14
it is very - 14
looked at her - 14
there was no - 14
of the room - 14
that it would - 14
lady catherine de - 14
in the course - 14
if he had - 14
the course of - 14
```


* Note: I presume the example solution in the instructions doesn't account for stylization. The example lists "i do not" as appearing 58 times throughout `pride_and_prejudice.txt` when it in fact appears 61 times. However, in 3 of those instances, one of the three words in the sequence are surrounded by underscores for italicization. So the program that produced the example solution likely considered "i do not", "_i_ do not", and "i do _not_" to be three different sequences. Given the instructions to ignore punctuation, case, and line endings, I designed `TextProcessor::normalize_text` to consider those three strings as the same sequence. If we were interested in considering them to be different sequences, the `.gsub(/-+/, ' ')` call could be removed from the method.
