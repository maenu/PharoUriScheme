public
handleRequest: request
	| id key text |
	id := request uri query at: 'id'.
	key := request uri query at: 'key'.
	text := request uri query at: 'text'.
	Transcript show: id , ' references ', key, ' ', text; cr.
	^ ZnResponse noContent