chcp 65001
cd "C:\LAB6\task 1\information"
systeminfo > help.txt
findstr /B /C:"OS Version:" help.txt > version.txt
findstr /C:"Virtual Memory: Available:" help.txt > memory.txt
findstr /C:"Virtual Memory: In Use:" help.txt >> memory.txt
wmic logicaldisk get description,name > disks.txt
del help.txt
cd ..