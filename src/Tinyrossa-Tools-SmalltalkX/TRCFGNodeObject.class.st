Class {
	#name : #TRCFGNodeObject,
	#superclass : #DisplayObject,
	#instVars : [
		'view',
		'block'
	],
	#category : #'Tinyrossa-Tools-SmalltalkX'
}

{ #category : #accessing }
TRCFGNodeObject >> block [
	^ block
]

{ #category : #accessing }
TRCFGNodeObject >> block: aTRILBlock [
	block := aTRILBlock.
]

{ #category : #initialization }
TRCFGNodeObject >> computeBoundingBox [
	"compute my boundingBox into the local variable 'frame'.
	 The box should be computed for Display."

	| labelWidth labelHeight |

	labelWidth := view font widthOf: block name on: view device.  
	labelHeight := view font maxHeight.

	frame := 0@0 extent: (labelWidth + 20) @ (labelHeight + 20)

]

{ #category : #drawing }
TRCFGNodeObject >> drawIn: aView offset: anOffset [
	"draw the receiver at its origin offset by anOffset, aPoint"

	| savedFg |

	savedFg := aView foreground.
	[
		| labelX labelY |

		aView foreground: Color black.
		aView displayRectangleOrigin: frame origin + 2  corner: frame corner - 2.

		labelX := frame origin x + 10.
		labelY := frame origin y + 10 + aView font maxAscent.

		aView displayString: block name x: labelX y: labelY.

	] ensure: [ 
		aView foreground: savedFg.
	].

]

{ #category : #testing }
TRCFGNodeObject >> isBlock [
	^ true
]

{ #category : #testing }
TRCFGNodeObject >> isEdge [
	^ false
]

{ #category : #'user actions-move' }
TRCFGNodeObject >> moveTo:aPoint [
	"object must move to new origin
	 - default is to stay; ought to be redefined in subclass"

	| redraw |

	self origin: aPoint.
	redraw := false.
	view contents do: [:each | 
		each isEdge ifTrue: [ 
			(each src == self or: [ each dst == self ]) ifTrue: [ 
				each computeBoundingBox.
				redraw := true.
			].
		].
	].
	redraw ifTrue: [ 
		view invalidate
	].
]

{ #category : #accessing }
TRCFGNodeObject >> origin: origin [
	"object must calculate its dimension from outline"

	frame := origin copy extent: self frame extent.

]

{ #category : #accessing }
TRCFGNodeObject >> origin: origin corner: corner [
	"object must calculate its dimension from outline"

	frame := origin corner: corner

]

{ #category : #accessing }
TRCFGNodeObject >> view [
	^ view
]

{ #category : #accessing }
TRCFGNodeObject >> view: something [
	view := something.
]

{ #category : #accessing }
TRCFGNodeObject >> widthFrom: startIndex to: endIndex on: aGC [
	"return the width of part of myself if drawn on aCG"

	^ self shouldImplement
]
