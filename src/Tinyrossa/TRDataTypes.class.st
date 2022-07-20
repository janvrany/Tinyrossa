Class {
	#name : #TRDataTypes,
	#superclass : #SharedPool,
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
	"Invoked at system start or when the class is dynamically loaded."

	"  please change as required (and remove this comment)"

	Int8 := TRDataTypeInt8 new.
	Int16 := TRDataTypeInt16 new.
	Int32 := TRDataTypeInt32 new.
	Int64 := TRDataTypeInt64 new.
	Address := TRDataTypeAddress new.
	Float := TRDataTypeFloat new.
	Double := TRDataTypeDouble new.
	Void := TRDataTypeVoid new
]
