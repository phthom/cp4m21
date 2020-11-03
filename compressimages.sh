# this script excludes all pictures not used in a serie of markdown files
# images directory should be ./images
# all md files should be in the same directory along with ./images.
# Should executed in the markdown directory

cat *.md > list.txt
mkdir images2
sed -n -e 's/^.*images\/\(.*\))/cp \.\/images\/\1 \.\/images2/ p' list.txt > copyim.sh
chmod +x copyim.sh
./copyim.sh
rm -rf ./images
mv ./images2 ./images
rm ./list.txt
rm ./copyim.sh
