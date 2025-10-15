# One Repository Version Upgrade Template 
<!--- parameters of your upgrade -->

Version:

Date:

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

- [ ] Go to the corresponding SIMPLIFIER Project and _-> Github -> Reimport_ the project.
- [ ] Go to the corresponding SIMPLIFIER Project and _-> Packages -> Expand the Dropdown for Create -> Create new package_ for the project.
  - [ ] With the corresponding version number, and
  - [ ] The Release notes (from all Igs with changes) 
  - [ ] Unlist the old package by _-> clicking on the old package_, _-> go to Administration_ and _-> click on Unlist_
- [ ] Archive all the changed IGs. Use the steps described below
- [ ] Publish all the IGs **with changes** in Simplifier. Do the following for each one:
  - [ ]  Provide a version in the IG title --> (x.x.x)
  - [ ]  Scope the IG to the published package
  - [ ]  Set URL key to isik-[module-name]-version (version without dots)
  - [ ]  Publish via Simplifier GUI (set to overwritable)

## Archive IG

**Archiving needs to be done before publishing the IGs**
-  Provide / Archive the IG in the corresponding _gh-pages_ branch of the GitHub project.
  - Checkout the Branch (no need to merge it later). 
  - Export from Simplifier via _-> Guides -> Expand the Modul ... -> Export_
  - Add the zip (other tasks are automated by action called "Unzip and Update IG Version in webpage", in order to provide the Archige in the following page . https://gematik.github.io/spec-ISiK-Basismodul/index.html)



## Finished
