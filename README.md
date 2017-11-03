# PharoUriScheme

Adds the `pharo://` protocol to be understood by Pharo. Currently, only macOS is supported.

## Installation

Make sure you have `make` the `Xcode command line tools` installed. Then run the following script in a playground:

```
Metacello new
	configuration: 'PharoUriScheme';
	repository: 'github://maenu/PharoUriScheme/pharo/repository';
	load
```

## How it works

During installation a native app is built that registers itself as the default application for the `pharo://` protocol.
Whenever a `pharo://` link is clicked, this app will get the OS event and forward it as an HTTP message to `http://localhost:9452`.
That's why you need to have an HTTP server running in Pharo listening on this port.
This is what `PharoUriSchemeServer` is for, it translates URIs to message sends to a handler.
The server treats the last path segment as a selector, translating `.` to `:`.
The arguments are URL-decoded from all `args` query parameters in order.

## A minimal example

We start a server in Pharo with a basic block handler that just prints the input on the transcript.

```
Transcript open.
s := PharoUriSchemeServer handler: [ :s | Transcript show: s; cr ].
s start
s
```

When the link `pharo://whatever/you/want/value.?args=Hello%20world` is clicked (as in this [example](https://jsfiddle.net/qoq1wyya/)), the app get the URI from an OS event and sends a request to `http://localhost:9452/whatever/you/want/value.?args=Hello%20world`.
In Pharo the server translates it to the message send `handler value: 'Hello world'`, so will see `Hello world` printed in the transcript.
