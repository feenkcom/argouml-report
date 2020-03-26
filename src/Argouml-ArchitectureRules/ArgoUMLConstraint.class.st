Class {
	#name : #ArgoUMLConstraint,
	#superclass : #GtLeafConstraint,
	#instVars : [
		'model'
	],
	#category : #'Argouml-ArchitectureRules'
}

{ #category : #accessing }
ArgoUMLConstraint >> model [
	^ model
]

{ #category : #accessing }
ArgoUMLConstraint >> model: anObject [
	model := anObject
]
