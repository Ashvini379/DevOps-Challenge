#!/bin/bash
#String concatenation
string1 ="Hello, "
string2 = "world"
concatenated_string = $string1$string2
echo $ concatenated_string

#Length of string
text="Hello, world!"
length="Length of string is ${#text}"

#Substring extraction
full_string="Bash scripting is fun!"
substring="Extracted substring from index 5 to 9 is ${full_string:5:9}"  # Extracts "scripting"
