Class {
	#name : #FLCI2CCursorAnnouncementTest,
	#superclass : #TestCase,
	#category : #'Firmata-LiquidCrystalI2C-Tests'
}

{ #category : #tests }
FLCI2CCursorAnnouncementTest >> testThatItCanBeInstantiated [

	FLCI2CCursorAnnouncement new: true.
	FLCI2CCursorAnnouncement new: false
]
