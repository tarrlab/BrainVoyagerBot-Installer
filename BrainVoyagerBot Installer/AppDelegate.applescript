--
--  AppDelegate.applescript
--  BrainVoyagerBot Installer
--
--  Created by Deb on 1/25/13.
--  Copyright (c) 2013 Deb. All rights reserved.
--
property NSWindow : class "NSWindow"

script AppDelegate
	property parent : class "NSObject"
    property processingPanel: missing value
	property processingBar: missing value
    property processingLabel: missing value
    property pathToResources : ""
    property _folder : ""
    property pathToFMRfile : ""
    property pathTOVTCfile : ""
    

    on runScript()
        set pathToResources to (current application's class "NSBundle"'s mainBundle()'s resourcePath()) as text
        set _folder to (path to documents folder as text) & "BVQXExtensions:Scripts" as alias 
        set fmrFile to (pathToResources) & "/FMR_Maker.js"
        set vtcFile to (pathToResources) & "/VTC_Maker.js"
        set pathToFMRfile to (((fmrFile as text) as POSIX file) as alias)
        set pathToVTCfile to (((vtcFile as text) as POSIX file) as alias)
        tell application "Finder"
            try
                move file pathToFMRfile to folder _folder
            on error number -15267
                processingLabel's setStringValue_("Removing old version of FMR_Maker.js")
                delay 2
                delete file "FMR_Maker.js" in folder _folder
                move file pathToFMRfile to folder _folder
            end try
            try
                move file pathToVTCfile to folder _folder
            on error number -15267
                processingLabel's setStringValue_("Removing old version of VTC_Maker.js")
                delay 2
                delete file "VTC_Maker.js" in folder _folder
                move file pathToVTCfile to folder _folder
            end try
        end tell
    end runScript
    
    on applicationDidFinishLaunching_()
        processingPanel's makeKeyAndOrderFront_(processingPanel)
        processingLabel's setHidden_(false)
        processingBar's setHidden_(false)
        processingBar's startAnimation_(processingBar)
        processingLabel's setStringValue_("Installing JavaScript files...")
        delay 3
        runScript()
        processingLabel's setStringValue_("Finished!")
        delay 2
        processingPanel's performClose_(processingPanel)
        -- processingPanel's performClose_(processingPanel)
    end applicationDidFinishLaunching

    on applicationShouldTerminateAfterLastWindowClosed_(sender)
        return true
    end applicationShouldTerminateAfterLastWindowClosed_
    
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script