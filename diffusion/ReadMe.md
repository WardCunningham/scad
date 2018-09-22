
Double Digit Prints
===================

Select next print number, start and follow script.

$ sh edition.sh 10
wait 50 minutes

Remove form-10.scad
Remove form-10.stl


Limited Edition Prints
======================

Select next print number.
Edit into Readme.md
Edit into aggregate.rb `{sig 10}`

Empty frames and picts directories
`time ruby aggregate.rb >form-10.scad`
wait 80 sec

Triangulate with OpenSCAD, save as form-10.stl
`time openscad -o form-10.stl form-10.scad`
wait 45 min

Upload to Eiger, disable supports, print
takes 6 min

Screenshot from Eiger
Move screenshot to images/form-10.png
Upload to http://scad.fed.wiki/limited-edition-prints.html
`time sh picts.sh`
wait 2 hours

`time sh making.sh`
wait 10 min

Move making.png to making/making-form-10.png
Upload to http://scad.fed.wiki/limited-edition-prints.html

Remove form-10.scad
Remove form-10.stl

