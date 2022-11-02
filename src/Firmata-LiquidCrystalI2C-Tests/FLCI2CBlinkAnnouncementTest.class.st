Class {
	#name : #FLCI2CBlinkAnnouncementTest,
	#superclass : #TestCase,
	#category : #'Firmata-LiquidCrystalI2C-Tests'
}

{ #category : #tests }
FLCI2CBlinkAnnouncementTest >> testThatItCanBeInstantiated [

	FLCI2CBlinkAnnouncement new: true.
	FLCI2CBlinkAnnouncement new: false
]
