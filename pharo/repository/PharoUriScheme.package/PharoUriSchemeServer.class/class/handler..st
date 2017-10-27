as yet unclassified
handler: aHandler
	^ (self on: Port)
		delegate: (PharoUriSchemeDelegate handler: aHandler);
		yourself