Class {
	#name : #FLCI2CTextDirectionAnnouncementTest,
	#superclass : #TestCase,
	#category : #'Firmata-LiquidCrystalI2C-Tests'
}

{ #category : #tests }
FLCI2CTextDirectionAnnouncementTest >> testThatItCanBeInstantiated [

	FLCI2CTextDirectionAnnouncement new: true.
	FLCI2CTextDirectionAnnouncement new: false
]
