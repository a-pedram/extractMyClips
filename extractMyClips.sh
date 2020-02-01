#!/bin/bash
echo "$1"
awk -v title="$1" 'BEGIN{i=0;PRN=0;j=1}
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
				print "\n",j,":"
			}
			else
			{
				if (PRN == 2)print $0 
			}
		}  
	}
}' My\ Clippings.txt 

