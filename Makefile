entry=logo_base
finalName=forum_logo
size=2048
options=--export-plain-svg
var_white_colored=_white-colored
var_white=_white
var_black=_black

all: dir generate normal white-colored white black grayscale

dir:
	mkdir -p logos

generate:
	python3 generate.py

normal:
	inkscape $(options) $(entry).svg --export-text-to-path -o logos/$(finalName).svg
	inkscape $(options) -w $(size) -h $(size) logos/$(finalName).svg -o logos/$(finalName)$(size)px.png

white-colored:
	inkscape $(options) $(entry)$(var_white_colored).svg --export-text-to-path -o logos/$(finalName)$(var_white_colored).svg
	inkscape $(options) -w $(size) -h $(size) logos/$(finalName)$(var_white_colored).svg -o logos/forum$(var_white_colored)_logo$(size)px.png
	inkscape $(options) -b "#000000" -w $(size) -h $(size) logos/$(finalName)$(var_white_colored).svg -o logos/forum$(var_white_colored)_black_logo$(size)px.png

black:
	inkscape $(options) $(entry)$(var_black).svg --export-text-to-path -o logos/$(finalName)$(var_black).svg
	inkscape $(options) -w $(size) -h $(size) logos/$(finalName)$(var_black).svg -o logos/forum$(var_black)_logo$(size)px.png
	inkscape $(options) -b "#FFFFFF" -w $(size) -h $(size) logos/$(finalName)$(var_black).svg -o logos/forum$(var_black)_white_logo$(size)px.png

white:
	inkscape $(options) $(entry)$(var_white).svg --export-text-to-path -o logos/$(finalName)$(var_white).svg
	inkscape $(options) -w $(size) -h $(size) logos/$(finalName)$(var_white).svg -o logos/forum$(var_white)_logo$(size)px.png
	inkscape $(options) -b "#000000" -w $(size) -h $(size) logos/$(finalName)$(var_white).svg -o logos/forum$(var_white)_black_logo$(size)px.png

grayscale:
	convert logos/$(finalName)$(size)px.png  -colorspace Gray logos/forum_grayscale_logo$(size)px.png
