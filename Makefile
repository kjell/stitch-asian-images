# Scenes from the Tale of Genji in the Four Seasons: Autumn and Winter
# Gift of the Clark Center for Japanese Art & Culture
# 2013.29.14.1,2

genji-montage.tif: 
	convert clark_1995012ab_0102* -resize 2400x clark-resized.tif
	montage clark-resized*.tif -mode concatenate -tile 1x2 -border 5 genji-montage.tif
	rm clark-resized*.tif
	vipsthumbnail --size=1000 genji-montage.tif

genji-montage-cropped.tif:
	convert genji-montage.tif -shave 5 genji-montage-cropped.tif
	vipsthumbnail --size=1000 genji-montage-cropped.tif

# Kanō Sanraku, Rice Farming in the Four Seasons
# The William Hood Dunwoody Fund and Gift of funds from Louis W. Hill, Jr.
# 81.1.1-16

rice-trimmed-resized:
	convert mia_6015* -bordercolor black -border 1 \
		-fuzz 80% -trim -resize 5100 \
		-set filename:fname '%t-trimmed-resized' +adjoin '%[filename:fname].tif'
	rm mia_6015695-trimmed-resized.tif
	mkdir -p rice-trimmed-resized
	mv *trimmed-resized.tif rice-trimmed-resized/
	make order

order:
		mv rice-trimmed-resized/{*690*,0.tif}
		mv rice-trimmed-resized/{*688*,1.tif}
		mv rice-trimmed-resized/{*687*,2.tif}
		mv rice-trimmed-resized/{*686*,3.tif}
		mv rice-trimmed-resized/{*694*,4.tif}
		mv rice-trimmed-resized/{*696*,5.tif}
		mv rice-trimmed-resized/{*699*,6.tif}
		mv rice-trimmed-resized/{*700*,7.tif}
		mv rice-trimmed-resized/{*697*,8.tif}
		mv rice-trimmed-resized/{*698*,9.tif}
		mv rice-trimmed-resized/{*702*,10.tif}
		mv rice-trimmed-resized/{*701*,11.tif}
		mv rice-trimmed-resized/{*679*,12.tif}
		mv rice-trimmed-resized/{*681*,13.tif}
		mv rice-trimmed-resized/{*684*,14.tif}
		mv rice-trimmed-resized/{*685*,15.tif}
		rename 's/\d+/sprintf("%04d",$&)/e' rice-trimmed-resized/*

rice: rice-trimmed-resized
	montage rice-trimmed-resized/*.tif \
		-verbose -background black -bordercolor black \
		-mode concatenate -tile 8x2 -border 5 TIFF64:rice.tif
	vipsthumbnail --size=1000 rice.tif
