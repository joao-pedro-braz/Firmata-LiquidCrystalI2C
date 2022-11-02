Class {
	#name : #FLCI2CPrintWithBaseAnnouncementTest,
	#superclass : #TestCase,
	#category : #'Firmata-LiquidCrystalI2C-Tests'
}

{ #category : #tests }
FLCI2CPrintWithBaseAnnouncementTest >> testThatItCanBeInstantiated [

	FLCI2CPrintWithBaseAnnouncement new: 13 withBase: 13
]
