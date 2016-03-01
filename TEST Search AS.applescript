(*
====================================================
	How to Search for Text in Evernote Note URL
====================================================

DATE:     Sat, Nov 14, 2015
AUTHOR: Chris Stone, with minor mods by JMichael
REF:      email
====================================================
*)

set noteList to {} -- initialize for later use

tell application "Evernote"
	
	--–––––––––––––––––––––––––––––––––––––––––––––––
	# Get Full, Multi-List of Notes that meet Criteria
	#	Returns a separate list of Notes for Each NB
	--–––––––––––––––––––––––––––––––––––––––––––––––
	
	set noteMultiList to every note of every notebook whose source URL contains "macscripter"
	
	--–––––––––––––––––––––––––
	# Collapse list of lists into 1 list. 
	--–––––––––––––––––––––––––
	
	repeat with ndx1 in noteMultiList
		
		if contents of ndx1 is not {} then
			
			repeat with ndx2 in ndx1
				set end of noteList to contents of ndx2
			end repeat -- ndx2
			
		end if
	end repeat -- ndx1
	
	set noteMultiList to {}
	
	--–––––––––––––––––––––––––
	# Work with notes in noteList
	--–––––––––––––––––––––––––
	
	set numNotes to count of noteList
	log ("Num of Notes: " & numNotes)
	
	repeat with oNote in noteList
		tell oNote
			log (get title)
			log ("   URL: " & source URL)
		end tell
	end repeat
	
end tell
