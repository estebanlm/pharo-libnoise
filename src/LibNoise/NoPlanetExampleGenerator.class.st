Class {
	#name : 'NoPlanetExampleGenerator',
	#superclass : 'Object',
	#instVars : [
		'planet',
		'elevGrid',
		'destImage',
		'seaLevelInMeters',
		'resInMeters',
		'degExtent',
		'gridExtent',
		'metersPerDegree',
		'bitmapWriter'
	],
	#pools : [
		'NoPlanetExampleConstants'
	],
	#category : 'LibNoise-Example',
	#package : 'LibNoise',
	#tag : 'Example'
}

{ #category : 'instance creation' }
NoPlanetExampleGenerator class >> on: aPlanet [

	^ self new planet: aPlanet
]

{ #category : 'generating' }
NoPlanetExampleGenerator >> generate [
	| builder |
	
	builder := NuNoiseMapBuilderSphere new autoRelease.
	elevGrid := NuNoiseMap new autoRelease.
	
	builder 
		setBoundsSouthLatBound: SOUTH_COORD
			northLatBound: NORTH_COORD
			westLonBound: WEST_COORD 
			eastLonBound: EAST_COORD;
		setDestSizeDestWidth: GRID_WIDTH destHeight: GRID_HEIGHT;
		setSourceModule: self planet finalPlanet;
		setDestNoiseMap: elevGrid.
		
	builder build.
	
	degExtent := EAST_COORD - WEST_COORD.
	gridExtent := GRID_WIDTH asFloat.
	metersPerDegree := (PLANET_CIRCUMFERENCE / 360.0).
	resInMeters := (degExtent / gridExtent) * metersPerDegree.	
	seaLevelInMeters := (((SEA_LEVEL + 1.0) / 2.0) * (MAX_ELEV - MIN_ELEV)) + MIN_ELEV.
	
	destImage := NuImage new autoRelease.
	bitmapWriter := NuWriterBMP new autoRelease.

	self generateTer.
	self generateTerrain.
	self generateSurfaceTerrain.
	self generateSpecularityTerrain.
	self generateNormalTerrain
	
]

{ #category : 'generating' }
NoPlanetExampleGenerator >> generateNormalTerrain [
	| normalMapRenderer |

	normalMapRenderer := NuRendererNormalMap new autoRelease.
	normalMapRenderer
		setSourceNoiseMap: elevGrid;
		setDestImage: destImage;
		setBumpHeight: 1.0 / resInMeters;
		render.

  	"// Write the normal map as a Windows bitmap file (*.bmp)."
  	bitmapWriter 
		setSourceImage: (destImage);
  		setDestFilename: 'terrainnormal.bmp';
  		writeDestFile
]

{ #category : 'generating' }
NoPlanetExampleGenerator >> generateSpecularityTerrain [
	| specularityRenderer |

	"// Now generate the specularity map.  This defines the ""shininess"" of the
  // elevation grid.  Water areas are the shiniest."

	specularityRenderer := NuRendererImage new autoRelease.
	specularityRenderer 
		setSourceNoiseMap: elevGrid;
 		setDestImage: destImage;
  		clearGradient;
  		addGradientPointGradientPos: (MIN_ELEV              ) gradientColor: (NuColor fromArray: #(255 255 255 255)) autoRelease;
		addGradientPointGradientPos: (seaLevelInMeters      ) gradientColor: (NuColor fromArray: #(255 255 255 255)) autoRelease;
		addGradientPointGradientPos: (seaLevelInMeters + 1.0) gradientColor: (NuColor fromArray: #(  0   0   0 255)) autoRelease;
		addGradientPointGradientPos: (MAX_ELEV              ) gradientColor: (NuColor fromArray: #(128 128 128 255)) autoRelease;
		enableLight: false;
		render.

	bitmapWriter 
		setSourceImage: destImage;
		setDestFilename: 'terrainspec.bmp';
		writeDestFile
]

{ #category : 'generating' }
NoPlanetExampleGenerator >> generateSurfaceTerrain [
	| DEEP_SEA_LEVEL surfaceRenderer |
	
	DEEP_SEA_LEVEL := -256.
	"flatten"
	0 to: (GRID_HEIGHT - 1) do: [ :y | | pCur |
		pCur := (elevGrid getSlabPtr: y).
		0 to: (GRID_WIDTH - 1) do: [ :x |
			(pCur floatAt: 1) < (SEA_LEVEL + DEEP_SEA_LEVEL) ifTrue: [ 
				pCur floatAt: 1 put: (SEA_LEVEL + 256) ].
			pCur := pCur + 8.
	] ].

	surfaceRenderer := NuRendererImage new autoRelease. 
  	surfaceRenderer
		setSourceNoiseMap: elevGrid;
		setDestImage: destImage;
  		clearGradient;
  		addGradientPointGradientPos: (      -16384.0 + seaLevelInMeters) gradientColor: (NuColor newR:   3 g: 29 b: 63 a: 255) autoRelease;
  		addGradientPointGradientPos: (DEEP_SEA_LEVEL + seaLevelInMeters) gradientColor: (NuColor newR:   3 g: 29 b: 63 a: 255) autoRelease;
 		addGradientPointGradientPos: (          -1.0 + seaLevelInMeters) gradientColor: (NuColor newR:   7 g: 106 b: 127 a: 255) autoRelease;
		addGradientPointGradientPos: (           0.0 + seaLevelInMeters) gradientColor: (NuColor newR:  62 g: 86 b: 30 a: 255) autoRelease;
		addGradientPointGradientPos: (        1024.0 + seaLevelInMeters) gradientColor: (NuColor newR:  84 g: 96 b: 50 a: 255) autoRelease;
		addGradientPointGradientPos: (        2048.0 + seaLevelInMeters) gradientColor: (NuColor newR: 130 g: 127 b: 97 a: 255) autoRelease;
		addGradientPointGradientPos: (        3072.0 + seaLevelInMeters) gradientColor: (NuColor newR: 184 g: 163 b: 141 a: 255) autoRelease;
		addGradientPointGradientPos: (        4096.0 + seaLevelInMeters) gradientColor: (NuColor newR: 255 g: 255 b: 255 a: 255) autoRelease;
		addGradientPointGradientPos: (        6144.0 + seaLevelInMeters) gradientColor: (NuColor newR: 128 g: 255 b: 255 a: 255) autoRelease;
		addGradientPointGradientPos: (       16384.0 + seaLevelInMeters) gradientColor: (NuColor newR:   0 g: 0 b: 255 a: 255) autoRelease;
		enableLight: false;
		render.

 " // Write the image as a Windows bitmap file (*.bmp)."

  bitmapWriter 
	setSourceImage: destImage;
  	setDestFilename: 'terrainsurface.bmp';
  	writeDestFile
]

{ #category : 'generating' }
NoPlanetExampleGenerator >> generateTer [
	| terrainWriter |

	resInMeters > 240.0 ifTrue: [ ^ self ].
	
	terrainWriter := NuWriterTER new autoRelease.
	terrainWriter
		setSourceNoiseMap: elevGrid;
		setDestFilename: 'terrain.ter';
		setMetersPerPoint: resInMeters;
		writeDestFile
]

{ #category : 'generating' }
NoPlanetExampleGenerator >> generateTerrain [
	| imageRenderer |
	
	imageRenderer :=  NuRendererImage new autoRelease.
	imageRenderer
		setSourceNoiseMap: elevGrid;
 		setDestImage: destImage;
 		clearGradient; 
  		addGradientPointGradientPos: (-16384.0 + seaLevelInMeters) gradientColor: (NuColor newR:   0 g:   0 b:   0 a: 255) autoRelease;
		addGradientPointGradientPos: (    -256 + seaLevelInMeters) gradientColor: (NuColor newR:   6 g:  58 b: 127 a: 255) autoRelease;
		addGradientPointGradientPos: (    -1.0 + seaLevelInMeters) gradientColor: (NuColor newR:  14 g: 112 b: 192 a: 255) autoRelease;
		addGradientPointGradientPos: (     0.0 + seaLevelInMeters) gradientColor: (NuColor newR:  70 g: 120 b:  60 a: 255) autoRelease;
		addGradientPointGradientPos: (  1024.0 + seaLevelInMeters) gradientColor: (NuColor newR: 110 g: 140 b:  75 a: 255) autoRelease;
 		addGradientPointGradientPos: (  2048.0 + seaLevelInMeters) gradientColor: (NuColor newR: 160 g: 140 b: 111 a: 255) autoRelease;
 		addGradientPointGradientPos: (  3072.0 + seaLevelInMeters) gradientColor: (NuColor newR: 184 g: 163 b: 141 a: 255) autoRelease;
 		addGradientPointGradientPos: (  4096.0 + seaLevelInMeters) gradientColor: (NuColor newR: 255 g: 255 b: 255 a: 255) autoRelease;
		addGradientPointGradientPos: (  6144.0 + seaLevelInMeters) gradientColor: (NuColor newR: 128 g: 255 b: 255 a: 255) autoRelease;
		addGradientPointGradientPos: ( 16384.0 + seaLevelInMeters) gradientColor: (NuColor newR:   0 g:   0 b: 255 a: 255) autoRelease;
		enableLight: true;
		setLightContrast: (1.0 / resInMeters);
		setLightIntensity: 2.0;
		setLightElev: 45.0;
		setLightAzimuth: 135.0;
 		render.
		
  	bitmapWriter 
		setSourceImage: destImage;
  		setDestFilename: 'terrain.bmp';
  		writeDestFile
]

{ #category : 'accessing' }
NoPlanetExampleGenerator >> planet [

	^ planet
]

{ #category : 'accessing' }
NoPlanetExampleGenerator >> planet: aPlanet [

	planet := aPlanet
]
