genji-montage.tif: 
	convert clark_1995012ab_0102* -resize 2400x clark-resized.tif
	montage clark-resized*.tif -mode concatenate -tile 1x2 -border 5 genji-montage.tif
	rm clark-resized*.tif
	vipsthumbnail --size=1000 genji-montage.tif

genji-montage-cropped.tif:
	convert genji-montage.tif -shave 5 genji-montage-cropped.tif
	vipsthumbnail --size=1000 genji-montage.tif

rice:
	convert rice-81* -resize 5133x rice-resized.jpg
	montage rice-resized*.jpg -mode concatenate -tile 4x4 -border 5 rice.jpg
	vipsthumbnail --size=1000 rice.jpg
