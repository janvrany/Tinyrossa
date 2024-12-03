Extension { #name : #BlockClosure }

{ #category : #'*Tinyrossa' }
BlockClosure >> on: exceptions1 do: handler1 on: exceptions2 do: handler2 on: exceptions3 do: handler3 [
	[
		self on: exceptions1 do: handler1
			 on: exceptions2 do: handler2
	]        on: exceptions3 do: handler3

	"Created: / 03-12-2024 / 11:27:16 / Jan Vrany <jan.vrany@labware.com>"
]
