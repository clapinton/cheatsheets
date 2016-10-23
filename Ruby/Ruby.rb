#NOTES:
# binding allows you to access in-scope variables outside of their original scope
def bla
  ble=4
  bli="blo"
  blu=true
  binding
end

#bla now returns a biding object, which has a #eval(var_name):
bla.eval("ble") #=4
bla.eval("bli") #="blo"
bla.eval("blu") #=true

#####################################################################



#VARIABLES:
str = "bla"
num = 0
symbol = :ble
arr_a = [1,2,3]
arr_b = ['bla', 'ble', 'bli']
arr_c = [2,3,4,5]
names = {
  Eric: "hot",
  Mari: "hotter",
}

other_names = {
  Eric: "dad",
  daughter: "Lisa",
}

#####################################################################


#STRING METHODS:

#Uppercase
str.upcase

#Lowercase
str.downcase

#Capitalize
str.capitalize

#Reverses a string
str.reverse

#Removes the \n at the end of a String
str.chomp

#Looks for regex and substitutes by 'new string'
str.gsub(/regex/, 'new string')

#Splits str at argument, returning an array
str.split(' ')

#Splits a string into an array of chars
str.chars

#Deletes every instance of the characters that appears on:
# • a list ("eol" would delete all 'e','o' and 'l')
# • the intersection of two or more lists ("aeiou","e" would only delete the "e")
# • a range of chars ("a-f" would delete all chars between "a" and "f")
# Negate by doing "ˆchar". Escape ˆ and - by using "\\-" or "\\ˆ"
str.delete("eol")

#Removes leading and trailing whitespaces. Other options: lstrip, rstrip
str.strip

#You can multiply strings to repeat them
str * 3 #=> "blablabla"

#Whether it starts/ends with a substring
str.start_with?("bl") #true
str.end_with?("laa") #false

#####################################################################


#ARRAY METHODS:

#Push a new element into it
arr_a << 4

#Matches each element between two arrays
arr_a.zip(arr_b) #Returns [[1,'bla'],[2,'ble'],[3,'bli']]

#new_arr will only have the elements that return true from num>3
new_arr = arr.select{|num| num>3}

#Joins all elements as a string, separated by something
arr.join(" ")

#Selects one element at random
arr.sample

#Shuffles the array
arr.shuffle

#Deletes on condition
arr.delete_if {|elem| elem > 3 }

#Intersection of two arrays
arr_a & arr_c #=[2,3]

#Union of two array
arr_a | arr_c #=[1,2,3,4,5]

#Subtraction of two array
arr_a - arr_c #=[1]
arr_c - arr_a #=[4,5]

.length or .size or .count
array[index]
array[index] = val
.first
.last
.include?(value)
.push(value) #to add a value onto the end (also <<)
.pop #to pop off a value from the end
.unshift(value) #to stick a value onto the beginning
.shift #to shift off a value from the beginning
.drop(irx) #returns a new array without the indexed element
.join(separator) #to join an array of strings, separated by a delimiter
arr[90..-1] #From item 90 till last item in an array
.any?, .all?, .none? #Used as .each to check an array for a specific condition. Returns true or false


#####################################################################



#SETS
#They are awesome for searches, as they are much better than arrays.
#On arrays, you have to run through all of its elements. On sets, it goes
#straight into the element.
#Sets are unordered collection of values with no duplicates. It has many
#of the enumerable methods, plus some useful ones
#ATTENTION: you must require the Set module.

set_1 = Set.new([1,2,3,4,5,6,7,8,9])
set_2 = Set.new(["alpha", "bravo", "charlie", "delta", "echo", "apple", "code"])

#Adds data to the set if data doesn't exist yet
set_1.add(10)

#Delete data from set. Does nothing if data is not there
set_1.delete(10)

#Dividing by a common factor
set_1.divide {|el| el%3 }
#=> #{ #{1,4,7},
#      #{2,5,8},
#      #{3,6,9}
#      }

set_2.divide {|str| str[0]}
#=>  { {"alpha", "apple"},
#      {"bravo"},
#      {"charlie", "code"},
#      {"delta"},
#      {"echo"}
#     }

# Subsets and Supersets
Set[1,2,3].subset?(Set[1,2,3,4])
#=> true

Set[1,2,3,4,5,6].superset(Set[2,3,4])
#=> false


#####################################################################


#ENUMERABLE METHODS:

#Similar to arr[idx...self.length]
arr.drop(3)

#Similar to arr[0...idx]
arr.take(3)

#CountIf
arr.count do |item|
  item > value
end

#Returns an array WITH ONLY the selected elements
arr.select do |item|
  item > value
end

#Returns an array WITHOUT the selected elements
arr.reject do |item|
  item > value
end

#Reduce is like JS
#HAS to return something. If condition doesn't return, val will be nil for next iteration
arr.reduce do |val, item|
  val+item
end

#The maximum value that returns from the method
#If two win, the first gets returned
arr.max_by do |item|
  (item-5).abs #returns furthest from 5
end

#Deletes a number of elements, starting from 0. Does not modify the original
arr.drop(3) #deletes elements @ 0, 1 and 2

#Flatens a nD array into a 1D array
arr.flatten


#####################################################################


#HASH METHODS:

#Fuly initializes, so you can #push to an array. Notice that the block is
#|hash,key| pair, not |key,value| pair
names = Hash.new{|h,k| h[k]=[]}

#Runs through each pair
names.each do |key, value|
end

#Runs through each key
names.each_key do |k|
end

#Runs through each value
names.each_value do |v|
end

#Lists all keys and values as arrays
names.keys; names.values

#Sorts by key
names.sort_by {|key,value| key}

#Deletes on key
names.delete(key)

#Deletes on condition
names.delete_if {|key,value| value > 3 }

#Merges two hashes, creating a new one. The passed hash (other_names) has preference over the called hash (names) in case of duplicates
names.merge(other_names) #returns {Eric => "dad", Mari: "hotter", Lisa: daughter}
other_names.merge(names) #returns {Eric => "hot", Mari: "hotter", Lisa: daughter}

#Checks if key exists
names.key?(Eric) #true

#####################################################################

#CONVERSION METHODS:
#To string
num.to_s

#To symbol
str.to_sym
str.intern

#To Int
str.to_i

#####################################################################

#PROCS & LAMBDAS:
double = Proc.new{|a| a*2}
arr_a.map(&double)

triple = lambda {|a| a*3}
arr_a.map(&triple)



#####################################################################

#FILE MANIPULATION

#Open file and read line by line
File.open("file-name") do |file|
  first_line = file.gets.chomp
  second_line = file.gets.chomp
  #...
end

#Open file and store all content into one string
file_content = File.read("file-name")

#Open file and store all content into one array, line by line
file_content_array = File.readlines("file-name")

#Open file and edit line by line
file = File.new("file-name")
file.each do |line|
  new_line = line.upcase
end

#Close the file, if you didn't use the block version of the File methods
file.close

#Open a file and rewrite all contents
File.open("file-name","w") do |file|
  puts "This is the new 1st line"
  puts "This is the new 2nd line"
  puts "This is the new 3rd line"
end

#Open a file and append to existing content
File.open("file-name","a") do |file|
  puts "Adding a line below the existing content"
end

#Reads from stdin
$stdin.each

#####################################################################



#SWEET STUFF:

#Convert to binary and back again
10.to_s(2) #"1010"
"1010".to_i(2) #10


#Convert to ASCII
"hello".each_byte {|char| puts char}
"e".ord #101
"ABC".unpack("ccc") #[65,66,67]
"FGHIJ".unpack("cc") #[70,71]
"e".unpack("c") #[101] in array form

#Convert from ASCII
101.chr #"e"
arr = [51, 114, 49, 99, 32, 48, 76, 49, 118, 69, 49, 82, 52]
params = Array.new(arr.length,"c").join("")
arr.pack(params) #"3r1c 0L1vE1R4"


#Creates an alphabet array with each letter having its corresponding number
symbol_AZ = Hash[('a'..'z').to_a.zip((1..26).to_a)]

#Timing processes
require 'benchmark'
time = Benchmark.realtime do
end

#Format hour and minute to two digits
def format_time(time)
  return time.to_s.length == 1 ? "0#{time}" : time
end

#Find hash key of largest value
hash.find {|k,v| v == hash.values.max}


#####################################################################
