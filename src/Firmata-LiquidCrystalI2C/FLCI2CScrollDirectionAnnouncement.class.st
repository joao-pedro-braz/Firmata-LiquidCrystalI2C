"
I announce that the text scroll direction has been changed.
"
Class {
	#name : #FLCI2CScrollDirectionAnnouncement,
	#superclass : #FLCI2CAnnouncement,
	#instVars : [
		'isToTheLeft',
		'isToTheRight'
	],
	#category : #'Firmata-LiquidCrystalI2C-Implementation'
}

{ #category : #'instance creation' }
FLCI2CScrollDirectionAnnouncement class >> new: isToTheLeft [

	"I instantiate myself, persisting whether I'm to the left or to the right"

	| this |
	this := self new.
	this isToTheLeft: isToTheLeft.
	this isToTheRight: isToTheLeft not.
	^ this
]

{ #category : #accessing }
FLCI2CScrollDirectionAnnouncement >> isToTheLeft [

	^ isToTheLeft
]

{ #category : #accessing }
FLCI2CScrollDirectionAnnouncement >> isToTheLeft: anObject [

	isToTheLeft := anObject
]

{ #category : #accessing }
FLCI2CScrollDirectionAnnouncement >> isToTheRight [

	^ isToTheRight
]

{ #category : #accessing }
FLCI2CScrollDirectionAnnouncement >> isToTheRight: anObject [

	isToTheRight := anObject
]
