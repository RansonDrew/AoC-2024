$input_data = Get-Content $home/Documents/AoC-2024/Day01/Day01_input.txt
#$input_data = Get-Content $home/Documents/AoC-2024/Day01/sample_input.txt

# Create two arraylists to hold the two columns
$col_left = [System.Collections.ArrayList]::new()
$col_right = [System.Collections.ArrayList]::new()

# Walk through the input data by row, parse the entries, and add the to their respective
# columns
foreach ($row in $input_data) {
    $entries = $row.Split("   ")
    $col_left.Add([int]$entries[0]) > $null
    $col_right.Add([int]$entries[1]) > $null
}

# I'm doing part 2 before part 1 because sorting the columns to accomodate part 1
# leaves them in a state that wont work for part 2. Instead of creating additional 
# variables, my thinking is that I can just sort them once, by doing part 2 first.

# initialize a variable for Similarity score.
$simscore = 0

# Step throught the first list and use a where method on the second list to count occurences.
foreach ($entry in $col_left) {
    $simscore = $simscore + ($entry * $col_right.Where({$_ -eq $entry}).Count)
}

# Sort the two columns ascending
$col_left.Sort()
$col_right.Sort()

# Initialize a distance variable
$distance = 0

# There is totally a better wat to do this, but I don't know it.
# I just don't know it. Step through the left colummn using it's 
# zero-based index. The distance is the absolute value of the difference
# of the two columns
for ($i = 0; $i -lt $col_left.Count; $i++) {
    $distance = $distance + [System.Math]::Abs($col_left[$i] - $col_right[$i])
}

Write-Host "Day 01 Part 01 Answer is: $distance"
Write-Host "Day 01 Part 02 Answer is: $simscore"