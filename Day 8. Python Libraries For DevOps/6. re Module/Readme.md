# re Module

This module provides regular expression matching operations.A regular expression (or RE) specifies a set of strings that matches it; the functions in this module let you check if a particular string matches a given regular expression

## Characters used int pattern:

. - this matches any character except a newline.

^ - Matches start of string

$ - Matches end of string

* - Any number of repetitions

+ - One or more repetitions

? - Zero or one repetitions

\ - Escape special characters

[] - Used to indicate set of characters

| - Means OR , A|B either A or B

{} - Indicate the number of occurrences of a preceding regex to match.

() - Group of regex

\A - Matches only at the start of string

\b -Matches the empty string, but only at the beginning or end of a word.

\B - Matches the empty string, but only not at the beginning or end of a word.

\d - Matches any decimal digit

\D - Matches which is not a decimal digit

\s - Matches whitespace character

\S - Matches not a whitespace character

\w - Matches word characters

\W - Matches not word characters

\Z - Matches only at the end of string

## Functions
```
import re
#re.findall() -  find all occurences of pattern
string = "My sisters age is 45 and my age is 30"
pattern="\d+"
match = re.findall(pattern,string)
print(match)
```

```
import re
#expression pattern into a regular expression object, 
#which can be used for matching using its match()
p =re.compile('[a-e]')
match = p.findall("This is Hashnode blog Day 8")
print(match)
```
```
import re
#re.compile(pattern, flags=0) - Compile a regular 
#re.split() - split string by occurences of characters
print(re.split('\W+', 'set width=20 and height=10')) 
print(re.split('\d+', 'set width=20 and height=10'))
```

```
import re
#re.search() - Scan through string looking for the first location where 
#the regular expression pattern #produces a match, and return
#a corresponding Match
string ="Day 8. Python Libraries for DevOps"
pattern= "(\w+$) (\d+)"
match= re.search(pattern,string)
if match != None:
    print("Match Index :",match.start(),match.end())
    print("Day :",match.group(0))
else
    print("Pattern not found")
```

```
import re
#re.sub() - Return the string obtained by replacing the leftmost 
#non-overlapping occurrences of pattern in string by the replacement 
re.sub(r'\sAND\s', ' & ', 'Baked Beans And Spam', flags=re.IGNORECASE)

#re.subn() - It is same as re.sub() except it returns  count of 
#the total of replacement and the new string rather than just the string.

#re.escape() - Escape special characters in pattern.
print(re.escape('https://www.python.org'))

```
