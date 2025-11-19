#!/bin/bash
cd $HOME
cd Desktop/Laboratory/LaboratoryOfComputationalPhysics_Y8/Ex\ 3\ bash/
mkdir -p Students
cd Students

if [ -e data.csv ];
then
	echo "File already exists"
else
	echo "Not existing file, dowloading..."
	wget -q --show-progress -O data.csv \
	"https://www.dropbox.com/scl/fi/bxv17nrbrl83vw6qrkiu9/LCP_22-23_students.csv?rlkey=47fakvatrtif3q3qw4q97p5b7&e=1"

fi


grep "Pod*" data.csv > pod_students.csv
grep "Physics*" data.csv > physics_students.csv

dummy=0
most_freq_letter="" 
for letter in {A..Z}; do
	counter=0
	while IFS= read -r line;
	do
		# Della linea prende la prima parola e poi il primo carattere
		# usando la COMMAND SOBSTITUTION
		name=$(printf '%s\n' "$line" | cut -d',' -f1 | cut -c1)
		if [ "$name" == "$letter" ];
		then
			counter=$((counter+1))
		fi
	done < <(tail -n +2 data.csv)
	echo "Letter $letter : $counter"
	if ((counter > dummy));
	then 
		dummy=$counter
		most_freq_letter="$letter"
	fi
done

echo "Most frequent letter: $most_freq_letter with occurrences: $dummy"


# Create group on module based dimension

dimension=18
line_counter=1
group_counter=0
prefix="lab_group"
header=$(head -n 1 data.csv)

while IFS= read -r line;
do

    if((line_counter%dimension==1));
    then
        group_counter=$((group_counter+1))
        printf -v file_name "%s%02d.csv" "$prefix" "$group_counter"
        printf '%s\n' "$header" > "$file_name"
        
    fi
    #echo "(Line,group,file_name) = ($line_counter,$group_counter,$file_name)"

    printf '%s\n' "$line" >> "$file_name"
    
    line_counter=$((line_counter+1))
done < <(tail -n +2 data.csv)

echo "Totale studenti: $line_counter"








