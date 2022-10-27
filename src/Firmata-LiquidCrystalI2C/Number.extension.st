Extension { #name : #Number }

{ #category : #'*Firmata-LiquidCrystalI2C' }
Number >> printToLcd: aFirmataLiquidCrystalI2C [

	"I print myself to the given representation of a LCD panel"

	(String streamContents: [ :stream | self printOn: stream ]) 
		printToLcd: aFirmataLiquidCrystalI2C
]

{ #category : #'*Firmata-LiquidCrystalI2C' }
Number >> printToLcd: aFirmataLiquidCrystalI2C withBase: aBase [

	"I print myself to the given representation of a LCD panel"

	(String streamContents: [ :stream | self printOn: stream base: aBase ]) 
		printToLcd: aFirmataLiquidCrystalI2C
]
