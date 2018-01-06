# publish file to found.ward.bay.wiki.org assets
# usage: sh pub.sh file-name

scp $1 root@bay.wiki.org:.wiki/found.ward.bay.wiki.org/assets
ssh root@bay.wiki.org 'ls -ltr .wiki/found.ward.bay.wiki.org/assets'
