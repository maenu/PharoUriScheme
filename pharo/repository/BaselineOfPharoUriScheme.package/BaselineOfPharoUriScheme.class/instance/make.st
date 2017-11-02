searching
make
	| serverClass pipeableOSProcessClass cachedGithubRepository process err out delay |
	serverClass := Smalltalk at: #PharoUriSchemeServer ifAbsent: [ self signal: 'Could not find PharoUriSchemeServer, loading failed.' ].
	pipeableOSProcessClass := Smalltalk
		at: #PipeableOSProcess
		ifAbsent: [ self signal: 'Could not find PipeableOSProcess, loading failed.' ].
	cachedGithubRepository := (serverClass mcWorkingCopy repositoryGroup repositories
		detect: [ :r | (r isKindOf: MCGitHubRepository) and: [ r projectPath = 'maenu/PharoUriSchemeServer' ] ]) directory / '..' / '..'.
	process := pipeableOSProcessClass command: 'cd ''' , cachedGithubRepository , ''' && make'.
	[ out := process upToEndOfFile ] fork.
	[ err := process errorUpToEndOfFile ] fork.
	delay := Delay forMilliseconds: 50.
	[ process isComplete ] whileFalse: [ delay wait ].
	process succeeded
		ifFalse: [ Transcript
				show: 'PharoUriScheme log';
				cr;
				show: 'stdout: ' , out;
				cr;
				show: 'stderr: ' , err;
				cr.
			self signal: 'Make of PharoUriScheme failed, see transcript for logs' ]