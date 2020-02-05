#!/bin/bash
exitNHelp()
{
	echo -e $usage
	exit 1
}

usage="\nUsage: extractMyClips.sh [arguments] bookTitle clippingFile.txt \n\n
Arguments: \n\n
-h \tShow this help \n
-l \tinclude clipping locations in the output\n"
if [ $# -lt 2 ]
then
	exitNHelp
fi
if [[ ${1} == "-h" ]]
then
	exitNHelp
fi
if [[ ${1} == "-l" ]]
then
	location=1
	title="${2}"
	file="${3}"
else
	location=0
	title="${1}"
	file="${2}"
fi
echo "---$file --- $title"
if  [[ ! -f $file ]]
then
	echo "$file was Not Found!"
	exitNHelp
fi
awk -v title="$title" -v location="$location" 'BEGIN{i=0;PRN=0;j=1}
{
	if( index($0, "===") )
	{
		i++;PRN=0
	} 
	else
	{ 
		if( index($0, title) )
		{
			PRN=1;
			j++;
		}
		else
		{
			if (PRN == 1)
			{
				PRN++;
				if(location == 1) 
					loc = $0;
				else
					loc = ""

				print "\n",j,":",loc
			}
			else
			{
				if (PRN == 2)print $0 
			}
		}  
	}
}' "$file"

