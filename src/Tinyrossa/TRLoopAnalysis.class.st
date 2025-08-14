Class {
	#name : #TRLoopAnalysis,
	#superclass : #Object,
	#category : #'Tinyrossa-Optimizer-Loops'
}

{ #category : #analyzing }
TRLoopAnalysis class >> analyze: aTRCFG [
	^ self new analyze: aTRCFG
]

{ #category : #analyzing }
TRLoopAnalysis >> analyze: aTRCFG [
	"Find loops in given CFG. Once run, TRCFG >> loops return (possibly empty)
	 list of loop infos (TRLoop)."

	| loops |

	loops := Set new.
	aTRCFG blocks do: [:this |
		this successorsDo: [ :succ |
			(this isDominatedBy: succ) ifTrue: [
				"This is an back-edge - `succ` is loop head,
				 `this` is loop tail."
				 loops add: (TRLoop forHead: succ tail: this)
			].
		].
	].

	aTRCFG loops: loops
]
