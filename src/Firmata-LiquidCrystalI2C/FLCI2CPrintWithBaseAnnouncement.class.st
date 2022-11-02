"
I announce that a new numeric content, with a specific base, has been printed.
"
Class {
	#name : #FLCI2CPrintWithBaseAnnouncement,
	#superclass : #FLCI2CPrintAnnouncement,
	#instVars : [
		'base'
	],
	#category : #'Firmata-LiquidCrystalI2C-Implementation'
}

{ #category : #'instance creation' }
FLCI2CPrintWithBaseAnnouncement class >> new: aContent withBase: aNumericBase [

	"I instantiate myself with the given content, which should be a numeric value, and base"

	| this |
	this := self new: aContent.
	this base: aNumericBase.
	^ this
]

{ #category : #accessing }
FLCI2CPrintWithBaseAnnouncement >> base [

	^ base
]

{ #category : #accessing }
FLCI2CPrintWithBaseAnnouncement >> base: anObject [

	base := anObject
]
