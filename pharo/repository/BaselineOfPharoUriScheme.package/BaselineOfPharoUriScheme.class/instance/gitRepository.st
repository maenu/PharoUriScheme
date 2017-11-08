searching
gitRepository
	self flag: 'there should be a more generic way to determine the repository on the file system'.
	^ ((self class mcWorkingCopy repositoryGroup repositories
		detect: [ :r | (r isKindOf: MCGitHubRepository) and: [ r projectPath = 'maenu/PharoUriScheme' ] ]
		ifFound: [ :r | r directory / '..' / '..' ]
		ifNone: [ FileSystem workingDirectory / 'pharo-local' / 'iceberg' / 'maenu' / 'PharoUriScheme' ]) relativeTo: FileSystem workingDirectory) asFileReference