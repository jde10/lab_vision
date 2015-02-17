# Warmup Questions

1.  What is the clone url of this repository?
    >   https://github.com/jde10/lab_vision.git

2.  What is the output of the ``cal`` command?

        A calendar with the present month and highlighted day:
February 2015      
Su Mo Tu We Th Fr Sa  
_? _?1  2  3  4  5  6  7  
 8  9 10 11 12 13 14  
15 16 17 18 19 20 21  
22 23 24 25 26 27 28

# Homework Questions

1.  What is the ``grep``command?
    >   ‘grep’ is a command that searches and prints lines that contain the word or pattern that was specified in a specific file. (%info grep)

2.  What is a *makefile*?
    >   A makefile is a file that contains instructions for the make program on compiling and linking programs. It facilitates the development of large programs because it keeps track of changes in parts of said program, and only compiles the parts that have changed. (http://www.tutorialspoint.com/makefile/)

3.  What is *git*?
    >   Git is a version control system that stores projects throughout its different stages. Gits are mostly used for source code, however, they can also be used of other types of documents, such as common Word files. Gits directories are called repositories, these have the ability of tracking the complete version history of the files that are being worked with once these have been committed. (http://git-scm.com/book/en/v2/Getting-Started-Git-Basics)

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   The ‘prune’ option in the ‘find’ command will limit the search of files to the current directory, without allowing searches deeper within said directory. By using the -prune command, only the specified directory will be printed.
jdelavega@ubuntu:~/unixstuff$ find .
.
./science.txt
./backups
./backups/science.bak
./names.txt
./list1
./list2
./biglist
./slist
jdelavega@ubuntu:~/unixstuff$ find . -prune
.
jdelavega@ubuntu:~/unixstuff$


<<<<<<< HEAD
5.  Where is the file ``xxxxxx``
    >   you would have to search the computer using the commands:
%cd
%find . -name ‘xxxxxx*’

this way you will find any file that contains xxxxxx in its name. If the file’s name is only xxxxxx then the command would be:
%find ~ -name ‘xxxxxx’


6.  How many files with ``gnu`` in its name are in ``dir``
    >   we would have to type:
%find ~/usr/src -name ‘*gnu*’ | wc -l
this way we count the amount of files that contain gnu somewhere in their name. This is the result for my computer:
jdelavega@ubuntu:~$ find ~ -name '*gnu*' | wc -l
1
jdelavega@ubuntu:~$ find ~ -name '*gnu*'
./.cache/event-sound-cache.tdb.e10139c53e63a5f390e6193254c92b86.x86_64-pc-linux-gnu

7.  How many files contain ``gpl`` inside in ``dir``
    >   we would have to type:
%grep -rli gpl ~/usr/src | wc -l
however the result was 0 for my computer.
=======
5.  Where is the file ``grub.cfg``
    >   answer

6.  How many files with ``gnu`` in its name are in ``/usr/src``
    >   answer

7.  How many files contain ``gpl`` inside in ``/usr/src``
    >   answer
>>>>>>> FETCH_HEAD

8.  What does the ``cut`` command do?
    >   The cut command prints the selected parts of lines in a file. The selected parts may be specified by the bytes, characters or fields, each accompanied by numbers or ranges separated by commas that indicate the selected parts of the file. (%info cut)

9.  What does the ``wget`` command do?
    >   the ‘wget’ is a non-interactive network downloader (http://unixhelp.ed.ac.uk/CGI/man-cgi?wget), this means that it downloads files from the web from the background, not interfering with any process and most importantly, it doesn’t require the user to be present.

10.  What does the ``diff`` command do?
    >   the ‘diff’ command finds the difference between two files, by comparing its contents. it can also compare directories. When comparing directories, diff compares the files in each directory in alphabetical order. In case diff is comparing files, the differences between the files will appear on screen. For example, comparing the files big list with list1: 
jdelavega@ubuntu:~/unixstuff$ ls
backups  biglist  list1  list2  names.txt  science.txt  slist
jdelavega@ubuntu:~/unixstuff$ diff biglist list1
7,10d6
< orange
< plum
< mango
< grapefruit
these were the contents of the lists:
jdelavega@ubuntu:~/unixstuff$ cat biglist
pear
banana
apple
peach
grape
orange
orange
plum
mango
grapefruit
jdelavega@ubuntu:~/unixstuff$ cat list1
pear
banana
apple
peach
grape
orange
jdelavega@ubuntu:~/unixstuff$ 

11.  How many users exist in *Guitaca*?
    >   there are 48 users

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   from Guitaca:
%cut -d : -f 1,7 /etc/passwd | sort -t : -k2

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   from Guitaca:
%cut -d : -f 1,7 /etc/passwd |grep ’/sbin/nologin’ | wc -l
the answer would be 41

14.  What is the name of the linux distribution running on *Guitaca*?
    >   using command %lsb_release -a , the distribution is Fedora release 20 (Heisenbug)

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >   it is called a shebang, and it specifies to the shell the corresct program to interpret the script with once it’s being executed. (http://stackoverflow.com/questions/13872048/bash-script-what-does-bin-bash-mean)

17. How many unique images are in the ``sipi_images`` folder?
    >   212
    
