A MMonit is class to query machines status to a MasterMonit server. 

. The examples at the moment are designed to run from MY MACHINE 
   and to query SLAC LCLS psmetric01 MMonit. 

. Some examples write in Transcript. So take a look there. 

---------- EXAMPLES --------------------

--- Just to see something interactively
MMonit printAllGroups .    
... 
MMonit printAllGroupsAndHostsWithDetails .   
printRedLedHosts
printRedLedGroups

--- Instantiating objects: 
mm := MMonit user: 'API' authFile: '/home/p/.monit/auth'.
mm groupList. 

----------------------------------------------

TODO.
-] message to update 'mm' obejct data 
-] 


This class requires:
. To be run on a Unix like system 
. OSProcesses
. The program "curl" to access MMonit web server. 


Instance Variables
	cookiePath:		<Object>
	host:		<Object>
	password:		<Object>
	port:		<Object>
	user:		<Object>

cookiePath
	- xxxxx

host
	- xxxxx

password
	- xxxxx

port
	- xxxxx

user
	- xxxxx