Extension { #name : #Collection }

{ #category : #'*Firmata-LiquidCrystalI2C' }
Collection >> printToLcd: aFirmataLiquidCrystalI2C [

	"I print myself to the given representation of a LCD panel"

	self do: [ :each | each printToLcd: aFirmataLiquidCrystalI2C ]
]
