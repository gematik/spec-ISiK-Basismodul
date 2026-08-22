# One Repository Version Upgrade Template 
<!--- parameters of your upgrade -->

## Description
<!--- CAVEAT: You to be an admin to perform all the necessary jobs. -->
This is a Pullrequest that requires an increase in the Version number. Therefore, multiple outside-github, related Task have to be performed and checked.

All jobs with an `x` in the boxes were performed to the best of knowledge.

## Pre-Merge Activities
<!--- Lets check everything before we continue. -->
- [ ] Identify changes: Check which IGs are affected (by screening the Release notes) and what type of change it is (patch, minor, major).
- [ ] Select the highest version change: If a minor update is made to one module, then all modules receive a minor update with the corresponding note in the release notes → This version change will be applied to the last package version.
- [ ] Create a TC branch and PR with this version number
- [ ] Run the actions successful: Version 
  - [ ] Version update
  - [ ] CI validation
- [ ] With the updated Version, Dates, and Release Notes (as described above) with the last committ into the Branch you want to merge.
- [ ] Add the Approve / the PR gets positively reviewed by a colleague.
- [ ] Merge (without squash) the PR, delete the Branch.

## Post-Merge Activities
<!--- Do some update, refresh and cleanup of related resources. -->

- [ ] A new Release is being created.In Github, go to 
  - _-> Releases_ then _-> Draft a new release_ with ISiK and _Version_, then
  - _-> Target the main-Branch_ and _-> enter a new Tag according to the Version_, then click.
  - Finally _-> Publish release_
- [ ] Go to the corresponding SIMPLIFIER Project and _-> Github -> Reimport_ the project.
- [ ] Make sure the package.json in the simplifier files folder is updated and synced between simplifier an the repo (mind the dependency versions)
- [ ] Go to the corresponding SIMPLIFIER Project and _-> Packages -> Expand the Dropdown for Create -> Create new package_ for the project.
  - [ ] With the corresponding version number, and
  - [ ] The Release notes (from all Igs with changes) 
  - [ ] Unlist the old package by _-> clicking on the old package_, _-> go to Administration_ and _-> click on Unlist_
- [ ] Publish IGs to GemspecPages Dev space using the Jenkins Pipeline ttps://jenkins.prod.ccs.gematik.solutions/view/FHIR-Publishing/
- [ ] Check the IGs possibly main page and if automatically the tabs and correct linking between the pages
- [ ] Publish IGs from the GemspecPages Dev space to the GemspecPages QS space ttps://jenkins.prod.ccs.gematik.solutions/view/FHIR-Publishing/
- [ ] Finally publish the IGs to te GemspecPages Prod space using the Jenkings-pipeline ttps://jenkins.prod.ccs.gematik.solutions/view/FHIR-Publishing/ 

## Finished
