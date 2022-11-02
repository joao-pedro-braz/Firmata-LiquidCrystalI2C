Class {
	#name : #FLCI2CScrollDirectionAnnouncementTest,
	#superclass : #TestCase,
	#category : #'Firmata-LiquidCrystalI2C-Tests'
}

{ #category : #tests }
FLCI2CScrollDirectionAnnouncementTest >> testThatItCanBeInstantiated [

	FLCI2CScrollDirectionAnnouncement new: true.
	FLCI2CScrollDirectionAnnouncement new: false
]
