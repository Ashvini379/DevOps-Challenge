#!/bin/bash
file="document.docx"
extension_removed="${file%.*}"  #Removes extension, leaves document
echo "Removed extension is $extension_removed"
