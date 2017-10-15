# macOS: Shell Script Preferences
Create preferences plist file to store script variable(s)

            version 0.1.0                           
                                                                
            Oct 15, 2017                            
                                                                
It adds preferences logic on shell script
               
 - prevents to edit the script itself to modify variable(s)                           
 - creates preferences plist file                                     
 - checks plist integrity before to execute script              
 - interacts with end-user to validate stored variable(s)                    
                                                                
 Revision(s)                                                  
 - none
 
 Requirement(s)
 - macOS 10.12 or greater
                                                                
 Autor(s): Fred Blaison, Paris - France     

 Usage(s)

 - Replace value(s) name(s) template(s) with appropriate info
 	* e.g. _valueA alias_ by _soundEffects alias_, _valueA_ by _soundEffects_; _Value A_ by _Funk_ (value by default)
 	* change _What is the value A?_ by something like _What is the desired Sound Effect?_
 	
 - Add or Remove then Replace value(s) as desired in
	* checkPrefsPlistExistence()
 	* checkPrefsPlistValidity()
 	* createPrefsPlist()
 	* writePrefsPlist()
 	* getConstants()
 	
 - It is modular and it can be adapted to bypass the End-User interaction (question / answer) in order to be integrated in a fully automated process
 	* modify condition in checkPrefsPlistExistence()
 	* remove default(s) question(s) in createPrefsPlist()
