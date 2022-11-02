"
I announce that a new content has been printed.
"
Class {
	#name : #FLCI2CPrintAnnouncement,
	#superclass : #FLCI2CAnnouncement,
	#instVars : [
		'content'
	],
	#category : #'Firmata-LiquidCrystalI2C-Implementation'
}

{ #category : #'instance creation' }
FLCI2CPrintAnnouncement class >> new: aContent [

	"I instantiate myself with the given content"

	| this |
	this := self new.
	this content: aContent.
	^ this
]

{ #category : #accessing }
FLCI2CPrintAnnouncement >> content [

	^ content
]

{ #category : #accessing }
FLCI2CPrintAnnouncement >> content: anObject [

	content := anObject
]
