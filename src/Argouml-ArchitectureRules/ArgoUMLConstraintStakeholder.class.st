Class {
	#name : #ArgoUMLConstraintStakeholder,
	#superclass : #GtConstraintStakeholder,
	#classInstVars : [
		'developmentTeam',
		'architectureTeam'
	],
	#category : #'Argouml-ArchitectureRules'
}

{ #category : #'instance creation' }
ArgoUMLConstraintStakeholder class >> architectureTeam [
  ^ architectureTeam ifNil: [
      architectureTeam := self new name: 'Architecture Team' ]
]

{ #category : #'instance creation' }
ArgoUMLConstraintStakeholder class >> developmentTeam [
	^ developmentTeam ifNil: [
      developmentTeam := self new name: 'Development Team' ]
]
