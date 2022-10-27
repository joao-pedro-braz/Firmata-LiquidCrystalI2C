"
I am an interface to a LCD I2C-enabled panel, connected through the Firmata protocol.

I do send I2C commands to a given address through a connected instance of `Firmata`.
I know how to structure those I2C commands as to control the related LCD panel.
I also extend the base Firmata class to provide a way to construct myself.

I collaborate with the `Firmata` class, by using an instance of it to send I2C commands.
I collaborate with the `FirmataLiquidCrystalI2CConstants` class, by using it's constants.
I collaborate with the `FirmataLiquidCrystalI2CCharMap` class on the `FirmataLiquidCrystalI2C>>#saveCustomChar:at:`.


## Public API and Key Messages

•	clear
•	disableAutoscroll
•	disableBacklight
•	disableBlink
•	disableDisplay
•	enableAutoscroll
•	enableBacklight
•	enableBlink
•	enableDisplay
•	hideCursor
•	home
•	leftToRight
•	print:
•	rightToLeft
•	saveCustomChar:at:
•	scrollDisplayLeft
•	scrollDisplayRight
•	setCursor:
•	showCursor

## How to create instances

```language=Pharo
firmata := Firmata onPort: '/dev/ttyACM4' baudRate: 57600.

firmataLcd := firmata lcdAt: 16r27 withColumns: 2 andRows: 16.
firmataLcd init.
```

## Internal Representation and Key Implementation Points.

### Instance Variables
address:  <Number>
backlight:  <Number>
cols:  <Number>
displayControl:  <Number>
displayFunction:  <Number>
displayMode:  <Number>
firmata:  <Firmata>
isOled:  <Boolean>
rows:  <Number>


### Implementation Points

- Needs a connected firmata instance to work, will error out if the instance ever disconnect


"
Class {
	#name : #FirmataLiquidCrystalI2C,
	#superclass : #Object,
	#instVars : [
		'address',
		'rows',
		'cols',
		'firmata',
		'isOled',
		'backlightFlag',
		'displayFunctionFlag',
		'displayControlFlag',
		'displayModeFlag'
	],
	#category : #'Firmata-LiquidCrystalI2C-Implementation'
}

{ #category : #'instance creation' }
FirmataLiquidCrystalI2C class >> new: anAddress cols: aNumberOfCols rows: aNumberOfRows firmata: aFirmata [
	"I initialize myself with an address, the number of cols and the number of rows"
	
	| this |	
	this := self new.
	this address: anAddress.
	this cols: aNumberOfCols.
	this rows: aNumberOfRows.
	this firmata: aFirmata.
	^ this
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> address [

	^ address
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> address: aNumber [

	address := aNumber
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> autoscroll [

	"I'm an alias to #enableAutoscroll"

	^ self enableAutoscroll
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> backlight [

	"I'm an alias to #enableBacklight"

	^ self enableBacklight
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> backlightFlag [

	^ backlightFlag
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> backlightFlag: anObject [

	backlightFlag := anObject
]

{ #category : #initialization }
FirmataLiquidCrystalI2C >> begin [

	"I'm an alias for #init"

	^ self init
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> blink [

	"I'm an alias to #enableBlink"

	^ self enableBlink
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> clear [

	"Send the clear command"

	self sendCommand: FirmataLiquidCrystalI2CConstants clearDisplay.
	(Delay forMilliseconds: 2.0) wait.
	self isOled ifTrue: [ self setCursor: 1 @ 1 ]
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> cols [

	^ cols
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> cols: aNumber [

	cols := aNumber
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> createChar: aCharMap at: anIndex [

	"I'm an alias to #saveCustomChar: aCharMap at: anIndex"

	^ self saveCustomChar: aCharMap at: anIndex
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> cursor [

	"I'm an alias to #showCursor"

	^ self showCursor
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> disableAutoscroll [

	"I ?"

	self displayModeFlag: self displayModeFlag
		& FirmataLiquidCrystalI2CConstants autoscroll bitInvert.
	self sendCommand:
		FirmataLiquidCrystalI2CConstants entryModeSet | self displayModeFlag
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> disableBacklight [

	"I disable the backlight"

	self backlightFlag: FirmataLiquidCrystalI2CConstants noBacklight.
	self sendCommand: 0
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> disableBlink [

	"I disable the cursor blinking"

	self displayControlFlag: self displayControlFlag
		& FirmataLiquidCrystalI2CConstants blinkOn bitInvert.
	self sendCommand:
		FirmataLiquidCrystalI2CConstants displayControl
		| self displayControlFlag
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> disableDisplay [

	"I disable the display"

	self displayControlFlag: self displayControlFlag
		& FirmataLiquidCrystalI2CConstants displayOn bitInvert.
	self sendCommand:
		FirmataLiquidCrystalI2CConstants displayControl
		| self displayControlFlag
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> display [

	"I'm an alias to #enableDisplay"

	^ self enableDisplay
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> displayControlFlag [

	^ displayControlFlag
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> displayControlFlag: anObject [

	displayControlFlag := anObject
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> displayFunctionFlag [

	^ displayFunctionFlag
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> displayFunctionFlag: anObject [

	displayFunctionFlag := anObject
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> displayModeFlag [

	^ displayModeFlag
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> displayModeFlag: anObject [

	displayModeFlag := anObject
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> enableAutoscroll [

	"I enable autoscrolling"

	self displayModeFlag: self displayModeFlag
		| FirmataLiquidCrystalI2CConstants autoscroll.
	self sendCommand:
		FirmataLiquidCrystalI2CConstants entryModeSet | self displayModeFlag
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> enableBacklight [

	"I enable the backlight"

	self backlightFlag: FirmataLiquidCrystalI2CConstants backlight.
	self sendCommand: 0
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> enableBlink [

	"I enable the cursor blinking"

	self displayControlFlag:
		self displayControlFlag | FirmataLiquidCrystalI2CConstants blinkOn.
	self sendCommand:
		FirmataLiquidCrystalI2CConstants displayControl
		| self displayControlFlag
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> enableDisplay [

	"I show the display"

	self displayControlFlag:
		self displayControlFlag | FirmataLiquidCrystalI2CConstants displayOn.
	self sendCommand:
		FirmataLiquidCrystalI2CConstants displayControl
		| self displayControlFlag
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> firmata [

	^ firmata
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> firmata: anObject [

	firmata := anObject
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> hideCursor [

	"I hide the cursor"

	self displayControlFlag: self displayControlFlag
		& FirmataLiquidCrystalI2CConstants cursorOn bitInvert.
	self sendCommand:
		FirmataLiquidCrystalI2CConstants displayControl
		| self displayControlFlag
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> home [

	"Send the home command"

	self sendCommand: FirmataLiquidCrystalI2CConstants returnHome.
	(Delay forMilliseconds: 2.0) wait
]

{ #category : #initialization }
FirmataLiquidCrystalI2C >> init [

	"Initialize the LCD with the default config"

	self init: FirmataLiquidCrystalI2CConstants fiveByEightDots
]

{ #category : #initialization }
FirmataLiquidCrystalI2C >> init4bitsMode [

	"I put the LCD into the 4 bit mode.
	 This is according to the hitachi HD44780 datasheet figure 24, pg 46.
	 We start in 8bit mode, try to set 4 bit mode"

	"First try"
	self write4bitsToI2C: 3 << 4.
	(Delay forMilliseconds: 4.5) wait.

	"Second try"
	self write4bitsToI2C: 3 << 4.
	(Delay forMilliseconds: 4.5) wait.

	"Third try"
	self write4bitsToI2C: 3 << 4.
	(Delay forMilliseconds: 0.15) wait.

	"Finally, set the 4-bit interface"
	self write4bitsToI2C: 2 << 4
]

{ #category : #initialization }
FirmataLiquidCrystalI2C >> init: aCharSize [

	"I initialize the LCD"

	self firmata i2cConfig.

	self initDisplayFunction: aCharSize.

	"Now we pull both RS and R/W low to begin commands"
	"Reset expanderand turn backlight off (Bit 8 =1)"
	self writeToI2C: self backlightFlag.
	(Delay forMilliseconds: 1000.0) wait.

	self init4bitsMode.

	"Turn the display on with no cursor or blinking default"
	self displayControlFlag: FirmataLiquidCrystalI2CConstants displayOn
		| FirmataLiquidCrystalI2CConstants cursorOff
		| FirmataLiquidCrystalI2CConstants blinkOff.

	self enableDisplay.

	"Clear it off"
	self clear.

	self initDisplayMode.

	self home.

	^ nil
]

{ #category : #initialization }
FirmataLiquidCrystalI2C >> initDisplayFunction: aCharSize [

	"I initialize my displayFunction instance variable following some defaults"

	self rows > 1 ifTrue: [ 
		self displayFunctionFlag:
			self displayFunctionFlag | FirmataLiquidCrystalI2CConstants twoLine ].

	"For some 1 line displays you can select a 10 pixel high font"
	(aCharSize ~= 0 and: [ self rows == 1 ]) ifTrue: [ 
		self displayFunctionFlag:
			self displayFunctionFlag
			| FirmataLiquidCrystalI2CConstants fiveByTenDots ].

	"SEE PAGE 45/46 FOR INITIALIZATION SPECIFICATION!
	according to datasheet, we need at least 40ms after power rises above 2.7V
	before sending commands. Arduino can turn on way befer 4.5V so we'll wait 50"
	(Delay forMilliseconds: 50.0) wait.

	"Set # lines, font size, etc."
	self sendCommand:
		FirmataLiquidCrystalI2CConstants functionSet | self displayFunctionFlag
]

{ #category : #initialization }
FirmataLiquidCrystalI2C >> initDisplayMode [

	"I initialize my displayMode following some defaults"

	self displayModeFlag: FirmataLiquidCrystalI2CConstants entryLeft.

	self sendCommand:
		FirmataLiquidCrystalI2CConstants entryModeSet | self displayModeFlag
]

{ #category : #initialization }
FirmataLiquidCrystalI2C >> initialize [

	super initialize.

	self isOled: false.
	self backlightFlag: FirmataLiquidCrystalI2CConstants backlight.
	self displayFunctionFlag: FirmataLiquidCrystalI2CConstants fourBitMode
		| FirmataLiquidCrystalI2CConstants oneLine
		| FirmataLiquidCrystalI2CConstants fiveByEightDots.
	self displayModeFlag: 0.
	self displayControlFlag: 0.
	self displayModeFlag: 0
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> isOled [

	^ isOled
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> isOled: anObject [

	isOled := anObject
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> leftToRight [

	"I set the text flow left to right"

	self displayModeFlag:
		self displayModeFlag | FirmataLiquidCrystalI2CConstants entryLeft.
	self sendCommand:
		FirmataLiquidCrystalI2CConstants entryModeSet | self displayModeFlag
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> noAutoscroll [

	"I'm an alias to #disableAutoscroll"

	^ self disableAutoscroll
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> noBacklight [

	"I'm an alias to #disableBacklight"

	^ self disableBacklight
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> noBlink [

	"I'm an alias to #disableBlink"

	^ self disableBlink
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> noCursor [

	"I'm an alias to #hideCursor"

	^ self noCursor
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> noDisplay [

	"I'm an alias to #disableDisplay"

	^ self disableDisplay
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> print: anObject [

	"I ask the given object to print itself to the LCD"

	^ (anObject class canUnderstand: #printToLcd:)
		  ifTrue: [ anObject printToLcd: self ]
		  ifFalse: [ self print: anObject asString ]
		
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> print: aNumber base: aBase [

	"I ask the given Number to print itself to the LCD with the given base"

	aNumber printToLcd: self withBase: aBase
]

{ #category : #i2c }
FirmataLiquidCrystalI2C >> pulseEnable: aByte [

	"Sends Pulse to Enable Commands (I think?)"

	self writeToI2C: aByte | FirmataLiquidCrystalI2CConstants enableBit.
	(Delay forMilliseconds: 1) wait.

	self writeToI2C: aByte & FirmataLiquidCrystalI2CConstants disableBit.
	(Delay forMilliseconds: 1) wait
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> rightToLeft [

	"I set the text flow right to left"

	self displayModeFlag: self displayModeFlag
		& FirmataLiquidCrystalI2CConstants entryLeft bitInvert.
	self sendCommand:
		FirmataLiquidCrystalI2CConstants entryModeSet | self displayModeFlag
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> rows [

	^ rows
]

{ #category : #accessing }
FirmataLiquidCrystalI2C >> rows: aNumber [

	rows := aNumber
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> saveCustomChar: aFirmataCharMap at: anIndex [

	"I save the provided char map at the given LCD memory location."

	"You need to manually set the cursor position after, perhaps by sending the #home message"

	self sendCommand:
		FirmataLiquidCrystalI2CConstants setCGRAMAddr
		| (anIndex & 16r7 << 3).
	aFirmataCharMap charMap do: [ :each | self sendData: each ]
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> scrollDisplayLeft [

	"I scroll the display to the left"

	self sendCommand: FirmataLiquidCrystalI2CConstants cursorShift
		| FirmataLiquidCrystalI2CConstants displayMove
		| FirmataLiquidCrystalI2CConstants moveLeft
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> scrollDisplayRight [

	"I scroll the display to the right"

	self sendCommand: FirmataLiquidCrystalI2CConstants cursorShift
		| FirmataLiquidCrystalI2CConstants displayMove
		| FirmataLiquidCrystalI2CConstants moveRight
]

{ #category : #i2c }
FirmataLiquidCrystalI2C >> sendCommand: aCommand [

	"I send a command to the i2c device"

	| high low |
	high := aCommand & 16rf0.
	low := aCommand << 4 & 16rf0.
	self write4bitsToI2C: high | 0.
	self write4bitsToI2C: low | 0
]

{ #category : #i2c }
FirmataLiquidCrystalI2C >> sendData: aData [

	"I send data to the i2c device"

	| high low |
	high := aData & 16rf0.
	low := aData << 4 & 16rf0.
	self write4bitsToI2C: high | 1.
	self write4bitsToI2C: low | 1
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> setCursor: aPoint [

	"I move the cursor to the specified point, where x is the column and y the row"
	"Also, for homogeneity with the rest of Pharo, rows and columns start on 1@1"

	| rowOffsets point |
	point := aPoint - 1.
	rowOffsets := { 16r00. 16r40. 16r14. 16r54 }.
	point y > self rows ifTrue: [ point y: self rows - 1 ].
	self sendCommand: FirmataLiquidCrystalI2CConstants setDDRAMAddr
		| (point x + rowOffsets at: point y + 1)
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> showCursor [

	"I show the cursor"

	self displayControlFlag:
		self displayControlFlag | FirmataLiquidCrystalI2CConstants cursorOn.
	self sendCommand:
		FirmataLiquidCrystalI2CConstants displayControl
		| self displayControlFlag
]

{ #category : #i2c }
FirmataLiquidCrystalI2C >> write4bitsToI2C: aByte [

	"I write 4 bits to the i2c device"

	self writeToI2C: aByte.
	self pulseEnable: aByte
]

{ #category : #commands }
FirmataLiquidCrystalI2C >> write: aByte [

	"I'm an alias to #sendData:"
	
	^ self sendData: aByte
]

{ #category : #i2c }
FirmataLiquidCrystalI2C >> writeToI2C: aByte [

	"I send data to the device at the i2c adress"

	self firmata
		i2cWriteTo: self address
		data: (aByte | self backlightFlag) asByteArray
]
