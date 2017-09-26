#Download to documents area
#Push-Location "$($env:USERPROFILE)\Documents\GIT\AdventOfCode\2015\Input"
#New-Item "input3.txt"
#(New-Object System.Net.WebClient).DownloadFile('http://adventofcode.com/2015/day/3/input', 'input3.txt' ) #random puzzle text

$PuzzleInput = get-content "$($env:USERPROFILE)\Documents\GIT\AdventOfCode\2015\Input\input3.txt"

#RoboSanta
$roboSanta = $true
$whosTurn = 0 #defaults to santa

#create hash table to mark co-ords
$markCoOrds = @()

$markCoOrds += ("0,0") #add first location

$santaXCoOrd = 0 # simple x coord counter
$santaYCoOrd = 0 # simple y coord counter
$roboSantaXCoOrd = 0 # simple x coord counter
$roboSantaYCoOrd = 0 # simple y coord counter

$searchMaxCount = $puzzleInput.Length-1 #Find out the max number of times we search

for($i=0;$i -le $searchMaxCount;$i++) { #loop through every individual item; not best for massive strings
    $direction = $PuzzleInput[$i]

    #For each symbol we check what coord we need to update.
    if($whosTurn -eq 0){ #Santas turn
        if($direction -eq "^"){
            $santaYCoOrd++
        }
        elseif($direction -eq ">"){
            $santaXCoOrd++
        }
        elseif($direction -eq "v"){
            $santaYCoOrd--
        }
        elseif($direction -eq "<"){
            $santaXCoOrd--
        }
        
        #Update the array with the new direction taken.
        $markCoOrds += "$santaXCoOrd,$santaYCoOrd"
    }
    
    if($whosTurn -eq 1){
        if($direction -eq "^"){
            $roboSantaYCoOrd++
        }
        elseif($direction -eq ">"){
            $roboSantaXCoOrd++
        }
        elseif($direction -eq "v"){
            $roboSantaYCoOrd--
        }
        elseif($direction -eq "<"){
            $roboSantaXCoOrd--
        }
        #Update the array with the new direction taken.
        $markCoOrds += "$roboSantaXCoOrd,$roboSantaYCoOrd"
    }
    if($roboSanta -eq $true -and $whosTurn -eq 0){
        $whosTurn=1 #switch to robo santa
    }
    else { #else default back to santa
        $whosTurn=0
    }
}

$markCoOrds.Count #Count of directions taken.
($markCoOrds | Select-Object -Unique).Count #Count of unique directions taken.