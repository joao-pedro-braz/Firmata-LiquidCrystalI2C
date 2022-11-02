"
I announce that a new Char Map has been saved to the LCD memory.
"
Class {
	#name : #FLCI2CCustomCharAnnouncement,
	#superclass : #FLCI2CAnnouncement,
	#instVars : [
		'charMap',
		'memoryIndex'
	],
	#category : #'Firmata-LiquidCrystalI2C-Implementation'
}

{ #category : #'instance creation' }
FLCI2CCustomCharAnnouncement class >> new: aCharMap withIndex: anIndex [

	"I instantiate myself with the given Char Map and index"

	| this |
	this := self new.
	this charMap: aCharMap.
	this memoryIndex: anIndex.
	^ this
]

{ #category : #accessing }
FLCI2CCustomCharAnnouncement >> charMap [

	^ charMap
]

{ #category : #accessing }
FLCI2CCustomCharAnnouncement >> charMap: anObject [

	charMap := anObject
]

{ #category : #accessing }
FLCI2CCustomCharAnnouncement >> memoryIndex [

	^ memoryIndex
]

{ #category : #accessing }
FLCI2CCustomCharAnnouncement >> memoryIndex: anObject [

	memoryIndex := anObject
]
