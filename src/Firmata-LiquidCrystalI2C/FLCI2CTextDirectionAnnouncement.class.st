"
I announce that the text direction, LTR or RTL, has been changed.
"
Class {
	#name : #FLCI2CTextDirectionAnnouncement,
	#superclass : #FLCI2CAnnouncement,
	#instVars : [
		'isLeftToRight',
		'isRightToLeft'
	],
	#category : #'Firmata-LiquidCrystalI2C-Implementation'
}

{ #category : #'instance creation' }
FLCI2CTextDirectionAnnouncement class >> new: isLeftToRight [

	"I instantiate myself, persisting whether I'm leftToRight or rightToLeft"

	| this |
	this := self new.
	this isLeftToRight: isLeftToRight.
	this isRightToLeft: isLeftToRight not.
	^ this
]

{ #category : #accessing }
FLCI2CTextDirectionAnnouncement >> isLeftToRight [

	^ isLeftToRight
]

{ #category : #accessing }
FLCI2CTextDirectionAnnouncement >> isLeftToRight: anObject [

	isLeftToRight := anObject
]

{ #category : #accessing }
FLCI2CTextDirectionAnnouncement >> isRightToLeft [

	^ isRightToLeft
]

{ #category : #accessing }
FLCI2CTextDirectionAnnouncement >> isRightToLeft: anObject [

	isRightToLeft := anObject
]
