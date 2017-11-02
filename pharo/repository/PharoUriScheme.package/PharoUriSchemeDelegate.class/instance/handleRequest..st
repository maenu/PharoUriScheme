public
handleRequest: request
	| pathSegments selector arguments |
	pathSegments := '/' split: request uri path.
	selector := ((pathSegments at: 2) replaceAll: $. with: $:) asSymbol.
	arguments := request uri query at: 'args'.
	arguments := arguments isArray
		ifTrue: [ arguments ]
		ifFalse: [ {arguments} asArray ].
	[ handler perform: selector withArguments: arguments ]
		on: Error
		do: [ :error | 
			self flag: 'adobe acrobat seems to need success responses, so we catch it here already'.
			Transcript
				show: error;
				cr ].
	^ ZnResponse noContent