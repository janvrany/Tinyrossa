Extension { #name : #Prog }

{ #category : #'*Tinyrossa-Formal' }
Prog >> , another [
	| expr′ |
	expr isLet ifTrue:[
		| last |

		last := expr.
		[ last isLet and: [ last expr isLet ]] whileTrue:[last := last expr].
		last expr: another expr.
		expr′ := expr.
	] ifFalse:[
		expr′ := another expr.
	].

	^self class
				quals: self quals , another quals
				meas: self meas , another meas
				expr: expr′
				data: self data , another data
				options: self options asSet , another options

]

{ #category : #'*Tinyrossa-Formal' }
Prog class >> empty [
	^self quals: #() meas: #() expr: (ΛExpression int: 0) data: #() options: #()

]
