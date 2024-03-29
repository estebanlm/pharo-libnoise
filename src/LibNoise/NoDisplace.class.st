"
/// Noise module that uses three source modules to displace each
    /// coordinate of the input value before returning the output value from
    /// a source module.
    ///
    /// @image html moduledisplace.png
    ///
    /// Unlike most other noise modules, the index value assigned to a source
    /// module determines its role in the displacement operation:
    /// - Source module 0 (left in the diagram) outputs a value.
    /// - Source module 1 (lower left in the diagram) specifies the offset to
    ///   apply to the @a x coordinate of the input value.
    /// - Source module 2 (lower center in the diagram) specifies the
    ///   offset to apply to the @a y coordinate of the input value.
    /// - Source module 3 (lower right in the diagram) specifies the offset
    ///   to apply to the @a z coordinate of the input value.
    ///
    /// The GetValue() method modifies the ( @a x, @a y, @a z ) coordinates of
    /// the input value using the output values from the three displacement
    /// modules before retrieving the output value from the source module.
    ///
    /// The noise::module::Turbulence noise module is a special case of the
    /// displacement module; internally, there are three Perlin-noise modules
    /// that perform the displacement operation.
    ///
    /// This noise module requires four source modules.
"
Class {
	#name : 'NoDisplace',
	#superclass : 'NoModule',
	#category : 'LibNoise-Module',
	#package : 'LibNoise',
	#tag : 'Module'
}

{ #category : 'private' }
NoDisplace class >> displace_new [
	"/// Constructor."

	self ffiCall: #(no_noise_module_Displace* no_noise_module_Displace_new())
]

{ #category : 'instance creation' }
NoDisplace class >> new [

	^ (self displace_new) initialize
]

{ #category : 'finalizing' }
NoDisplace >> dispose [

	self ffiCall: #(void no_noise_module_Displace_dispose(no_noise_module_Displace* self))
]

{ #category : 'public' }
NoDisplace >> getSourceModuleCount [

	self ffiCall: #(int no_noise_module_Displace_GetSourceModuleCount(no_noise_module_Displace* self))
]

{ #category : 'public' }
NoDisplace >> getValueX: x y: y z: z [

	self ffiCall: #(double no_noise_module_Displace_GetValue(no_noise_module_Displace* self, double x, double y, double z))
]

{ #category : 'public' }
NoDisplace >> getXDisplaceModule [
	"/// Returns the @a x displacement module.
	 ///
	 /// @returns A reference to the @a x displacement module.
	 ///
	 /// @pre This displacement module has been added to this noise module
	 /// via a call to SetSourceModule() or SetXDisplaceModule().
	 ///
	 /// @throw noise::ExceptionNoModule See the preconditions for more
	 /// information.
	 ///
	 /// The GetValue() method displaces the input value by adding the output
	 /// value from this displacement module to the @a x coordinate of the
	 /// input value before returning the output value from the source
	 /// module."

	self ffiCall: #(no_noise_module_Module* no_noise_module_Displace_GetXDisplaceModule(no_noise_module_Displace* self))
]

{ #category : 'public' }
NoDisplace >> getYDisplaceModule [
	"/// Returns the @a y displacement module.
	 ///
	 /// @returns A reference to the @a y displacement module.
	 ///
	 /// @pre This displacement module has been added to this noise module
	 /// via a call to SetSourceModule() or SetYDisplaceModule().
	 ///
	 /// @throw noise::ExceptionNoModule See the preconditions for more
	 /// information.
	 ///
	 /// The GetValue() method displaces the input value by adding the output
	 /// value from this displacement module to the @a y coordinate of the
	 /// input value before returning the output value from the source
	 /// module."

	self ffiCall: #(no_noise_module_Module* no_noise_module_Displace_GetYDisplaceModule(no_noise_module_Displace* self))
]

{ #category : 'public' }
NoDisplace >> getZDisplaceModule [
	"/// Returns the @a z displacement module.
	 ///
	 /// @returns A reference to the @a z displacement module.
	 ///
	 /// @pre This displacement module has been added to this noise module
	 /// via a call to SetSourceModule() or SetZDisplaceModule().
	 ///
	 /// @throw noise::ExceptionNoModule See the preconditions for more
	 /// information.
	 ///
	 /// The GetValue() method displaces the input value by adding the output
	 /// value from this displacement module to the @a z coordinate of the
	 /// input value before returning the output value from the source
	 /// module."

	self ffiCall: #(no_noise_module_Module* no_noise_module_Displace_GetZDisplaceModule(no_noise_module_Displace* self))
]

{ #category : 'public' }
NoDisplace >> setDisplaceModulesXDisplaceModule: xDisplaceModule yDisplaceModule: yDisplaceModule zDisplaceModule: zDisplaceModule [
	"/// Sets the @a x, @a y, and @a z displacement modules.
	 ///
	 /// @param xDisplaceModule Displacement module that displaces the @a x
	 /// coordinate of the input value.
	 /// @param yDisplaceModule Displacement module that displaces the @a y
	 /// coordinate of the input value.
	 /// @param zDisplaceModule Displacement module that displaces the @a z
	 /// coordinate of the input value.
	 ///
	 /// The GetValue() method displaces the input value by adding the output
	 /// value from each of the displacement modules to the corresponding
	 /// coordinates of the input value before returning the output value
	 /// from the source module.
	 ///
	 /// This method assigns an index value of 1 to the @a x displacement
	 /// module, an index value of 2 to the @a y displacement module, and an
	 /// index value of 3 to the @a z displacement module.
	 ///
	 /// These displacement modules must exist throughout the lifetime of
	 /// this noise module unless another displacement module replaces it."

	self ffiCall: #(void no_noise_module_Displace_SetDisplaceModules(no_noise_module_Displace* self, no_noise_module_Module* xDisplaceModule, no_noise_module_Module* yDisplaceModule, no_noise_module_Module* zDisplaceModule))
]

{ #category : 'public' }
NoDisplace >> setXDisplaceModule: xDisplaceModule [
	"/// Sets the @a x displacement module.
	 ///
	 /// @param xDisplaceModule Displacement module that displaces the @a x
	 /// coordinate.
	 ///
	 /// The GetValue() method displaces the input value by adding the output
	 /// value from this displacement module to the @a x coordinate of the
	 /// input value before returning the output value from the source
	 /// module.
	 ///
	 /// This method assigns an index value of 1 to the @a x displacement
	 /// module.  Passing this displacement module to this method produces
	 /// the same results as passing this displacement module to the
	 /// SetSourceModule() method while assigning it an index value of 1.
	 ///
	 /// This displacement module must exist throughout the lifetime of this
	 /// noise module unless another displacement module replaces it."

	self ffiCall: #(void no_noise_module_Displace_SetXDisplaceModule(no_noise_module_Displace* self, no_noise_module_Module* xDisplaceModule))
]

{ #category : 'public' }
NoDisplace >> setYDisplaceModule: yDisplaceModule [
	"/// Sets the @a y displacement module.
	 ///
	 /// @param yDisplaceModule Displacement module that displaces the @a y
	 /// coordinate.
	 ///
	 /// The GetValue() method displaces the input value by adding the output
	 /// value from this displacement module to the @a y coordinate of the
	 /// input value before returning the output value from the source
	 /// module.
	 ///
	 /// This method assigns an index value of 2 to the @a y displacement
	 /// module.  Passing this displacement module to this method produces
	 /// the same results as passing this displacement module to the
	 /// SetSourceModule() method while assigning it an index value of 2.
	 ///
	 /// This displacement module must exist throughout the lifetime of this
	 /// noise module unless another displacement module replaces it."

	self ffiCall: #(void no_noise_module_Displace_SetYDisplaceModule(no_noise_module_Displace* self, no_noise_module_Module* yDisplaceModule))
]

{ #category : 'public' }
NoDisplace >> setZDisplaceModule: zDisplaceModule [
	"/// Sets the @a z displacement module.
	 ///
	 /// @param zDisplaceModule Displacement module that displaces the @a z
	 /// coordinate.
	 ///
	 /// The GetValue() method displaces the input value by adding the output
	 /// value from this displacement module to the @a z coordinate of the
	 /// input value before returning the output value from the source
	 /// module.
	 ///
	 /// This method assigns an index value of 3 to the @a z displacement
	 /// module.  Passing this displacement module to this method produces
	 /// the same results as passing this displacement module to the
	 /// SetSourceModule() method while assigning it an index value of 3.
	 ///
	 /// This displacement module must exist throughout the lifetime of this
	 /// noise module unless another displacement module replaces it."

	self ffiCall: #(void no_noise_module_Displace_SetZDisplaceModule(no_noise_module_Displace* self, no_noise_module_Module* zDisplaceModule))
]
