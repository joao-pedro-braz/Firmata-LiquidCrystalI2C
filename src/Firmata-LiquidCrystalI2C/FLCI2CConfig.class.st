"
I store config data for instances of `FirmataLCI2C`

## Internal Representation and Key Implementation Points.

### Instance Variables
	address:		<Object>
	backlightFlag:		<Object>
	cols:		<Object>
	displayControlFlag:		<Object>
	displayFunctionFlag:		<Object>
	displayModeFlag:		<Object>
	isOled:		<Object>
	rows:		<Object>
"
Class {
	#name : #FLCI2CConfig,
	#superclass : #Object,
	#instVars : [
		'address',
		'rows',
		'cols',
		'isOled',
		'backlightFlag',
		'displayFunctionFlag',
		'displayControlFlag',
		'displayModeFlag'
	],
	#category : #'Firmata-LiquidCrystalI2C-Implementation'
}

{ #category : #accessing }
FLCI2CConfig >> address [

	^ address
]

{ #category : #accessing }
FLCI2CConfig >> address: anObject [

	address := anObject
]

{ #category : #accessing }
FLCI2CConfig >> backlightFlag [

	^ backlightFlag
]

{ #category : #accessing }
FLCI2CConfig >> backlightFlag: anObject [

	backlightFlag := anObject
]

{ #category : #accessing }
FLCI2CConfig >> cols [

	^ cols
]

{ #category : #accessing }
FLCI2CConfig >> cols: anObject [

	cols := anObject
]

{ #category : #accessing }
FLCI2CConfig >> displayControlFlag [

	^ displayControlFlag
]

{ #category : #accessing }
FLCI2CConfig >> displayControlFlag: anObject [

	displayControlFlag := anObject
]

{ #category : #accessing }
FLCI2CConfig >> displayFunctionFlag [

	^ displayFunctionFlag
]

{ #category : #accessing }
FLCI2CConfig >> displayFunctionFlag: anObject [

	displayFunctionFlag := anObject
]

{ #category : #accessing }
FLCI2CConfig >> displayModeFlag [

	^ displayModeFlag
]

{ #category : #accessing }
FLCI2CConfig >> displayModeFlag: anObject [

	displayModeFlag := anObject
]

{ #category : #extending }
FLCI2CConfig >> extend: anotherConfig [

	"I extend myself by overwriting my values with the non-nils of the given config"

	| value |
	anotherConfig class instanceVariables do: [ :variable | 
		value := anotherConfig instVarNamed: variable name.

		(value isNotNil and: [ self class hasInstVarNamed: variable name ]) 
			ifTrue: [ self instVarNamed: variable name put: value ] ]
]

{ #category : #initialization }
FLCI2CConfig >> initialize [

	"I initialize myself with some default values"

	self isOled: false.
	self backlightFlag: FLCI2CConstants backlight.
	self displayFunctionFlag:
		FLCI2CConstants fourBitMode
		| FLCI2CConstants oneLine
		| FLCI2CConstants fiveByEightDots.
	self displayModeFlag: 0.
	self displayControlFlag: 0.
	self displayModeFlag: 0
]

{ #category : #accessing }
FLCI2CConfig >> isOled [

	^ isOled
]

{ #category : #accessing }
FLCI2CConfig >> isOled: anObject [

	isOled := anObject
]

{ #category : #accessing }
FLCI2CConfig >> rows [

	^ rows
]

{ #category : #accessing }
FLCI2CConfig >> rows: anObject [

	rows := anObject
]
