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

rice:
	convert rice-81* -resize 5133x rice-resized.jpg
	montage rice-resized*.jpg -mode concatenate -tile 4x4 -border 5 rice.jpg
	vipsthumbnail --size=1000 rice.jpg
