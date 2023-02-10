Class {
	#name : #TRCFGEdgeObject,
	#superclass : #DisplayObject,
	#instVars : [
		'view',
		'src',
		'srcPoint',
		'dst',
		'dstPoint'
	],
	#category : #'Tinyrossa-Tools-SmalltalkX'
}

{ #category : #queries }
TRCFGEdgeObject >> canBeMoved [
	"return true, if the receiver can be moved around (in an ObjectView)"

	^ false

	"Modified: / 4.7.1999 / 18:49:26 / cg"
]

{ #category : #queries }
TRCFGEdgeObject >> canBeSelected [
	"return true, if the receiver can be selected (in an ObjectView)"

	^ false

	"Created: / 4.7.1999 / 18:49:20 / cg"
]

{ #category : #initialization }
TRCFGEdgeObject >> computeBoundingBox [
	"compute my boundingBox into the local variable 'frame'.
	 The box should be computed for Display."  

	| srcCenter dstCenter origin corner |

	srcCenter := src frame center rounded.
	dstCenter := dst frame center rounded.

	srcCenter x < dstCenter x ifTrue: [ 
		srcCenter y < dstCenter y ifTrue: [ 
			srcPoint := src frame bottomRight - 5.
			dstPoint := dst frame topLeft + 5
		] ifFalse: [ 
			srcPoint := src frame topRight + (-5@5).
			dstPoint := dst frame bottomLeft + (5@-5).
		].
	] ifFalse: [ 
		srcCenter y < dstCenter y ifTrue: [ 
			srcPoint := src frame bottomLeft + (5@-5). 
			dstPoint := dst frame topRight + (-5@5).        
		] ifFalse: [ 
			srcPoint := src frame topLeft + 5.
			dstPoint := dst frame bottomRight - 5.
		].
	].

	origin := (srcPoint x min: dstPoint x) @ (srcPoint y min: dstPoint y).
	corner := (srcPoint x max: dstPoint x) @ (srcPoint y max: dstPoint y).

	frame := origin corner: corner.
]

{ #category : #drawing }
TRCFGEdgeObject >> drawIn: aView offset: anOffset [
	"draw the receiver at its origin offset by anOffset, aPoint"

	| savedFg |

	savedFg := aView foreground.
	[
		src block successor1 == dst block ifTrue: [
			aView foreground: Color blue.
		] ifFalse: [ 
			aView foreground: Color green.
		].


		aView displayLineFrom: srcPoint to: dstPoint.
		aView fillCircle: dstPoint radius:3. 

"         frame := Rectangle "
"                     origin: (srcPoint x min: dstPoint x) @ (srcPoint y min: dstPoint y)"
"                     corner: (srcPoint x max: dstPoint x) @ (srcPoint y max: dstPoint y)"

	] ensure: [ 
		aView foreground: savedFg.
	].
]

{ #category : #accessing }
TRCFGEdgeObject >> dst [
	^ dst
]

{ #category : #testing }
TRCFGEdgeObject >> isBlock [
	^ false
]

{ #category : #testing }
TRCFGEdgeObject >> isEdge [
	^ true
]

{ #category : #accessing }
TRCFGEdgeObject >> origin: origin [
	"object must calculate its dimension from outline"

	frame := origin copy extent: self frame extent.
]

{ #category : #accessing }
TRCFGEdgeObject >> origin: origin corner: corner [
	"object must calculate its dimension from outline"

	frame := origin corner: corner
]

{ #category : #accessing }
TRCFGEdgeObject >> src [
	^ src
]

{ #category : #accessing }
TRCFGEdgeObject >> src: srcNode dst: dstNode [
	src := srcNode.
	dst := dstNode.

	self computeBoundingBox
]

{ #category : #accessing }
TRCFGEdgeObject >> view [
	^ view
]

{ #category : #accessing }
TRCFGEdgeObject >> view: anObjectView [
	view := anObjectView.
]

{ #category : #accessing }
TRCFGEdgeObject >> widthFrom: startIndex to: endIndex on: aGC [
	"return the width of part of myself if drawn on aCG"

	^ self shouldImplement
]
