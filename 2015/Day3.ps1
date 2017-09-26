#Download to documents area
#Push-Location "$($env:USERPROFILE)\Documents\GIT\AdventOfCode\2015\Input"
#New-Item "input3.txt"
#(New-Object System.Net.WebClient).DownloadFile('http://adventofcode.com/2015/day/3/input', 'input3.txt' ) #random puzzle text

$PuzzleInput = get-content "$($env:USERPROFILE)\Documents\GIT\AdventOfCode\2015\Input\input3.txt"

#create hash table to mark co-ords
$markCoOrds = @()

$markCoOrds += ("0,0") #add first location

$currentXCoOrd = 0 # simple x coord counter
$currentYCoOrd = 0 # simple y coord counter

$searchMaxCount = $puzzleInput.Length-1 #Find out the max number of times we search

for($i=0;$i -le $searchMaxCount;$i++) { #loop through every individual item; not best for massive strings
    $direction = $PuzzleInput[$i]

    #For each symbol we check what coord we need to update.
    if($direction -eq "^"){
        $currentYCoOrd++
    }
    elseif($direction -eq ">"){
        $currentXCoOrd++
    }
    elseif($direction -eq "v"){
        $currentYCoOrd--
    }
    elseif($direction -eq "<"){
        $currentXCoOrd--
    }
    #Update the array with the new direction taken.
    $markCoOrds += "$currentXCoOrd,$currentYCoOrd"
}

$markCoOrds.Count #Count of directions taken.
($markCoOrds | Select-Object -Unique).Count #Count of unique directions taken.