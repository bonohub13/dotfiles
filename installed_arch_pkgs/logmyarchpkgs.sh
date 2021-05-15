#!/usr/bin/sh
target_file="myarchpkgs.txt"
splitter=""

if [ -f "$target_file.bak" -a -f $target_file ]; then
    rm "$target_file.bak"
    mv $target_file "$target_file.bak"
elif [ -f $target_file ]; then
    mv $target_file "$target_file.bak"
fi

printf "#%.0s" {1..25} | tee $target_file
echo | tee -a $target_file
echo "# logged on "`date | cut -d " " -f 7,2,3 | sed "s/ /-/g"`" #" | tee -a $target_file
printf "#%.0s" {1..25} | tee -a $target_file
for i in `seq 1 2`; do echo | tee -a $target_file; done

pacman -Qtn | while read pkg; do
    echo $pkg | awk '{print $1}' | tee -a $target_file
done

echo "Done!"
