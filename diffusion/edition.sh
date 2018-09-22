# create a new edition of diffusion limited aggregation
# usage: sh edition.sh 11

echo; echo You have editions
ls -tr images/more

echo; echo Ready to create edition form-$1?
read ch

echo; echo Creating scad file for 80 sec
ruby aggregate.rb $1 > form-$1.scad

echo; echo Creating png file for 30 sec
openscad -o images/more/form-$1.png form-$1.scad
open images/more/form-$1.png

echo; echo Posting png file to wiki for 20 sec
scp images/more/form-$1.png asia:.wiki/scad.fed.wiki/assets/diffusion/form/more
open 'http://scad.fed.wiki/view/welcome-visitors/view/limited-edition-prints/view/double-digit-prints'

echo; echo Creating stl file for 45 min
openscad -o form-$1.stl form-$1.scad
ls -ltr form-*

echo; echo Ready to upload, supports off, save, print for 12 hours
open 'https://www.eiger.io/library'
