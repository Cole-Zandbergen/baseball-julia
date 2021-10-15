#------------------------------------------
# Programming Assignment 2
# CS424-01 Fall 2021
# Professor: Beth Allen
# Authors: Janilou Sy, Cole Zandbergen
# 
#-------------------------------------------

import Statistics

#Mutable struct that contains info for each player
mutable struct Player
   firstN::String
   lastN::String
   plate::Float64
   atbats::Float64
   singles::Float64
   doubles::Float64
   triples::Float64
   homeruns::Float64
   walks::Float64
   hitbypitch::Float64
   average::Float64
   slug::Float64
   obp::Float64
   ops::Float64
end

function printPlayer(p) #function created for testing purposes
    println(p.firstN, " ", p.lastN)
end

#This part of the code opens and reads the file
print("\nEnter filename: ")
global userfile = nothing
filename = readline()

try
    global userfile = open(filename)

catch err
    println("\nUnable to open the file: $filename")
	println("Exiting the program\n")
	exit(0)
end

lines = readlines(userfile) #lines will hold a list of each line in the file
players = [] #players will be used to hold each player object after it has been initialized
for line in lines
    data = split(line, " ") #split the line by spaces, and store each separate word as an element in the list 'data'
    push!(players, Player(data[1], data[2], parse(Float64, data[3]), parse(Float64, data[4]), parse(Float64, data[5]), parse(Float64, data[6]), parse(Float64, data[7]), parse(Float64, data[8]), parse(Float64, data[9]), parse(Float64, data[10]), 0, 0, 0, 0))
    # the above line creates a new instance of the player struct with its values loaded from the data list
    # NOTE: I fixed the issue we had earlier by switching from the append! to the push! method -- no idea what the difference is based on reading the julia documentation
end

for p in players #this is just to test that the structs were created and that their fields hold information
    printPlayer(p)
end