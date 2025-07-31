#!/bin/bash
read -p "Name the script you want to create " script_name

#Creating script with above name

touch $script_name

echo "#!bin/bash " >> $script_name
echo "##This script is created from another script named as create_script" >> $script_name
chmod +x ${script_name}
echo "Script is created now!"
echo "Done"
