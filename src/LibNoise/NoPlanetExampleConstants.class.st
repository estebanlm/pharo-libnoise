Class {
	#name : 'NoPlanetExampleConstants',
	#superclass : 'SharedPool',
	#classVars : [
		'BADLANDS_AMOUNT',
		'BADLANDS_LACUNARITY',
		'BADLANDS_TWIST',
		'CONTINENT_FREQUENCY',
		'CONTINENT_HEIGHT_SCALE',
		'CONTINENT_LACUNARITY',
		'CUR_SEED',
		'EAST_COORD',
		'GRID_HEIGHT',
		'GRID_WIDTH',
		'HILLS_AMOUNT',
		'HILLS_LACUNARITY',
		'HILLS_TWIST',
		'MAX_ELEV',
		'MIN_ELEV',
		'MOUNTAINS_AMOUNT',
		'MOUNTAINS_TWIST',
		'MOUNTAIN_GLACIATION',
		'MOUNTAIN_LACUNARITY',
		'NORTH_COORD',
		'PLAINS_LACUNARITY',
		'PLANET_CIRCUMFERENCE',
		'RIVER_DEPTH',
		'SEA_LEVEL',
		'SHELF_LEVEL',
		'SOUTH_COORD',
		'TERRAIN_OFFSET',
		'WEST_COORD'
	],
	#category : 'LibNoise-Example',
	#package : 'LibNoise',
	#tag : 'Example'
}

{ #category : 'class initialization' }
NoPlanetExampleConstants class >> initialize [

	"// Southernmost coordinate of elevation grid."
	SOUTH_COORD := -90.0.

	"// Northernmost coordinate of elevation grid."
  	NORTH_COORD := 90.0.

	"// Westernmost coordinate of elevation grid."
	WEST_COORD := -180.0.

  	"// Easternmost coordinate of elevation grid."  
	EAST_COORD := 180.0.

	"// Width of elevation grid, in points."
  	GRID_WIDTH := 4096.

  	"//Height of elevation grid, in points."
	GRID_HEIGHT := 2048.

	"// Planet seed.  Change this to generate a different planet."
	CUR_SEED := 0.

	"// Circumference of the planet, in meters."
	PLANET_CIRCUMFERENCE := 44236800.0.

	"// Minimum elevation on the planet, in meters.  This value is approximate."
	MIN_ELEV := -8192.0.

	"// Maximum elevation on the planet, in meters.  This value is approximate."
	MAX_ELEV := 8192.0.

	"// Frequency of the planet's continents.  Higher frequency produces smaller,
	// more numerous continents.  This value is measured in radians."
	CONTINENT_FREQUENCY := 1.0.

  "// Lacunarity of the planet's continents.  Changing this value produces
  // slightly different continents.  For the best results, this value should
  // be random, but close to 2.0."
	CONTINENT_LACUNARITY := 2.208984375.

  "// Lacunarity of the planet's mountains.  Changing this value produces
  // slightly different mountains.  For the best results, this value should
  // be random, but close to 2.0."
	MOUNTAIN_LACUNARITY := 2.142578125.

  "// Lacunarity of the planet's hills.  Changing this value produces slightly
  // different hills.  For the best results, this value should be random, but
  // close to 2.0."
	HILLS_LACUNARITY := 2.162109375.

  "// Lacunarity of the planet's plains.  Changing this value produces slightly
  // different plains.  For the best results, this value should be random, but
  // close to 2.0."
	PLAINS_LACUNARITY := 2.314453125.

  "// Lacunarity of the planet's badlands.  Changing this value produces
  // slightly different badlands.  For the best results, this value should be
  // random, but close to 2.0."
	BADLANDS_LACUNARITY := 2.212890625.

  "// Specifies the ""twistiness"" of the mountains."
	MOUNTAINS_TWIST := 1.0.

  "// Specifies the ""twistiness"" of the hills."
	HILLS_TWIST := 1.0.

  "// Specifies the ""twistiness"" of the badlands."
	BADLANDS_TWIST := 1.0.

  "// Specifies the planet's sea level.  This value must be between -1.0
  // (minimum planet elevation) and +1.0 (maximum planet elevation.)"
	SEA_LEVEL := 0.0.

  "// Specifies the level on the planet in which continental shelves appear.
  // This value must be between -1.0 (minimum planet elevation) and +1.0
  // (maximum planet elevation), and must be less than SEA_LEVEL."
	SHELF_LEVEL := -0.375.

  "// Determines the amount of mountainous terrain that appears on the
  // planet.  Values range from 0.0 (no mountains) to 1.0 (all terrain is
  // covered in mountains).  Mountainous terrain will overlap hilly terrain.
  // Because the badlands terrain may overlap parts of the mountainous
  // terrain, setting MOUNTAINS_AMOUNT to 1.0 may not completely cover the
  // terrain in mountains."
	MOUNTAINS_AMOUNT := 0.5.

  "// Determines the amount of hilly terrain that appears on the planet.
  // Values range from 0.0 (no hills) to 1.0 (all terrain is covered in
  // hills).  This value must be less than MOUNTAINS_AMOUNT.  Because the
  // mountainous terrain will overlap parts of the hilly terrain, and
  // the badlands terrain may overlap parts of the hilly terrain, setting
  // HILLS_AMOUNT to 1.0 may not completely cover the terrain in hills."
	HILLS_AMOUNT := (1.0 + MOUNTAINS_AMOUNT) / 2.0.

  "// Determines the amount of badlands terrain that covers the planet.
  // Values range from 0.0 (no badlands) to 1.0 (all terrain is covered in
  // badlands.)  Badlands terrain will overlap any other type of terrain."
	BADLANDS_AMOUNT := 0.03125.

  "// Offset to apply to the terrain type definition.  Low values (< 1.0) cause
  // the rough areas to appear only at high elevations.  High values (> 2.0)
  // cause the rough areas to appear at any elevation.  The percentage of
  // rough areas on the planet are independent of this value."
	TERRAIN_OFFSET := 1.0.

  "// Specifies the amount of ""glaciation"" on the mountains.  This value
  // should be close to 1.0 and greater than 1.0."
	MOUNTAIN_GLACIATION := 1.375.

  "// Scaling to apply to the base continent elevations, in planetary elevation
  // units."
	CONTINENT_HEIGHT_SCALE := (1.0 - SEA_LEVEL) / 4.0.

  "// Maximum depth of the rivers, in planetary elevation units."
	RIVER_DEPTH := 0.0234375
]
