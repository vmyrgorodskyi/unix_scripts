#!/bin/bash

#Assignemnt #2(1) 
#Course: NEST-201
#name: Vadym Myrgorodskyi

info_func () {
	info=$(zenity --forms \
	--text "CREATING EMPLOYEE PROFILE" \
	--title="EMPLOYEE INFORMATION Script PID $$" \
	--add-entry="Employee Full Name" \
	--add-entry="Employee Username" \
	--add-calendar="Date of Birth" \
	--add-list="Select Department" \
	--list-values="HUMAN RESOURCES|FINANCE|SALES|INFOTECH|LOGISTICS" \
	--add-password=password \
	--add-combo="Select Education" \
	--combo-values="12 Grade|Diploma|Advanced Diploma|Graduate and Masters" \
	--separator=:)
}

technicalcert_func () {
	technicalcert=$(zenity --list \
	--width=300 \
	--height=350 \
	--checklist \
	--title="TECHNICAL CERTIFICATIONS" \
	--text "Select Certification Completed" \
	--column=Passed --column=CERTIFICATIONS False "RHCSA" False "RHCSE" False "MCSA" False "MCP" False "CCNA" False "CCNP" False "ITIL" False "PMP" True "I don't have any certificates" \
	--separator=,)
}

drivinglicence_func () {
	drivinglicence=$(zenity --list \
	--width=150 \
	--height=200 \
	--radiolist \
	--title="DRIVING LICENCE" \
	--text="Select Driving License Status" \
	--column=PASSED --column="DL LEVEL" False "G" False "G1" False "G2" True "Suspended" \
	--separator=:)
}

choice=0

until [ "$choice" != 0 ];
do
	info_func
	fullname=$(awk -F: '{print $1}' <<<$info)
	technicalcert_func
	drivinglicence_func

	result=$info:$technicalcert:$drivinglicence	
	echo $result >> ~/Desktop/emplist.txt

	zenity --question \
		--title="DO YOU NEED TO ADD ANOTHER EMPLOYEE?" \
		--text "Employee $fullname has beed added. Do you want to CONTINUE or EXIT?"	
	choice=$?

done	

echo display list of Employee here
#zenity --forms \
#	    	--title="list of Emloyees" <<<`cat emlplist.txt`
zenity --text-info \
--width=700 \
--height=700 \
--filename=emplist.txt	    	
