// IHE IT Infrastructure Technical Committee, MHD 4.2.2, CC-BY-4.0.
// Source: https://profiles.ihe.net/ITI/MHD/4.2.2/SearchParameter-DocumentReference-Creation.json
// License: https://creativecommons.org/licenses/by/4.0/
// Published resource transcribed to FSH without content changes.
// Included individually to resolve the capability canonical without the full MHD dependency.
Instance: DocumentReference-Creation
InstanceOf: SearchParameter
Usage: #definition
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2>Creation</h2><p>Parameter <code>creation</code>:<code>date</code></p><div><p>This SearchParameter enables finding DocumentReference by the creation dateTime.</p>\n</div><table class=\"grid\"><tr><td>Resource</td><td><a href=\"http://hl7.org/fhir/R4/documentreference.html\">DocumentReference</a></td></tr><tr><td>Expression</td><td><code>DocumentReference.content.attachment.creation</code></td></tr><tr><td>Multiples</td><td><ul><li>multipleAnd: It's up to the server whether the parameter may repeat in order to specify multiple values that must all be true</li><li>multipleOr: It's up to the server whether the parameter can have multiple values (separated by comma) where at least one must be true</li></ul></td></tr></table></div>"
* url = "https://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation"
* version = "4.2.2"
* name = "Creation"
* status = #active
* date = "2024-05-18T12:31:54-05:00"
* publisher = "IHE IT Infrastructure Technical Committee"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "https://www.ihe.net/ihe_domains/it_infrastructure/"
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "iti@ihe.net"
* contact[2].name = "IHE IT Infrastructure Technical Committee"
* contact[2].telecom[0].system = #email
* contact[2].telecom[0].value = "iti@ihe.net"
* description = "This SearchParameter enables finding DocumentReference by the creation dateTime."
* jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* jurisdiction[0].coding[0].code = #001
* code = #creation
* base[0] = #DocumentReference
* type = #date
* expression = "DocumentReference.content.attachment.creation"
