Class {
	#name : #FLCI2CAutoscrollAnnouncementTest,
	#superclass : #TestCase,
	#category : #'Firmata-LiquidCrystalI2C-Tests'
}

{ #category : #tests }
FLCI2CAutoscrollAnnouncementTest >> testThatItCanBeInstantiated [

	FLCI2CAutoscrollAnnouncement new: true.
	FLCI2CAutoscrollAnnouncement new: false
]
