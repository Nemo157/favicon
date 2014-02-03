favicon_sizes = 16 32
favicon_images = $(favicon_sizes:%=%.png)

svgs = $(wildcard *.svg) 
pngs = $(svgs:.svg=.png) 

all: favicon.ico $(pngs)

favicon.ico: $(favicon_images)
	convert $^ $@

%.png: %.svg
	svg2png $< $@ --width $*
	optipng $@ -quiet

clean:
	-rm *.png *.ico

rebuild: clean all
