Class {
	#name : #TRDataTypes,
	#superclass : #TRSharedPool,
	#classVars : [
		'Address',
		'Double',
		'Float',
		'Int16',
		'Int32',
		'Int64',
		'Int8',
		'Void'
	],
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #initialization }
TRDataTypes class >> initialize [
	self isInitialized ifTrue: [ ^ self ].

	Int8 := TRDataTypeInt8 new.
	Int16 := TRDataTypeInt16 new.
	Int32 := TRDataTypeInt32 new.
	Int64 := TRDataTypeInt64 new.
	Address := TRDataTypeAddress new.
	Float := TRDataTypeFloat new.
	Double := TRDataTypeDouble new.
	Void := TRDataTypeVoid new
]
