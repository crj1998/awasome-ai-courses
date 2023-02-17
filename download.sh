rm *.pdf
txtfile=$1;
echo "read and parse $txtfile"

echo 'start downloading...'
cat $txtfile | while read line
do
    wget -q $line
    # filename=${pdf: 48: ${#pdf}-48};
    # filename=`echo $line | awk -F/ '{print $NF}'`
    filename=${line##*/}
    filesize=`ls -lh $filename | awk '{print $5}'`
    echo "${filename}  ${filesize}"
    sleep 3s
    # break
done
echo 'download finish.'