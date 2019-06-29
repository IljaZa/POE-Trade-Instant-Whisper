﻿Get_CmdLineParameters() {
	global 0
	
	Loop, %0% {
		param := ""
		param := RegExReplace(%A_Index%, "(.*?)=(.*)", "$1=""$2""") ; Add quotes to parameters. In case any contain a space

		if (param)
			params .= A_Space . param
	}

	return params
}

Handle_CmdLineParameters() {
	global 0, PROGRAM, GAME, RUNTIME_PARAMETERS

	programName := PROGRAM.NAME

	Loop, %0% {
		param := %A_Index%
		
		if RegExMatch(param, "iO)/MyDocuments=(.*)", found) {
			RUNTIME_PARAMETERS["MyDocuments"] := found.1, found := ""
		}
		else if (param="/NoAdmin" || param="/SkipAdmin") {
			RUNTIME_PARAMETERS["SkipAdmin"] := True
		}
		else if (param="/NoReplace" || param="/NewInstance") {
			RUNTIME_PARAMETERS["NewInstance"] := True
		}
	}
}