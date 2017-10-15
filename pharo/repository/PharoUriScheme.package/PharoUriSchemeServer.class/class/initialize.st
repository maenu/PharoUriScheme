initialization
initialize
	Port := 9452.
	Default := (self on: Port)
		delegate: PharoUriSchemeDelegate new;
		yourself