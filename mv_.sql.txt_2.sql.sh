#! /bin/bash
for f in *.sql.txt
do
    echo "Filename before: $f"
    new_f=${f:0:${#f}-4}
    echo "Filename after: $new_f"
    mv $f $new_f
done
