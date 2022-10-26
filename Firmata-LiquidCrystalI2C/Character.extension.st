Extension { #name : #Character }

{ #category : #'*Firmata-LiquidCrystalI2C' }
Character >> printToLcd: aFirmataLiquidCrystalI2C [

	"I print myself to the given representation of a LCD panel"

	aFirmataLiquidCrystalI2C sendData: self asInteger
]
