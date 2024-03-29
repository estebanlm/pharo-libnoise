"
/// Noise module that outputs Voronoi cells.
    ///
    /// @image html modulevoronoi.png
    ///
    /// In mathematics, a <i>Voronoi cell</i> is a region containing all the
    /// points that are closer to a specific <i>seed point</i> than to any
    /// other seed point.  These cells mesh with one another, producing
    /// polygon-like formations.
    ///
    /// By default, this noise module randomly places a seed point within
    /// each unit cube.  By modifying the <i>frequency</i> of the seed points,
    /// an application can change the distance between seed points.  The
    /// higher the frequency, the closer together this noise module places
    /// the seed points, which reduces the size of the cells.  To specify the
    /// frequency of the cells, call the SetFrequency() method.
    ///
    /// This noise module assigns each Voronoi cell with a random constant
    /// value from a coherent-noise function.  The <i>displacement value</i>
    /// controls the range of random values to assign to each cell.  The
    /// range of random values is +/- the displacement value.  Call the
    /// SetDisplacement() method to specify the displacement value.
    ///
    /// To modify the random positions of the seed points, call the SetSeed()
    /// method.
    ///
    /// This noise module can optionally add the distance from the nearest
    /// seed to the output value.  To enable this feature, call the
    /// EnableDistance() method.  This causes the points in the Voronoi cells
    /// to increase in value the further away that point is from the nearest
    /// seed point.
    ///
    /// Voronoi cells are often used to generate cracked-mud terrain
    /// formations or crystal-like textures
    ///
    /// This noise module requires no source modules.
"
Class {
	#name : 'NoVoronoi',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'instance creation' }
NoVoronoi class >> new [

	^ (self voronoi_new) initialize
]

{ #category : 'private' }
NoVoronoi class >> voronoi_new [
	"/// Constructor.
	 ///
	 /// The default displacement value is set to
	 /// noise::module::DEFAULT_VORONOI_DISPLACEMENT.
	 ///
	 /// The default frequency is set to
	 /// noise::module::DEFAULT_VORONOI_FREQUENCY.
	 ///
	 /// The default seed value is set to
	 /// noise::module::DEFAULT_VORONOI_SEED."

	self ffiCall: #(no_noise_module_Voronoi* no_noise_module_Voronoi_new())
]

{ #category : 'finalizing' }
NoVoronoi >> dispose [

	self ffiCall: #(void no_noise_module_Voronoi_dispose(no_noise_module_Voronoi* self))
]

{ #category : 'public' }
NoVoronoi >> enableDistance: enable [
	"/// Enables or disables applying the distance from the nearest seed
	 /// point to the output value.
	 ///
	 /// @param enable Specifies whether to apply the distance to the
	 /// output value or not.
	 ///
	 /// Applying the distance from the nearest seed point to the output
	 /// value causes the points in the Voronoi cells to increase in value
	 /// the further away that point is from the nearest seed point.
	 /// Setting this value to @a true (and setting the displacement to a
	 /// near-zero value) causes this noise module to generate cracked mud
	 /// formations."

	self ffiCall: #(void no_noise_module_Voronoi_EnableDistance(no_noise_module_Voronoi* self, bool enable))
]

{ #category : 'public' }
NoVoronoi >> getDisplacement [
	"/// Returns the displacement value of the Voronoi cells.
	 ///
	 /// @returns The displacement value of the Voronoi cells.
	 ///
	 /// This noise module assigns each Voronoi cell with a random constant
	 /// value from a coherent-noise function.  The <i>displacement
	 /// value</i> controls the range of random values to assign to each
	 /// cell.  The range of random values is +/- the displacement value."

	self ffiCall: #(double no_noise_module_Voronoi_GetDisplacement(no_noise_module_Voronoi* self))
]

{ #category : 'public' }
NoVoronoi >> getFrequency [
	"/// Returns the frequency of the seed points.
	 ///
	 /// @returns The frequency of the seed points.
	 ///
	 /// The frequency determines the size of the Voronoi cells and the
	 /// distance between these cells."

	self ffiCall: #(double no_noise_module_Voronoi_GetFrequency(no_noise_module_Voronoi* self))
]

{ #category : 'public' }
NoVoronoi >> getSeed [
	"/// Returns the seed value used by the Voronoi cells
	 ///
	 /// @returns The seed value.
	 ///
	 /// The positions of the seed values are calculated by a
	 /// coherent-noise function.  By modifying the seed value, the output
	 /// of that function changes."

	self ffiCall: #(int no_noise_module_Voronoi_GetSeed(no_noise_module_Voronoi* self))
]

{ #category : 'public' }
NoVoronoi >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Voronoi_GetSourceModuleCount(no_noise_module_Voronoi* self))
]

{ #category : 'public' }
NoVoronoi >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Voronoi_GetValue(no_noise_module_Voronoi* self, double x, double y, double z))
]

{ #category : 'public' }
NoVoronoi >> isDistanceEnabled [
	"/// Determines if the distance from the nearest seed point is applied
	 /// to the output value.
	 ///
	 /// @returns
	 /// - @a true if the distance is applied to the output value.
	 /// - @a false if not.
	 ///
	 /// Applying the distance from the nearest seed point to the output
	 /// value causes the points in the Voronoi cells to increase in value
	 /// the further away that point is from the nearest seed point."

	self ffiCall: #(bool no_noise_module_Voronoi_IsDistanceEnabled(no_noise_module_Voronoi* self))
]

{ #category : 'public' }
NoVoronoi >> setDisplacement: displacement [
	"/// Sets the displacement value of the Voronoi cells.
	 ///
	 /// @param displacement The displacement value of the Voronoi cells.
	 ///
	 /// This noise module assigns each Voronoi cell with a random constant
	 /// value from a coherent-noise function.  The <i>displacement
	 /// value</i> controls the range of random values to assign to each
	 /// cell.  The range of random values is +/- the displacement value."

	self ffiCall: #(void no_noise_module_Voronoi_SetDisplacement(no_noise_module_Voronoi* self, double displacement))
]

{ #category : 'public' }
NoVoronoi >> setFrequency: frequency [
	"/// Sets the frequency of the seed points.
	 ///
	 /// @param frequency The frequency of the seed points.
	 ///
	 /// The frequency determines the size of the Voronoi cells and the
	 /// distance between these cells."

	self ffiCall: #(void no_noise_module_Voronoi_SetFrequency(no_noise_module_Voronoi* self, double frequency))
]

{ #category : 'public' }
NoVoronoi >> setSeed: seed [
	"/// Sets the seed value used by the Voronoi cells
	 ///
	 /// @param seed The seed value.
	 ///
	 /// The positions of the seed values are calculated by a
	 /// coherent-noise function.  By modifying the seed value, the output
	 /// of that function changes."

	self ffiCall: #(void no_noise_module_Voronoi_SetSeed(no_noise_module_Voronoi* self, int seed))
]
