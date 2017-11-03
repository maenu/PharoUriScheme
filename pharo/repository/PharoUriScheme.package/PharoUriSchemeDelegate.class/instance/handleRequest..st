public
handleRequest: request
	| pathSegments selector arguments |
	pathSegments := '/' split: request uri path.
	selector := (pathSegments last replaceAll: $. with: $:) asSymbol.
	arguments := request uri query at: 'args'.
	arguments := arguments isArray
		ifTrue: [ arguments ]
		ifFalse: [ {arguments} asArray ].
	[ handler perform: selector withArguments: arguments ]
		on: Error
		do: [ :error | 
			Transcript
				show: error;
				cr ].
	^ ZnResponse noContent