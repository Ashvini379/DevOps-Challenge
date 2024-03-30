# Basic Linux commands

date - Date command is used to display the system’s date and time. In the output screen, you can see your system’s date and time.
cal - command is a calendar command in Linux which is used to see the calendar of a specific month or a whole year. In the terminal, type cal and press Enter.
clear - This is a standard Linux operating system command that is used to clear the terminal screen.
bc- Basic Calculator is a command line utility that offers everything you expect from a simple scientific calculator. To use this calculate, in the terminal, just type bc and press Enter.
quit - Do you want to get out of calculator mode? Just type quit command and press Enter, which will take to you to the terminal.
pwd - Do you know, you can see the working directory path pwd command stands for Print Working Directory.
cd /directory/folder/path – change between different directories.
cd.. – moves one directory up

# File and Directories commands

ls [/directory/folder/path] - This ls command is used to check the contents of the directory you are in.
mkdir [directory] – create directory, specify directory name.
### create file

nano [file] - using nano editor
touch [file] – create file.
echo "Text" > [file] - The echo command will duplicate whatever you specify in the command, and put the copy into a file.
vi [file] – using vi editor.
vim [file] – Its more user friendly which stands for vi      editor, modified.
cat [file] is a command used to view the contents of a file. You can see it in the output of a command. Let’s view the content of one more file.
less [file]- you can see the contents on one page at a time. You can move by pressing the up and down keys. Type q to exit.
head [option] [file]– displays some top lines of file. We can use option(–) to display top n lines of file. We can modify command with options as below.
 -n – changes the number of lines printed. For example, head -n 5 shows the first five lines.

 -c – prints the file’s first customized number of bytes.

 -q – disables headers specifying the file name.
tail [option] [file]– displays bottom lines of file. We can use option(-) to display bottom n lines of file. We can modify command with options as below.

 -n – changes the number of lines printed. For example, head -n 5 shows the first five lines.

nl [option] [file] – we can display line numbers before each line. We can modify command using below options.

-b: This parameter is used to specify the numbering style

-n: This parameter is used to format the line numbers.
cp [source] [destination] – copies file from source to destination.
mv [source] [destination] – moves file from source to destination.
rm [file] – delete a file.
rmdir [directoryname] – removes directory. Use option(-r) to delete files and directories recursively.

# User and Groups permissions command

ls –l – This command will display details of file with permissions.
sudo useradd [option] [username] –p [PASSWORD] – useradd command is used to create user.

-m - makes users home directory, if does not exist.

-p - provide password foe user
sudo groupadd [groupname] – groupadd command is used to create group.
sudo usermod [option] [groupname] [username] – usermod is used to add user to group.
sudo su [username] – su command is used to switch user.
sudo su [username] – sudo command is used to allow to run command using security privileges of other user.
chmod [option] [permission] [filename] – modify user permissions. Different permissions used are.
-r – read permission(4)

-w – write permission(2)

-o – execute permission(1)
chown [option] [username] [filename]- change user of file.
# Installing and updating packages

apt install [packagename] – install packages
apt update – update packages.

# Other Linux commands

wc [file] – get number of lines and word count of file.
ls [filename]*– ls command to search all file name started with “file”.
ls [characters in word] - This command returns all file name which contains character.
alias [aliasname]=["command name"] – We can use alias for command.
unalias command [aliasname] – remove alias for command.
hostname – returns hostname.
history – This command shows history of all  used commands.

# Searching for files

find . –name ["filename"] – returns directory of file.
find . –type d(option -type) - names of all the directories and subdirectories under the current directory.
find . –perm 644(option –perm) – returns files with permissions.


# Using pipes

pipe (|) – used to combine 2 or more commands
head [filename] | wc -w


# Searching with grep

grep [option] ["any word in file"] [filename] – search text in file. We can modify command using below options.

  -n : returns line number

  -w: search whole word in file

# Working with .tar and .zip files

tar [option] [archive file] [file1] [file2] – archive files into tar file

  -c- crate archive

  -f – archive to file

  -a – kind of compression

  -x- extract files

  -C- target directory

zip [option] [zip file] [file1] [file2] – used to compress files into zip file.

  -d - removes file from archive

  -u - updates file in archive

  -m - moves file into archive

  -r - recursively archive files


unzip [zip file] [directory] – extract content of zip file into folder.
gzip, gunzip, bzip2, unzip: Compress and decompress files.

# Links

ln [option] [file] [folder] – this command is used to  avoid having multiple copies of the same file in different places.

–s ensures that symbolic link is created.

# Environment variable

env – displays list of environment variables.
echo $[environment variable] – It is used to return value of  environment variable


# Input/Output redirects

[first command] > [output file]> - this command redirects output of command to file[option 2> - standard error redirection , &2 – standard output and error redirection.

[command] < [file]< - this command redirects output from file.

# Standard output to file

[command] | tee [option] [output file] –tee command is used to display output of command is as well as save in file.

-a Option : It basically do not overwrite the file but append to the given file.

# Text processing command

cut [option] [character range] [file]cut scommand is used to select specific column of file.

-f – selects a specific field.

-b – cuts the line by a specified byte size.

-c – sections the line using a specified character.

-d – separates lines based on delimiters.


awk [option] '{action}' [file] – used for text processing.

-f - Reads the awk program source from the file

-F fs Use fs for the input field separator
grep ["text to be searched"] [file] – search text in file.


sort [option] [file]– sort data alphabetically(-n option for numbers). We can modify sort command using below options.

-o – redirects the command outputs to another file.

-r – reverses the sorting order to descending.

-n – sorts the file numerically.

-k – reorders data in a specific field.

uniq [file] – omit repeated lines.
wc [file] -  returns no of lines, words and characters in each line of file(option –l –line, -w – word, -c – character)


# Compare files

diff [file1] [file2] – get difference in both file.
cmp [file1] [file2] – It returns at what line difference is.


# Processes in linux

ps – displays process in current shell.

The ps command accepts several options, including:

-T – displays all processes associated with the current shell session.

-u username – lists processes associated with a specific user.

-A – shows all the running processes.

kill [signal] [process id] – terminate process with signals.

![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/b9a1c918-0ed2-4306-bb4c-b8b67ebd6908)


