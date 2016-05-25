for f in *.sql
do
    echo "Processing $f:"
    iconv -f UTF-16 -t ASCII $f > $f.txt
    echo " $f.txt is now ASCII"
done
