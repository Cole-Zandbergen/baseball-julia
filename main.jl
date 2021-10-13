#------------------------------------------
# Programming Assignment 2
# CS424-01 Fall 2021
# Professor: Beth Allen
# Authors: Janilou Sy, Cole Zandbergen
# 
#-------------------------------------------

#Mutable struct that contains info for each player
mutable struct player
   firstN::String
   lastN::String
   plate::Float64
   atbats::Float64
   singles::Float64
   double::Float64
   triples::Float64
   homeruns::Float64
   walks::Float64
   hitbypitch::Float64
   average::Float64
   slug::Float64
   obp::Float64
   ops::Float64
end

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