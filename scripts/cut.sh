s='id;some text here with possible ; inside' | rev
echo $s

string="$( cut -d ';' -f 2- <<< "$s" )"; echo "$string | rev"
