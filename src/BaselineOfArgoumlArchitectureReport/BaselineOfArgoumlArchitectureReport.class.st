Class {
	#name : #BaselineOfArgoumlArchitectureReport,
	#superclass : #BaselineOf,
	#category : #BaselineOfArgoumlArchitectureReport
}

{ #category : #baselines }
BaselineOfArgoumlArchitectureReport >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'Argouml-ArchitectureRules' ].

]
