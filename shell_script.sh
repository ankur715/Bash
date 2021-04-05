whoami

cd Documents/"Data Science"/Projects/Bash

cat guide/sample.txt    # prints text lines

username="ankur"        # declare variable
echo $username          # display value
unset username          # delete variable

echo beg{i,a,u}n # begin began begun
echo {0..5} # 0 1 2 3 4 5
echo {00..8..2} # 00 02 04 06 08

now=`date +%T`
# or
now=$(date +%T)

echo $now # 21:04:26

result=$(( ((10 + 5*3) - 7) / 2 ))
echo $result # 9

x=4
y=7
echo $(( x + y ))     # 11
echo $(( ++x + y++ )) # 12
echo $(( x + y ))     # 13

echo "Your home: $HOME" # Your home: /Users/<username>
echo 'Your home: $HOME' # Your home: $HOME

INPUT="A string  with   strange    whitespace."
echo $INPUT   # A string with strange whitespace.
echo "$INPUT" # A string  with   strange    whitespace.

fruits[0]=Apple
fruits[1]=Pear
fruits[2]=Plum

fruits=(Apple Pear Plum)

echo ${fruits[1]} # Pear

echo ${fruits[*]} # Apple Pear Plum
echo ${fruits[@]} # Apple Pear Plum

fruits[0]=Apple
fruits[1]="Desert fig"
fruits[2]=Plum

printf "+ %s\n" ${fruits[*]}
# + Apple
# + Desert
# + fig
# + Plum

printf "+ %s\n" "${fruits[*]}"
# + Apple Desert fig Plum

printf "+ %s\n" "${fruits[@]}"
# + Apple
# + Desert fig
# + Plum

echo ${fruits[@]:0:2} # Apple Desert fig

fruits=(Orange "${fruits[@]}" Banana Cherry)
echo ${fruits[@]} # Orange Apple Desert fig Plum Banana Cherry

unset fruits[0]
echo ${fruits[@]} # Apple Desert fig Plum Banana Cherry

# command2 will be executed after command1
command1 ; command2

# which is the same as
command1
command2

# command2 will be executed if, and only if, command1 finishes successfully (returns 0 exit status)
command1 && command2

# command2 will be executed if, and only if, command1 finishes unsuccessfully (returns code of error)
command1 || command2

# Single-line
if [[ 1 -eq 1 ]]; then echo "true"; fi

# Multi-line
if [[ 1 -eq 1 ]]; then
  echo "true"
fi

# Single-line
if [[ 2 -ne 1 ]]; then echo "true"; else echo "false"; fi

# Multi-line
if [[ 2 -ne 1 ]]; then
  echo "true"
else
  echo "false"
fi

if [[ `uname` == "Adam" ]]; then
  echo "Do not eat an apple!"
elif [[ `uname` == "Eva" ]]; then
  echo "Do not take an apple!"
else
  echo "Apples are delicious!"
fi

case "$extension" in
  "jpg"|"jpeg")
    echo "It's image with jpeg extension."
  ;;
  "png")
    echo "It's image with png extension."
  ;;
  "gif")
    echo "Oh, it's a giphy!"
  ;;
  *)
    echo "Woops! It's not image!"
  ;;
esac

# for loop
for i in {1..5}; do echo $i; done

for (( i = 0; i < 10; i++ )); do
  echo $i
done

# while loop
# Squares of numbers from 0 through 9
x=0
while [[ $x -lt 10 ]]; do # value of x is less than 10
  echo $(( x * x ))
  x=$(( x + 1 )) # increase x
done

# until loop
until [[ condition ]]; do
  #statements
done

# loop control
for (( i = 0; i < 10; i++ )); do
  if [[ $(( i % 2 )) -eq 0 ]]; then continue; fi
  echo $i
done

# function with params
greeting () {
  if [[ -n $1 ]]; then
    echo "Hello, $1!"
  else
    echo "Hello, unknown!"
  fi
  return 0
}

greeting Ankur  # Hello, Denys!
greeting        # Hello, unknown!

# xtrace - Print each command and its expanded arguments to stderr before executing it.
for (( i = 0; i < 3; i++ )); do
  echo $i
done

echo "xtrace is turned off"
set -x
echo "xtrace is enabled"
set +x
echo "xtrace is turned off again"


