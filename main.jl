#------------------------------------------
# Programming Assignment 2
# CS424-01 Fall 2021
# Professor: Beth Allen
# Authors: Janilou Sy, Cole Zandbergen
# 
#-------------------------------------------
#Note: October 22, 2021 So I already made the average, slug, onbase and OPS function. Rounded up too 3 decimal places.
#And formatted the print 
#So all we need to do is SORT it by OPS 
import Statistics
using Printf

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

#Function that calculates player's average
function calcAverage(p)
    return (p.singles + p.doubles + p.triples + p.homeruns)/p.atbats
end

#Function that calculates the player's slugging percentage
function calcSlug(p)
    return ((p.singles) + (2 * p.doubles) + (3 * p.triples) + (4 * p.homeruns))/p.atbats
end

#Function that calculates the player's on-base percentage
function calcOnbase(p)
    return (p.singles +p.doubles + p.triples + p.homeruns + p.walks + p.hitbypitch)/p.plate
end

#Function that calculates the player's OPS
function calcOPS(p)
    return (calcOnbase(p) + calcSlug(p))
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
  
end

#Loop that calculates average, slugging, on-base, and OPS
for p in players          
    p.average = round(calcAverage(p); digits = 3)
    p.slug = round(calcSlug(p); digits = 3)
    p.obp = round(calcOnbase(p); digits = 3)
    p.ops = round(calcOPS(p); digits = 3)    
end

#this line will sort the player list by their ops values
players = sort(players, by = player -> player.ops, rev = true)

#Prints all player info
println("  ", repeat("-", 50))
@printf("  |  BASEBALL TEAM REPORT - TOTAL PLAYERS FOUND: %d |\n", length(players))
println("  ", repeat("-", 50))
@printf("%15s %-15s|  %15s %15s %15s %13s\n", "PLAYER"," NAME", "AVERAGE", "SLUGGING", "ONBASE", "OPS")
println("        ", repeat("-", 87))
for p in players
    @printf("%15s %-15s| %15.3f %15.3f %15.3f %15.3f  \n", p.firstN, p.lastN, p.average, p.slug, p.obp, p.ops)
end
