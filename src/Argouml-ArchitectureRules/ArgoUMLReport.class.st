Class {
	#name : #ArgoUMLReport,
	#superclass : #GtConstrainerReport,
	#instVars : [
		'model'
	],
	#category : #'Argouml-ArchitectureRules'
}

{ #category : #'instance creation' }
ArgoUMLReport class >> onModel: aModel [
	^ self basicNew
		model: aModel;
		initialize
]

{ #category : #private }
ArgoUMLReport >> build: aComposite [
	aComposite name: 'ArgoUML Report'.
	aComposite
		addConstraint: (ArgoUMLDeprecatedClassesWithNoDeprecatedClients new 
			model: self model);
		addConstraint: (ArgoUMLWidgetsInTheWrongPackages new 
			model: self model);
		addConstraint: (ArgoUMLInvalidUMLModulesDependencies new 
			model: self model)

]

{ #category : #accessing }
ArgoUMLReport >> model [
	^ model
]

{ #category : #accessing }
ArgoUMLReport >> model: anObject [
	model := anObject
]
