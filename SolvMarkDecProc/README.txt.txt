////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////										******								     ///////	
///////							*README for Solving Markov Decision Problem Assignement*				     ///////
///////							    **Gabriel Gattaux - Erasmus Master 1 - May 2021**					     ///////
///////										******								     ///////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

I) Description of the folders/files
II) How to run/compile


I) Description of the folders/files

	SolvMarkDecProc <--- Main Folder
	|       | 
	|	Part_I_MDP <--- First Part Folder
	|    		|_________________________________________________________________________________
	|		.Markov_Decision_Process_Driver.m <--- Script Driver to RUN
	|		.aEast.m   <- function Part of Bellman Equation, use in .ValueIteration.m
	|		.aNorth.m  <- ""					
	|		.aSouth.m  <- ""
	|		.aWest.m   <- ""
	|		.maxindex.m <- function to find maximum index of value, use in .ValueIteration.m
	|		.ValueIteration.m <--- function to compute the U value and Policy
	|		.read_f3.m  <- function to read data from 'appendix.txt'
	|		DATA <--- Folder where the Utility Values and Policy will be write
	|		Plot <--- Folder where the Convergence Plot will be write
	|		__________________________________________________________________________________
	|_______	
	|	|
	|	Part_II_QL <--- Second Part Folder
	|		|_________________________________________________________________________________
	|		.Q_Learning_Driver.m <--- Script Driver to RUN
	|		.Simulator.m <-- function wich return Qvalue from simulation
	|		.get_next_action.m <- function used in Simulator
	|		.get_next_location <- ""
	|		.get_shortest_path <- ""
	|		.is_terminal_state <- ""
	|		DATA <--- Folder where the Utility Value, sample of Qvalue for Right Action and Policy will be write
	|		__________________________________________________________________________________
	|_______
	|	|
	|	README.txt
	|_______
		|
		AI_task4_report.pdf <--- The concise report	


II) How to run/compile

	a)WINDOWS

This is my OS, so I use matlab in Windows mode. 
To Run this program on windows you just have to :

RUN the Driver ".Markov_Decision_Process_Driver.m" for the PART I
By default the Driver RUN automatically all the pb and different environnement and plot the convergence plot and write the DATA of each of them.
	You can change the name of the file called at Line 14 : "[W,S,P,G,R,F,T]=read_f3("appendix.txt")" if you want to read another file.
	You can change the value of pb to just compute one environnement.

RUN the Driver ".Q_Learning_Driver.m" for the PART II
By default the Driver RUN automatically all the world and different environnement and write the DATA of each of them.
	You can change the value of World to compute just one environnement.


	b)LINUX

I am not very familiar with this environnement even if I have to and I want to. But I found that you can RUN the Different Drivers (see WINDOWS) like that :

If you are in the Folder of PART I : 
 ~ matlab -nodisplay  -r Markov_Decision_Process_Driver,exit

	If you want the output log into a log file (useless, the program do the same by his own) : 
	 ~ matlab -nodisplay  -r Markov_Decision_Process_Driver,exit  -logfile output.txt

If you are in the Folder of PART II : 
 ~ matlab -nodisplay  -r Q_Learning_Driver,exit

**********************************************************END**********************************************************************
I hope this README.txt will save you some time
