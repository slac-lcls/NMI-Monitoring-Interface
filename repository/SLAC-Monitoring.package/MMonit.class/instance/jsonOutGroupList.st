web-helper-outputgen
jsonOutGroupList
	"Prepare the output to be served byt the web server when a request of listing 
		the list of available groups comes int. "
		|templateStructure outStructure out| 
			templateStructure := '[
  {
    "columns":[
      {"text":"Group","type":"string"},
      {"text":"color","type":"string"},
		 {"text":"Color code","type":"string" },
      {"text":"status","type":"string"}
    ],
    "rows":[ ["SE",123], ["DE",231], ["US",321]  ],
    "type":"table"
   } ]'.
  
	"Import the tempate as a Smalltalk data structure"
	outStructure := STON fromString: templateStructure. 

   "Generate the list of rows, which is dinamic"
	out := OrderedCollection new. 
   self groupList do: [ :group| 
		|tmp urlScriptedDashboard|
		urlScriptedDashboard := '<a href="http://localhost:3000/dashboard/script/scripted2.js?orgId=1&group={1}&fullscreen&panelId=2">{2}</a>' format: {(group name). (group name)}. 
		
		tmp := OrderedCollection new.
		tmp add: urlScriptedDashboard.
		tmp add: group ledColor asString. 
		tmp add: group ledColorAsNumber asString.
		tmp add: 'foo message.'.
		out add: tmp. 
	].
 
  "substitute list of rows into the template string."
  (outStructure at: 1) at: 'rows' put: out.

	"convert outStructure into a JSONstring."
   out := outStructure asJsonString .

	^ out 
	
	