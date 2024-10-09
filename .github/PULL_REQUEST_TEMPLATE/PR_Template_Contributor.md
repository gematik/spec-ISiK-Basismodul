
# Contributor Pull Request
<!--- Provide a general summary of your changes in the Title above -->

## Description
<!--- Describe your changes in detail -->

## Motivation and Context
<!--- Why is this change required? What problem does it solve? -->
<!--- If it fixes an open issue, please link to the issue here. -->
<!--- If it full fills an open feature request, please link to the feature request here. -->

## How has this been tested?
<!--- Please describe in detail how you tested your changes. -->
<!--- Include details of your testing environment, especially -->
<!--- the software you teste your change with. -->
<!--- Are other areas of the specification affected? -->

## Snippets or Screenshots (if necessary):

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)

## Checklist:
<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
- [ ] My code follows the code style of this IG / specification.
- [ ] My change requires a change to the documentation or narrative (intend) of the IG.
- [ ] I have already updated the documentation / narrative (intend) accordingly.

## Reviewer / Quality Assurance Checklist
<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
<!--- Please do not hesitate to add additional boxes during review -->
- [ ] The Present PR does not need a thorough review process, due to brevity, low complexity or because it represents a rather minor change; otherwise go trough the list! ... and read the linked manual, if you did not do it yet!

### content review steps ([based on Best Practice IG Germany](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation?version=current))
- [ ] no content review needed
- [ ] [cardinalities in profiles](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Profilierung/Umgang-mit-Kardinalit%C3%A4ten.page.md?version=current) are added with caution (specially 'max') and are thoroughly motivated in a comment
- [ ] modifying-Elements are [highlighted](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Profilierung/Umgang-mit-Modifying-Elements.page.md?version=current)
- [ ]  [meta.profile Elements](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Profilierung/Umgang-mit-Meta-Daten.page.md?version=current) not added or added with extreme caution
- [ ] [StructureDefinition.description](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Profilierung/Dokumentation-und-Nachvollziehbarkeit.page.md?version=current) is filled
- [ ] [Constrained Elements](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Profilierung/Dokumentation-und-Nachvollziehbarkeit.page.md?version=current) contain
    - [ ] naming in ElementDefinition.short 
    - [ ] ElementDefinition.comment contains a motivation
- [ ] [Capability Statement](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Erstellung-eines-CapabilityStatements.page.md?version=current) exists 
    - [ ] the textual searchparameters of every instance do correspond to the definition within the CapabilityStatement
- [ ] [relevant examples exist](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Erstellung-von-Beispieldaten.page.md?version=current)


### formal intellectual review steps of [Implementation Guide](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Erstellung-eines-Implementierungsleitfadens.page.md?version=current) 
- [ ] no formal review needed
- [ ] proofreading for orthography 

- [ ] there are no (critical) validation Errors in the CI pipeline 
    - [ ]  inspected and no critical errors found(In the "github action view" -> Option button -> "View raw logs") - possibly list non-critical below
- [ ] skim reading for correct rendering of IG (possibly using IG-grep of string String like "Could not render")

### automated review steps:
- [ ] no formal review needed
- [ ] check IG-pages for broken links (possibly using plug-in)
- [ ] 

### For reviewers
You migh use this: https://conventionalcomments.org/
