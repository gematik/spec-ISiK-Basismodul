# Version Upgrade Template
<!--- parameters of your upgrade -->

Version:

Date:

## Description
<!--- CAVEAT: You to be an admin to perform all the necessary jobs. -->
This is a Pullrequest that requires an increase in the Version number. Therefore, multiple outside-github, related Task have to be performed and checked.

All jobs with an `x` in the boxes were performed to the best of knowledge.

## Pre-Merge Activities
<!--- Lets check everything before we continue. -->
- [ ] This PR refers to a versioned Branch with a name and a version number in the form of N.n.n, e.g. "TC_3.2.1".
- [ ] This PR has a clean meaningful commit history. Minor commits or commits without description have been squashed, at the latest now.
- [ ] Eventually, increase the dependency of to newer Basis Modul and Basispofil-de and possibly others (package json and sushi-config)
- [ ] Run Python script in terminal and increment version
- [ ] New Release Notes were created, alined to the commit history. Possibly, if you want to check the release notes for completeness, check against automatic relesase note generation in GitHub. In Github, go to 
  - [ ] _-> Releases_ then _-> Draft a new release_ with the _Modul Name and Version_, then
  - [ ] _-> Target the main-Branch_ and _-> enter a new Tag according to the Version_, then click.
  - [ ] Click _-> Generate Release notes_ , _-> Adjust them if necessary_ and _-> Copy/Paste the Details in the RealeaseNotes.md_ of the very Branch you want to merge.
  - [ ] Finally _-> Save as Draft_

## Merge and Publishing
<!--- Now lets do the merge. -->
<!--- Include details of your testing environment, especially -->
- [ ] With the updated Version, Dates, and Release Notes (as described above) with the last committ into the Branch you want to merge.
- [ ] In GitHub _-> Actions_ the _-> CI (FHIR Validation)_ workflow terminates successfully.
- [ ] Add the Approve / the PR gets positively reviewed by a colleague.
- [ ] Merge (without squash) the PR, delete the Branch.


## Post-Merge Activities
<!--- Do some update, refresh and cleanup of related resources. -->

- [ ] Go to the corresponding SIMPLIFIER Project and _-> Github -> Reimport_ the project.
- [ ] Go to the corresponding SIMPLIFIER Project and _-> Packages -> Expand the Dropdown for Create -> Create new package_ for the project.
  - [ ] With the corresponding version number, and
  - [ ] The Release notes (from above) and a compare-link to the previous Release.
  - [ ] Unlist the old package by _-> clicking on the old package_, _-> go to Administration_ and _-> click on Unlist_
- [ ] Publish the previously drafted Release, including version number, on GitHub.
- [ ] Provide / Archive the IG in the corresponding _gh-pages_ branch of the GitHub project.
  - [ ] Checkout the Branch (no need to merge it later). 
  - [ ] Export from Simplifier via _-> Guides -> Expand the Modul ... -> Export_
  - [ ] Unpack the zip, remove the packages folder (because its kinda big), and move everything else to a (version corresponding) new folder in the branch folder structure.
  - [ ] Update the file index.html and check rendering.
  - [ ] commit the branch.
- [ ] If ISiK Basismodul was updated all depending Modules should be updated  with a renewed dependency to the incremented Basismodul version - possibly including and closing technical corrections


## Finished
