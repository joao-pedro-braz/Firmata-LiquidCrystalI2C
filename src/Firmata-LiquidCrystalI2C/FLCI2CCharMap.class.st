"
I represent a LCD character map.

I store binary data about the representation of a LCD character.
I know what a valid character looks like.
I actively validate what's given to me, as to only allow valid instances to be constructed.

I collaborate with `FirmataLCI2C` on the `FirmataLCI2C>>#saveCustomChar:at:` message.


## Public API and Key Messages

- newFrom:
    Try to create an instance of myself, fail if the provided data is invalid.
- how to create instances
    `FLCI2CCharMap newFrom: #(
      2r10001
      2r10001
      2r10001
      2r10001
      2r10001
      2r10001
      2r10001
      2r11111
    ).`
 

## Internal Representation and Key Implementation Points

### Instance Variables
	charMap:		<ByteArray>


### Implementation Points
	charMap is ensured (if I'm constructed with the class `FLCI2CCharMap class>>#newFrom:` message) to be valid (exactly 8 entries).
"
Class {
	#name : #FLCI2CCharMap,
	#superclass : #Object,
	#instVars : [
		'charMap'
	],
	#category : #'Firmata-LiquidCrystalI2C-Implementation'
}

{ #category : #'instance creation' }
FLCI2CCharMap class >> newFrom: aByteArray [

	"I initialize a new FirmataCharMap from the given ByteArray"

	| this |
	self validate: aByteArray.

	this := self new.
	this charMap: aByteArray.
	^ this
]

{ #category : #testing }
FLCI2CCharMap class >> validate: aByteArray [

	"I validate the given byte array"

	aByteArray size = 8 ifFalse: [ 
		self error: 'The char map should have exactly 8 rows' ]
]

{ #category : #accessing }
FLCI2CCharMap >> charMap [

	^ charMap
]

{ #category : #accessing }
FLCI2CCharMap >> charMap: anObject [

	charMap := anObject
]
