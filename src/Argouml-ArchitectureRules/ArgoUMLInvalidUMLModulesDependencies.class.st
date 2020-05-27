Class {
	#name : #ArgoUMLInvalidUMLModulesDependencies,
	#superclass : #ArgoUMLConstraint,
	#category : #'Argouml-ArchitectureRules'
}

{ #category : #accessing }
ArgoUMLInvalidUMLModulesDependencies >> description [
	^ 'UML modules for different programming language should not depend on one another.'
]

{ #category : #accessing }
ArgoUMLInvalidUMLModulesDependencies >> issues [
	|modulesNames modulesPackages modulesByName allInvalidDependencies|
	 modulesNames := #('cpp' 'csharp' 'java' 'php' 'sql').
	 modulesPackages := model allModelNamespaces select: [:aNamespace |
		| fullName |
		fullName := aNamespace mooseName.
		modulesNames anySatisfy: [ :moduleName |
			fullName beginsWith: 'org::argouml::language::', moduleName]].
		modulesByName := modulesPackages groupedBy: [ :aNamespace |    
			aNamespace withAllParentScopes reversed fourth mooseName ].
		
	allInvalidDependencies := OrderedCollection new.
	modulesByName keysAndValuesDo: [ :moduleName :packages |
		| moduleDependencies invalidDependencies otherModulesNames |
		 moduleDependencies := packages flatCollect: #queryAllOutgoing. 
		otherModulesNames := modulesByName keys copyWithout: moduleName.
		 
		invalidDependencies := moduleDependencies select: [:aDependency |
			aDependency to asCollection anySatisfy: [ :aCandidate |
				otherModulesNames anySatisfy: [ :anotherModuleName |
					aCandidate mooseName beginsWith: anotherModuleName ] ] ] .
		allInvalidDependencies addAll: invalidDependencies ].
	^ allInvalidDependencies
]

{ #category : #accessing }
ArgoUMLInvalidUMLModulesDependencies >> name [
	 ^ 'Invalid dependencies between UML modules'
]

{ #category : #accessing }
ArgoUMLInvalidUMLModulesDependencies >> stakeholder [
	^ ArgoUMLConstraintStakeholder architectureTeam
]
