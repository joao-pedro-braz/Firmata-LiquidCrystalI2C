Class {
	#name : #FirmataLiquidCrystalI2CCharMapTest,
	#superclass : #TestCase,
	#category : #'Firmata-LiquidCrystalI2C-Tests'
}

{ #category : #tests }
FirmataLiquidCrystalI2CCharMapTest >> testInvalidInstanceFails [

	"I test if when provided with invalid data an instance can *not* be constructed"

	self
		should: [ 
			FirmataLiquidCrystalI2CCharMap newFrom:
				#( 2r0 ) ]
		raise: Error
]

{ #category : #tests }
FirmataLiquidCrystalI2CCharMapTest >> testValidInstanceCanBeConstructed [

	"I test if when provided with valid data an instance can be constructed"

	FirmataLiquidCrystalI2CCharMap newFrom:
		#( 2r11111 2r10000 2r10000 2r11111 2r00001 2r00001 2r00001 2r11111 )
]
