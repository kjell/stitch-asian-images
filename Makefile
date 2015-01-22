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
		-fuzz 80% -trim -resize 4500 \
		-set filename:fname '%t-trimmed-resized' +adjoin '%[filename:fname].tif'
	rm mia_6015695-trimmed-resized.tif
	mkdir -p rice-trimmed-resized
	mv *trimmed-resized.tif rice-trimmed-resized/

rice: rice-trimmed-resized
	montage rice-trimmed-resized/*.tif -verbose -background black -bordercolor black \
		-mode concatenate -tile 8x2 -border 5 rice.tif
	vipsthumbnail --size=1000 rice.tif
