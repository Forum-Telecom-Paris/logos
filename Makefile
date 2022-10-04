entry=logo_base
finalName=forum_logo
size=2048
options=--export-plain-svg
var_white_colored=_white-colored
var_white=_white
var_black=_black
var_normal=_normal
font_name=montserrat

all-docker: font all

all: dir generate normal white-colored white black grayscale rights clean

font:
	mkdir -p /usr/share/fonts/$(font_name)
	chmod 755 /usr/share/fonts/$(font_name)
	mkdir -p /usr/share/inkscape/fonts/$(font_name)
	mkdir -p /usr/local/share/fonts/$(font_name)
	curl https://raw.githubusercontent.com/JulietaUla/Montserrat/master/fonts/ttf/Montserrat-SemiBold.ttf > Montserrat-SemiBold.ttf
	chmod 644 Montserrat-SemiBold.ttf
	cp Montserrat-SemiBold.ttf /usr/share/fonts/$(font_name)
	cp Montserrat-SemiBold.ttf /usr/share/inkscape/fonts/$(font_name)
	cp Montserrat-SemiBold.ttf /usr/local/share/fonts/$(font_name)
	fc-cache -f -v

rights:
	chmod 777 logos/* # put all in 777 for the host
	ls -la logos

clean:
	rm *.svg

dir:
	mkdir -p logos
	chmod 777 logos

generate:
	python3 generate.py

normal:
	inkscape $(options) $(entry).svg --export-text-to-path -o logos/$(finalName).svg
	inkscape $(options) -w $(size) -h $(size) logos/$(finalName).svg -o logos/forum$(var_normal)_logo$(size)px.png
	inkscape $(options) -b "#FFFFFF" -w $(size) -h $(size) logos/$(finalName).svg -o logos/forum$(var_normal)_white_logo$(size)px.png

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
	# note : it use the "normal" logo
	convert logos/forum$(var_normal)_logo$(size)px.png  -colorspace Gray logos/forum_grayscale_logo$(size)px.png
	convert logos/forum$(var_normal)_white_logo$(size)px.png  -colorspace Gray logos/forum_grayscale_white_logo$(size)px.png

docker:
	docker build -t docker-forum . && docker run -v "$(shell pwd)":/app docker-forum