"
I am the baseline of the Firmata-LiquidCrystalI2C.
"
Class {
	#name : #BaselineOfFirmataLiquidCrystalI2C,
	#superclass : #BaselineOf,
	#category : #BaselineOfFirmataLiquidCrystalI2C
}

{ #category : #baselines }
BaselineOfFirmataLiquidCrystalI2C >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		self declareFirmata: spec.

		"Packages"
		spec
			package: #'Firmata-LiquidCrystalI2C'
			with: [ spec requires: #( 'Firmata' ) ];
			package: #'Firmata-LiquidCrystalI2C-Tests'
			with: [ spec requires: #( 'Firmata-LiquidCrystalI2C' ) ] ]
]

{ #category : #'external projects' }
BaselineOfFirmataLiquidCrystalI2C >> declareFirmata: spec [

	spec
		baseline: 'Firmata'
		with: [ spec repository: 'github://robvanlopik/Firmata' ]
]
