"
I announce the cursor position has been changed.
"
Class {
	#name : #FLCI2CCursorSetAnnouncement,
	#superclass : #FLCI2CAnnouncement,
	#instVars : [
		'position'
	],
	#category : #'Firmata-LiquidCrystalI2C-Implementation'
}

{ #category : #'instance creation' }
FLCI2CCursorSetAnnouncement class >> new: aPoint [

	"I instantiate myself with the given aPoint"

	| this |
	this := self new.
	this position: aPoint.
	^ this
]

{ #category : #accessing }
FLCI2CCursorSetAnnouncement >> position [

	^ position
]

{ #category : #accessing }
FLCI2CCursorSetAnnouncement >> position: anObject [

	position := anObject
]
