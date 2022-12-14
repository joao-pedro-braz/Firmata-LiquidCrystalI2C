Extension { #name : #Firmata }

{ #category : #'*Firmata-LiquidCrystalI2C' }
Firmata >> lcdAt: anAddress withColumns: aNumberOfColumns andRows: aNumberOfRows [

	"I initialize a FirmataLiquidCrystalI2C"

	^ FirmataLCI2C
		  new: anAddress
		  cols: aNumberOfColumns
		  rows: aNumberOfRows
		  firmata: self
]
