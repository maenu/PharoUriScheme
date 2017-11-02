baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec package: 'PharoUriScheme'.
			spec group: 'default' with: #('PharoUriScheme') ]