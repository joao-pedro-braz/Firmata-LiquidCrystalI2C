Class {
	#name : #FLCI2CCustomCharAnnouncementTest,
	#superclass : #TestCase,
	#category : #'Firmata-LiquidCrystalI2C-Tests'
}

{ #category : #tests }
FLCI2CCustomCharAnnouncementTest >> testThatItCanBeInstantiated [

	| charMap |
	charMap := FLCI2CCharMap newFrom:
		           #( 2r11111 2r11111 2r11111 2r11111 2r11111 2r11111
		              2r11111 2r11111 ).

	FLCI2CCustomCharAnnouncement new: charMap withIndex: 1
]
