"
I'm the base class for toggleable announcements, which are those announcements with a single boolean value.
"
Class {
	#name : #FLCI2CToggleableAnnouncement,
	#superclass : #FLCI2CAnnouncement,
	#instVars : [
		'toggled'
	],
	#category : #'Firmata-LiquidCrystalI2C-Implementation'
}

{ #category : #'instance creation' }
FLCI2CToggleableAnnouncement class >> new: aBoolean [

	"I instantiate myself with the given value"

	| this |
	this := self new.
	this toggled: aBoolean.
	^ this
]

{ #category : #accessing }
FLCI2CToggleableAnnouncement >> toggled [

	^ toggled
]

{ #category : #accessing }
FLCI2CToggleableAnnouncement >> toggled: anObject [

	toggled := anObject
]
