#Script to check log file and found total error line in files.

## Taking filepath as input
read -p "Enter filepath where to search for log files" log_file 


#Check if file exist or not

if [[ ! -f $log_file ]];then
	echo "file not found on ${log_file} "
	exit 1
else
	echo "log file found, processing further..."
fi

#Checking log file for specific error messages...

#Output file forstoring the output

read -p "Enter output filename where you want to store data! " output_file
#Clear the output first
:> "$output_file"

error_count=0
warning_count=0
info_count=0

#Looping through files
for line in "${log_file}"; do
	grep -iE 'warning|info|error' $line >> "${output_file}"

	((error_count+= $(grep -ic "error" "$line") ))
	((warning_count+= $(grep -ic "warning" "$line") )) 
	((info_count+= $(grep -ic "info" "$line") )) 
done

#Final Summary

echo -e "Summary Report"
echo "Total error lines: $error_count "
echo "Total warning lines: $warning_count "
echo "Total info lines: $info_count"
