"
Add with Carry
"
Class {
	#name : #AJx86ADC,
	#superclass : #AJx86AluInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86ADC class >> description [
	^ #(#adc #alu 0 0 "R" 2 "C1" 16r00000010 "C2" 16r00000080 )
]

{ #category : #accessing }
AJx86ADC class >> mnemonic [
	^ #adc
]

{ #category : #accessing }
AJx86ADC >> opCode [
	^ 16r10
]

{ #category : #accessing }
AJx86ADC >> opCode2 [
	^ 16r80
]
