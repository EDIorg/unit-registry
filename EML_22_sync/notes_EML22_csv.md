exported the units from a local clone of EML 2.2 into a csv. 

bash command line: 

`xsltproc unitDictionary_2_csv.xsl /Volumes/mob/EML_schema/EML-2.2.0/git_checkouts/eml/eml-unitDictionary.xml > EML_22_units_all_fields.csv`

Found a duplicate line in the dictionary!

(use cut | sort |uniq to check it, command not saved) 
molePerKilogram

removed extra entry manually.

upload this table to a scratch table to confirm it can go in
then upload with scope 24 to the main table  
