"
/// Noise module that moves the coordinates of the input value before
    /// returning the output value from a source module.
    ///
    /// @image html moduletranslatepoint.png
    ///
    /// The GetValue() method moves the ( @a x, @a y, @a z ) coordinates of
    /// the input value by a translation amount before returning the output
    /// value from the source module.  To set the translation amount, call
    /// the SetTranslation() method.  To set the translation amount to
    /// apply to the individual @a x, @a y, or @a z coordinates, call the
    /// SetXTranslation(), SetYTranslation() or SetZTranslation() methods,
    /// respectively.
    ///
    /// This noise module requires one source module.
"
Class {
	#name : 'NoTranslatePoint',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'instance creation' }
NoTranslatePoint class >> new [

	^ (self translatePoint_new) initialize
]

{ #category : 'private' }
NoTranslatePoint class >> translatePoint_new [
	"/// Constructor.
	 ///
	 /// The default translation amount to apply to the @a x coordinate is
	 /// set to noise::module::DEFAULT_TRANSLATE_POINT_X.
	 ///
	 /// The default translation amount to apply to the @a y coordinate is
	 /// set to noise::module::DEFAULT_TRANSLATE_POINT_Y.
	 ///
	 /// The default translation amount to apply to the @a z coordinate is
	 /// set to noise::module::DEFAULT_TRANSLATE_POINT_Z."

	self ffiCall: #(no_noise_module_TranslatePoint* no_noise_module_TranslatePoint_new())
]

{ #category : 'finalizing' }
NoTranslatePoint >> dispose [

	self ffiCall: #(void no_noise_module_TranslatePoint_dispose(no_noise_module_TranslatePoint* self))
]

{ #category : 'public' }
NoTranslatePoint >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_TranslatePoint_GetSourceModuleCount(no_noise_module_TranslatePoint* self))
]

{ #category : 'public' }
NoTranslatePoint >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_TranslatePoint_GetValue(no_noise_module_TranslatePoint* self, double x, double y, double z))
]

{ #category : 'public' }
NoTranslatePoint >> getXTranslation [
	"/// Returns the translation amount to apply to the @a x coordinate of
	 /// the input value.
	 ///
	 /// @returns The translation amount to apply to the @a x coordinate."

	self ffiCall: #(double no_noise_module_TranslatePoint_GetXTranslation(no_noise_module_TranslatePoint* self))
]

{ #category : 'public' }
NoTranslatePoint >> getYTranslation [
	"/// Returns the translation amount to apply to the @a y coordinate of
	 /// the input value.
	 ///
	 /// @returns The translation amount to apply to the @a y coordinate."

	self ffiCall: #(double no_noise_module_TranslatePoint_GetYTranslation(no_noise_module_TranslatePoint* self))
]

{ #category : 'public' }
NoTranslatePoint >> getZTranslation [
	"/// Returns the translation amount to apply to the @a z coordinate of
	 /// the input value.
	 ///
	 /// @returns The translation amount to apply to the @a z coordinate."

	self ffiCall: #(double no_noise_module_TranslatePoint_GetZTranslation(no_noise_module_TranslatePoint* self))
]

{ #category : 'public' }
NoTranslatePoint >> setTranslation: translation [
	"/// Sets the translation amount to apply to the input value.
	 ///
	 /// @param translation The translation amount to apply.
	 ///
	 /// The GetValue() method moves the ( @a x, @a y, @a z ) coordinates
	 /// of the input value by a translation amount before returning the
	 /// output value from the source module"

	self ffiCall: #(void no_noise_module_TranslatePoint_SetTranslation_1(no_noise_module_TranslatePoint* self, double translation))
]

{ #category : 'public' }
NoTranslatePoint >> setTranslationXTranslation: xTranslation yTranslation: yTranslation zTranslation: zTranslation [
	"/// Sets the translation amounts to apply to the ( @a x, @a y, @a z )
	 /// coordinates of the input value.
	 ///
	 /// @param xTranslation The translation amount to apply to the @a x
	 /// coordinate.
	 /// @param yTranslation The translation amount to apply to the @a y
	 /// coordinate.
	 /// @param zTranslation The translation amount to apply to the @a z
	 /// coordinate.
	 ///
	 /// The GetValue() method moves the ( @a x, @a y, @a z ) coordinates
	 /// of the input value by a translation amount before returning the
	 /// output value from the source module"

	self ffiCall: #(void no_noise_module_TranslatePoint_SetTranslation_2(no_noise_module_TranslatePoint* self, double xTranslation, double yTranslation, double zTranslation))
]

{ #category : 'public' }
NoTranslatePoint >> setXTranslation: xTranslation [
	"/// Sets the translation amount to apply to the @a x coordinate of the
	 /// input value.
	 ///
	 /// @param xTranslation The translation amount to apply to the @a x
	 /// coordinate.
	 ///
	 /// The GetValue() method moves the ( @a x, @a y, @a z ) coordinates
	 /// of the input value by a translation amount before returning the
	 /// output value from the source module"

	self ffiCall: #(void no_noise_module_TranslatePoint_SetXTranslation(no_noise_module_TranslatePoint* self, double xTranslation))
]

{ #category : 'public' }
NoTranslatePoint >> setYTranslation: yTranslation [
	"/// Sets the translation amount to apply to the @a y coordinate of the
	 /// input value.
	 ///
	 /// @param yTranslation The translation amount to apply to the @a y
	 /// coordinate.
	 ///
	 /// The GetValue() method moves the ( @a x, @a y, @a z ) coordinates
	 /// of the input value by a translation amount before returning the
	 /// output value from the source module"

	self ffiCall: #(void no_noise_module_TranslatePoint_SetYTranslation(no_noise_module_TranslatePoint* self, double yTranslation))
]

{ #category : 'public' }
NoTranslatePoint >> setZTranslation: zTranslation [
	"/// Sets the translation amount to apply to the @a z coordinate of the
	 /// input value.
	 ///
	 /// @param zTranslation The translation amount to apply to the @a z
	 /// coordinate.
	 ///
	 /// The GetValue() method moves the ( @a x, @a y, @a z ) coordinates
	 /// of the input value by a translation amount before returning the
	 /// output value from the source module"

	self ffiCall: #(void no_noise_module_TranslatePoint_SetZTranslation(no_noise_module_TranslatePoint* self, double zTranslation))
]
