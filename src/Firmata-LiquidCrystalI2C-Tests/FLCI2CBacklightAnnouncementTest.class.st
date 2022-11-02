Class {
	#name : #FLCI2CBacklightAnnouncementTest,
	#superclass : #TestCase,
	#category : #'Firmata-LiquidCrystalI2C-Tests'
}

{ #category : #tests }
FLCI2CBacklightAnnouncementTest >> testThatItCanBeInstantiated [

	FLCI2CBacklightAnnouncement new: true.
	FLCI2CBacklightAnnouncement new: false
]
