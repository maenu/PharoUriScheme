as yet unclassified
installApp
	self run: 'cp ''' , (self gitRepository / 'bin' / 'PharoUriScheme.app') pathString , ''' ''/Applications/'''