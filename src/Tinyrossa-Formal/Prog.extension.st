Extension { #name : #Prog }

{ #category : #'*Tinyrossa-Formal' }
Prog class >> empty [
	^self quals: #() meas: #() expr: (ΛExpression int: 0) data: #() options: #()

]
