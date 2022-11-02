"
I am an interface to a LCD I2C-enabled panel, connected through the Firmata protocol.

I do send I2C commands to a given address through a connected instance of `Firmata`.
I know how to structure those I2C commands as to control the related LCD panel.
I also extend the base Firmata class to provide a way to construct myself.

I collaborate with the `Firmata` class, by using an instance of it to send I2C commands.
I collaborate with the `FLCI2CConstants` class, by using it's constants.
I collaborate with the `FLCI2CCharMap` class on the `FirmataLCI2C>>#saveCustomChar:at:`.


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
firmata:  <Firmata>
config: <FLCI2CConfig>
announcements: <Announcer>


### Implementation Points

- Needs a connected firmata instance to work, will error out if the instance ever disconnect


"
Class {
	#name : #FirmataLCI2C,
	#superclass : #Object,
	#instVars : [
		'firmata',
		'config',
		'announcements'
	],
	#category : #'Firmata-LiquidCrystalI2C-Implementation'
}

{ #category : #'instance creation' }
FirmataLCI2C class >> new: anAddress cols: aNumberOfCols rows: aNumberOfRows firmata: aFirmata [

	"I initialize myself with an address, the number of cols and the number of rows"

	| this config |
	config := FLCI2CConfig new.
	config address: anAddress.
	config cols: aNumberOfCols.
	config rows: aNumberOfRows.

	this := self new.
	^ this setConfig: config andFirmata: aFirmata
]

{ #category : #accessing }
FirmataLCI2C >> announcements [

	^ announcements
]

{ #category : #aliases }
FirmataLCI2C >> autoscroll [

	"I'm an alias to #enableAutoscroll"

	^ self enableAutoscroll
]

{ #category : #aliases }
FirmataLCI2C >> backlight [

	"I'm an alias to #enableBacklight"

	^ self enableBacklight
]

{ #category : #initialization }
FirmataLCI2C >> begin [

	"I'm an alias for #init"

	^ self init
]

{ #category : #aliases }
FirmataLCI2C >> blink [

	"I'm an alias to #enableBlink"

	^ self enableBlink
]

{ #category : #commands }
FirmataLCI2C >> clear [

	"Send the clear command"

	self sendCommand: FLCI2CConstants clearDisplay.
	(Delay forMilliseconds: 2.0) wait.
	config isOled ifTrue: [ self setCursor: 1 @ 1 ].

	announcements announce: FLCI2CClearAnnouncement new
]

{ #category : #aliases }
FirmataLCI2C >> createChar: aCharMap at: anIndex [

	"I'm an alias to #saveCustomChar: aCharMap at: anIndex"

	^ self saveCustomChar: aCharMap at: anIndex
]

{ #category : #aliases }
FirmataLCI2C >> cursor [

	"I'm an alias to #showCursor"

	^ self showCursor
]

{ #category : #commands }
FirmataLCI2C >> disableAutoscroll [

	"I disable autoscrolling"

	config displayModeFlag:
		config displayModeFlag & FLCI2CConstants autoscroll bitInvert.
	self sendCommand:
		FLCI2CConstants entryModeSet | config displayModeFlag.

	announcements announce: (FLCI2CAutoscrollAnnouncement new: false)
]

{ #category : #commands }
FirmataLCI2C >> disableBacklight [

	"I disable the backlight"

	config backlightFlag: FLCI2CConstants noBacklight.
	self sendCommand: 0.

	announcements announce: (FLCI2CBacklightAnnouncement new: false)
]

{ #category : #commands }
FirmataLCI2C >> disableBlink [

	"I disable the cursor blinking"

	config displayControlFlag:
		config displayControlFlag & FLCI2CConstants blinkOn bitInvert.
	self sendCommand:
		FLCI2CConstants displayControl | config displayControlFlag.

	announcements announce: (FLCI2CBlinkAnnouncement new: false)
]

{ #category : #commands }
FirmataLCI2C >> disableDisplay [

	"I disable the display"

	config displayControlFlag:
		config displayControlFlag & FLCI2CConstants displayOn bitInvert.
	self sendCommand:
		FLCI2CConstants displayControl | config displayControlFlag.

	announcements announce: (FLCI2CDisplayAnnouncement new: false)
]

{ #category : #aliases }
FirmataLCI2C >> display [

	"I'm an alias to #enableDisplay"

	^ self enableDisplay
]

{ #category : #commands }
FirmataLCI2C >> enableAutoscroll [

	"I enable autoscrolling"

	config displayModeFlag:
		config displayModeFlag | FLCI2CConstants autoscroll.
	self sendCommand:
		FLCI2CConstants entryModeSet | config displayModeFlag.

	announcements announce: (FLCI2CAutoscrollAnnouncement new: true)
]

{ #category : #commands }
FirmataLCI2C >> enableBacklight [

	"I enable the backlight"

	config backlightFlag: FLCI2CConstants backlight.
	self sendCommand: 0.

	announcements announce: (FLCI2CBacklightAnnouncement new: true)
]

{ #category : #commands }
FirmataLCI2C >> enableBlink [

	"I enable the cursor blinking"

	config displayControlFlag:
		config displayControlFlag | FLCI2CConstants blinkOn.
	self sendCommand:
		FLCI2CConstants displayControl | config displayControlFlag.

	announcements announce: (FLCI2CBlinkAnnouncement new: true)
]

{ #category : #commands }
FirmataLCI2C >> enableDisplay [

	"I show the display"

	config displayControlFlag:
		config displayControlFlag | FLCI2CConstants displayOn.
	self sendCommand:
		FLCI2CConstants displayControl | config displayControlFlag.

	announcements announce: (FLCI2CDisplayAnnouncement new: true)
]

{ #category : #commands }
FirmataLCI2C >> hideCursor [

	"I hide the cursor"

	config displayControlFlag:
		config displayControlFlag & FLCI2CConstants cursorOn bitInvert.
	self sendCommand:
		FLCI2CConstants displayControl | config displayControlFlag.

	announcements announce: (FLCI2CCursorAnnouncement new: false)
]

{ #category : #commands }
FirmataLCI2C >> home [

	"Send the home command"

	self sendCommand: FLCI2CConstants returnHome.
	(Delay forMilliseconds: 2.0) wait.

	announcements announce: FLCI2CHomeAnnouncement new
]

{ #category : #initialization }
FirmataLCI2C >> init [

	"Initialize the LCD with the default config"

	self init: FLCI2CConstants fiveByEightDots
]

{ #category : #initialization }
FirmataLCI2C >> init4bitsMode [

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
FirmataLCI2C >> init: aCharSize [

	"I initialize the LCD"

	firmata i2cConfig.

	self initDisplayFunction: aCharSize.

	"Now we pull both RS and R/W low to begin commands"
	"Reset expanderand turn backlight off (Bit 8 =1)"
	self writeToI2C: config backlightFlag.
	(Delay forMilliseconds: 1000.0) wait.

	self init4bitsMode.

	"Turn the display on with no cursor or blinking default"
	config displayControlFlag:
		FLCI2CConstants displayOn
		| FLCI2CConstants cursorOff
		| FLCI2CConstants blinkOff.

	self enableDisplay.

	"Clear it off"
	self clear.

	self initDisplayMode.

	self home.

	^ nil
]

{ #category : #initialization }
FirmataLCI2C >> initDisplayFunction: aCharSize [

	"I initialize my displayFunction instance variable following some defaults"

	config rows > 1 ifTrue: [ 
		config displayFunctionFlag:
			config displayFunctionFlag
			| FLCI2CConstants twoLine ].

	"For some 1 line displays you can select a 10 pixel high font"
	(aCharSize ~= 0 and: [ config rows == 1 ]) ifTrue: [ 
		config displayFunctionFlag: config displayFunctionFlag
			| FLCI2CConstants fiveByTenDots ].

	"SEE PAGE 45/46 FOR INITIALIZATION SPECIFICATION!
	according to datasheet, we need at least 40ms after power rises above 2.7V
	before sending commands. Arduino can turn on way befer 4.5V so we'll wait 50"
	(Delay forMilliseconds: 50.0) wait.

	"Set # lines, font size, etc."
	self sendCommand: FLCI2CConstants functionSet
		| config displayFunctionFlag
]

{ #category : #initialization }
FirmataLCI2C >> initDisplayMode [

	"I initialize my displayMode following some defaults"

	config displayModeFlag: FLCI2CConstants entryLeft.

	self sendCommand:
		FLCI2CConstants entryModeSet
		| config displayModeFlag
]

{ #category : #initialization }
FirmataLCI2C >> initialize [

	super initialize.

	config := FLCI2CConfig new.
	announcements := Announcer new.
]

{ #category : #commands }
FirmataLCI2C >> leftToRight [

	"I set the text flow left to right"

	config displayModeFlag:
		config displayModeFlag | FLCI2CConstants entryLeft.
	self sendCommand:
		FLCI2CConstants entryModeSet | config displayModeFlag.

	announcements announce: (FLCI2CTextDirectionAnnouncement new: true)
]

{ #category : #aliases }
FirmataLCI2C >> noAutoscroll [

	"I'm an alias to #disableAutoscroll"

	^ self disableAutoscroll
]

{ #category : #aliases }
FirmataLCI2C >> noBacklight [

	"I'm an alias to #disableBacklight"

	^ self disableBacklight
]

{ #category : #aliases }
FirmataLCI2C >> noBlink [

	"I'm an alias to #disableBlink"

	^ self disableBlink
]

{ #category : #aliases }
FirmataLCI2C >> noCursor [

	"I'm an alias to #hideCursor"

	^ self noCursor
]

{ #category : #aliases }
FirmataLCI2C >> noDisplay [

	"I'm an alias to #disableDisplay"

	^ self disableDisplay
]

{ #category : #commands }
FirmataLCI2C >> print: anObject [

	"I ask the given object to print itself to the LCD"

	^ (anObject class canUnderstand: #printToLcd:)
		  ifTrue: [ 
			  announcements announce: (FLCI2CPrintAnnouncement new: anObject).
			  anObject printToLcd: self ]
		  ifFalse: [ 
			  announcements announce:
				  (FLCI2CPrintAnnouncement new: anObject asString).
			  self print: anObject asString ]
]

{ #category : #commands }
FirmataLCI2C >> print: aNumber base: aBase [

	"I ask the given Number to print itself to the LCD with the given base"

	announcements announce:
		(FLCI2CPrintWithBaseAnnouncement new: aNumber withBase: aBase).
	aNumber printToLcd: self withBase: aBase
]

{ #category : #i2c }
FirmataLCI2C >> pulseEnable: aByte [

	"Sends Pulse to Enable Commands (I think?)"

	self writeToI2C: aByte | FLCI2CConstants enableBit.
	(Delay forMilliseconds: 1) wait.

	self writeToI2C: aByte & FLCI2CConstants disableBit.
	(Delay forMilliseconds: 1) wait
]

{ #category : #commands }
FirmataLCI2C >> rightToLeft [

	"I set the text flow right to left"

	config displayModeFlag:
		config displayModeFlag & FLCI2CConstants entryLeft bitInvert.
	self sendCommand:
		FLCI2CConstants entryModeSet | config displayModeFlag.

	announcements announce: (FLCI2CTextDirectionAnnouncement new: false)
]

{ #category : #commands }
FirmataLCI2C >> saveCustomChar: aFirmataCharMap at: anIndex [

	"I save the provided char map at the given LCD memory location."

	"You need to manually set the cursor position after, perhaps by sending the #home message"

	self sendCommand:
		FLCI2CConstants setCGRAMAddr | (anIndex & 16r7 << 3).
	aFirmataCharMap charMap do: [ :each | self sendData: each ].

	announcements announce:
		(FLCI2CCustomCharAnnouncement
			 new: aFirmataCharMap
			 withIndex: anIndex)
]

{ #category : #commands }
FirmataLCI2C >> scrollDisplayLeft [

	"I scroll the display to the left"

	self sendCommand:
		FLCI2CConstants cursorShift | FLCI2CConstants displayMove
		| FLCI2CConstants moveLeft.

	announcements announce: (FLCI2CScrollDirectionAnnouncement new: true)
]

{ #category : #commands }
FirmataLCI2C >> scrollDisplayRight [

	"I scroll the display to the right"

	self sendCommand:
		FLCI2CConstants cursorShift | FLCI2CConstants displayMove
		| FLCI2CConstants moveRight.

	announcements announce:
		(FLCI2CScrollDirectionAnnouncement new: false)
]

{ #category : #i2c }
FirmataLCI2C >> sendCommand: aCommand [

	"I send a command to the i2c device"

	| high low |
	high := aCommand & 16rf0.
	low := aCommand << 4 & 16rf0.
	self write4bitsToI2C: high | 0.
	self write4bitsToI2C: low | 0
]

{ #category : #i2c }
FirmataLCI2C >> sendData: aData [

	"I send data to the i2c device"

	| high low |
	high := aData & 16rf0.
	low := aData << 4 & 16rf0.
	self write4bitsToI2C: high | 1.
	self write4bitsToI2C: low | 1
]

{ #category : #initialization }
FirmataLCI2C >> setConfig: aConfig andFirmata: aFirmata [

	"I set the config and firmata instance variables"

	config := config extend: aConfig.
	firmata := aFirmata
]

{ #category : #commands }
FirmataLCI2C >> setCursor: aPoint [

	"I move the cursor to the specified point, where x is the column and y the row"

	"Also, for homogeneity with the rest of Pharo, rows and columns start on 1@1"

	| rowOffsets point |
	point := aPoint - 1.
	rowOffsets := { 16r00. 16r40. 16r14. 16r54 }.
	point y > config rows ifTrue: [ point y: config rows - 1 ].
	self sendCommand:
		FLCI2CConstants setDDRAMAddr
		| (point x + rowOffsets at: point y + 1).

	announcements announce: (FLCI2CCursorSetAnnouncement new: aPoint)
]

{ #category : #commands }
FirmataLCI2C >> showCursor [

	"I show the cursor"

	config displayControlFlag:
		config displayControlFlag | FLCI2CConstants cursorOn.
	self sendCommand:
		FLCI2CConstants displayControl | config displayControlFlag.

	announcements announce: (FLCI2CCursorAnnouncement new: true)
]

{ #category : #i2c }
FirmataLCI2C >> write4bitsToI2C: aByte [

	"I write 4 bits to the i2c device"

	self writeToI2C: aByte.
	self pulseEnable: aByte
]

{ #category : #aliases }
FirmataLCI2C >> write: aByte [

	"I'm an alias to #sendData:"
	
	^ self sendData: aByte
]

{ #category : #i2c }
FirmataLCI2C >> writeToI2C: aByte [

	"I send data to the device at the i2c adress"

	firmata
		i2cWriteTo: config address
		data: (aByte | config backlightFlag) asByteArray
]
