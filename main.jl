#------------------------------------------
# Programming Assignment 2
# CS424-01 Fall 2021
# Professor: Beth Allen
# Authors: Janilou Sy, Cole Zandbergen
# 
#-------------------------------------------

#This part of the code opens and reads the file
print("\nEnter filename: ")
userfile = nothing
filename = readline()

try
    global userfile = open(filename)

catch err
    println("\nUnable to open the file: $filename")
	println("Exiting the program\n")
	exit(0)
end

lines = readlines(userfile)
print(lines[1])