Class {
	#name : #ArgoUMLWidgetsInTheWrongPackages,
	#superclass : #ArgoUMLConstraint,
	#category : #'Argouml-ArchitectureRules'
}

{ #category : #accessing }
ArgoUMLWidgetsInTheWrongPackages >> description [
	^ 'Classes representing widgets (inherit from ''java.awt.Component'') should be placed in packages that contain the ''ui'' component in their name.'
]

{ #category : #accessing }
ArgoUMLWidgetsInTheWrongPackages >> issues [
	| allWidgetClasses |
	allWidgetClasses := self model allModelClasses select: [ :aClass |
 		aClass superclassHierarchyGroup anySatisfy: [ :aSuperclass |
			aSuperclass mooseName = 'java::awt::Component' ] ].
	^ allWidgetClasses reject: [ :aClass ||containerName|
		containerName := aClass container mooseName.
		(containerName includesSubstring: '::ui::') or: [
			containerName endsWith: '::ui'] ].
]

{ #category : #accessing }
ArgoUMLWidgetsInTheWrongPackages >> name [
	 ^ 'Widgets placed in the wrong package'
]

{ #category : #accessing }
ArgoUMLWidgetsInTheWrongPackages >> stakeholder [
 ^ ArgoUMLConstraintStakeholder developmentTeam
]
