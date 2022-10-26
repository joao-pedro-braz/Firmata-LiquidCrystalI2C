"
I am a collection of constants.

All I have are class-side messages that return some hex value.
"
Class {
	#name : #FirmataLiquidCrystalI2CConstants,
	#superclass : #Object,
	#category : #'Firmata-LiquidCrystalI2C-Implementation'
}

{ #category : #'display entry modes' }
FirmataLiquidCrystalI2CConstants class >> autoscroll [

	"I return the hex value for enabling autoscroll"
	
	^ 16r01
]

{ #category : #backlight }
FirmataLiquidCrystalI2CConstants class >> backlight [

	"I return the ON backlight hex value"

	^ 16r08
]

{ #category : #'display control' }
FirmataLiquidCrystalI2CConstants class >> blinkOff [

	"I return the hex value for turning the cursor blinking off"
	
	^ 16r00
]

{ #category : #'display control' }
FirmataLiquidCrystalI2CConstants class >> blinkOn [

	"I return the hex value for turning the cursor blinking on"
	
	^ 16r01
]

{ #category : #commands }
FirmataLiquidCrystalI2CConstants class >> clearDisplay [

	"I return the hex value for clearing the display"

	^ 16r01
]

{ #category : #'display/cursor shift' }
FirmataLiquidCrystalI2CConstants class >> cursorMove [

	"I return the mask hex value that indicates the cursor should be moved (as oposed to the display)"

	^ 16r00
]

{ #category : #'display control' }
FirmataLiquidCrystalI2CConstants class >> cursorOff [

	"I return the hex value for turning the cursor off"
	
	^ 16r00
]

{ #category : #'display control' }
FirmataLiquidCrystalI2CConstants class >> cursorOn [

	"I return the hex value for turning the cursor on"
	
	^ 16r02
]

{ #category : #commands }
FirmataLiquidCrystalI2CConstants class >> cursorShift [

	"I return the mask hex value for altering cursor properties"

	^ 16r10
]

{ #category : #'enable/disable' }
FirmataLiquidCrystalI2CConstants class >> disableBit [

	"I return the mask hex value for enabling the LCD"

	^ self enableBit bitInvert
]

{ #category : #commands }
FirmataLiquidCrystalI2CConstants class >> displayControl [

	"I return the mask hex value for altering display properties"

	^ 16r08
]

{ #category : #'display/cursor shift' }
FirmataLiquidCrystalI2CConstants class >> displayMove [

	"I return the mask hex value that indicates the display should be moved (as oposed to the cursor)"

	^ 16r08
]

{ #category : #'display control' }
FirmataLiquidCrystalI2CConstants class >> displayOff [

	"I return the hex value for turning the display off"

	^ 16r00
]

{ #category : #'display control' }
FirmataLiquidCrystalI2CConstants class >> displayOn [

	"I return the hex value for turning the display on"

	^ 16r04
]

{ #category : #'function set' }
FirmataLiquidCrystalI2CConstants class >> eightBitMode [

	"I return the 8 bit function mode set hex value"

	^ 16r10
]

{ #category : #'enable/disable' }
FirmataLiquidCrystalI2CConstants class >> enableBit [

	"I return the mask hex value for enabling the LCD"

	^ 2r00000100
]

{ #category : #'display entry modes' }
FirmataLiquidCrystalI2CConstants class >> entryLeft [

	"I return the hex value for the left display entry mode"

	^ 16r02
]

{ #category : #commands }
FirmataLiquidCrystalI2CConstants class >> entryModeSet [

	"I return the mask hex value for setting entry modes"

	^ 16r04
]

{ #category : #'display entry modes' }
FirmataLiquidCrystalI2CConstants class >> entryRight [

	"I return the hex value for the right display entry mode"

	^ 16r00
]

{ #category : #'function set' }
FirmataLiquidCrystalI2CConstants class >> fiveByEightDots [

	"I return the 5x8 Dots function mode set hex value"

	^ 16r00
]

{ #category : #'function set' }
FirmataLiquidCrystalI2CConstants class >> fiveByTenDots [

	"I return the 5x10 Dots function mode set hex value"

	^ 16r04
]

{ #category : #'function set' }
FirmataLiquidCrystalI2CConstants class >> fourBitMode [

	"I return the 4 bit function mode set hex value"

	^ 16r00
]

{ #category : #commands }
FirmataLiquidCrystalI2CConstants class >> functionSet [

	"I return the mask hex value for settings the display mode"

	^ 16r20
]

{ #category : #'display/cursor shift' }
FirmataLiquidCrystalI2CConstants class >> moveLeft [

	"I return the hex value that moves either the display or the cursor to the left"

	^ 16r00
]

{ #category : #'display/cursor shift' }
FirmataLiquidCrystalI2CConstants class >> moveRight [

	"I return the hex value that moves either the display or the cursor to the right"

	^ 16r04
]

{ #category : #backlight }
FirmataLiquidCrystalI2CConstants class >> noBacklight [

	"I return the OFF backlight hex value"

	^ 16r00
]

{ #category : #'function set' }
FirmataLiquidCrystalI2CConstants class >> oneLine [

	"I return the 1 line function mode set hex value"

	^ 16r00
]

{ #category : #commands }
FirmataLiquidCrystalI2CConstants class >> returnHome [

	"I return the hex value for returning the cursor to the home column"

	^ 16r02
]

{ #category : #commands }
FirmataLiquidCrystalI2CConstants class >> setCGRAMAddr [

	"I return the mask hex value for setting the first 8 CGRAM locations with custom characters"

	^ 16r40
]

{ #category : #commands }
FirmataLiquidCrystalI2CConstants class >> setDDRAMAddr [

	"I return the mask hex value for setting the cursor position"

	^ 16r80
]

{ #category : #'function set' }
FirmataLiquidCrystalI2CConstants class >> twoLine [

	"I return the 2 line function mode set hex value"

	^ 16r08
]
