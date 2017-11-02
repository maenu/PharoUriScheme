baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				configuration: 'OSProcess'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ];
				package: 'PharoUriScheme' with: [ spec requires: 'OSProcess' ];
				group: 'default' with: #('PharoUriScheme');
				postLoadDoIt: #postLoadActions ]