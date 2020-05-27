Class {
	#name : #ArgoUMLDeprecatedClassesWithNoDeprecatedClients,
	#superclass : #ArgoUMLConstraint,
	#category : #'Argouml-ArchitectureRules'
}

{ #category : #accessing }
ArgoUMLDeprecatedClassesWithNoDeprecatedClients >> description [
	^ 'Deprecated classes should not be used from classes that are not themselves deprecated.'
]

{ #category : #accessing }
ArgoUMLDeprecatedClassesWithNoDeprecatedClients >> issues [
	| allDeprecatedClasses |
	allDeprecatedClasses := self model allModelClasses select: [ :each |
		each isAnnotatedWith: 'Deprecated' ].
	^ allDeprecatedClasses select: [ :each |
		each clientTypes anySatisfy: [ :aClient |
			(aClient isAnnotatedWith: 'Deprecated') not ] ]
]

{ #category : #accessing }
ArgoUMLDeprecatedClassesWithNoDeprecatedClients >> name [
	^ 'Deprecated classes with no deprecated clients'
]

{ #category : #accessing }
ArgoUMLDeprecatedClassesWithNoDeprecatedClients >> stakeholder [
  ^ ArgoUMLConstraintStakeholder developmentTeam
]

{ #category : #accessing }
ArgoUMLDeprecatedClassesWithNoDeprecatedClients >> status [ 
	^ GtNeutralConstraintStatus new
]
