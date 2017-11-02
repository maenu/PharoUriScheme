all: build

build :
	xcodebuild -scheme PharoUriScheme clean archive
