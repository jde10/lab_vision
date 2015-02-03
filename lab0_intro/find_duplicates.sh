
cd ~
images=$(find . -name *.tiff)

for im in ${images[*]}
do
	cksum $im | cut -d ' ' -f 1,3 | cat >> description.txt

done 

uniq -c -d -f 2 description.txt duplicates.txt

