Class {
	#name : #FLCI2CDisplayAnnouncementTest,
	#superclass : #TestCase,
	#category : #'Firmata-LiquidCrystalI2C-Tests'
}

{ #category : #tests }
FLCI2CDisplayAnnouncementTest >> testThatItCanBeInstantiated [

	FLCI2CDisplayAnnouncement new: true.
	FLCI2CDisplayAnnouncement new: false
]
