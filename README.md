# The Reformed Devs Monthly Challenge

## May 2020

### Background

Birthed out of our Slack org, The Reformed Devs have begun monthly coding challenges for its members, hoping to encourage critical thinking and problem and solving and foster community. You can see our previous challenges here:

* [April 2019](https://github.com/plusuncold/longest-word-test)
* [May 2019](https://github.com/plusuncold/rainfall-calc-challenge)
* [June 2019](https://github.com/ReformedDevs/challenge-2019-06)
* [July 2019](https://github.com/ReformedDevs/challenge-2019-07)
* [September 2019](https://github.com/ReformedDevs/challenge-2019-09)
* [October 2019](https://github.com/ReformedDevs/challenge-2019-10)
* [November 2019](https://github.com/ReformedDevs/challenge-2019-11)

### This Month's Challenge

#### Problem

With this month's challenge we are taking on a series of truly hard (NP-Hard) problems.  These are classic computer science problems known to be NP (non-deterministic polynomial time) Hard. More information about computational complexity and NP-Hard can be found on Wikipedia; [Computational Complexity](https://en.wikipedia.org/wiki/Computational_complexity) and [NP-hardness](https://en.wikipedia.org/wiki/NP-hardness).

The first of these is the classic ["Travelling Salesman Problem" (TSP)](https://en.wikipedia.org/wiki/Travelling_salesman_problem) which is simple to describe, but difficult to solve.  Given a list of cities and the distances between them, what is the shortest possible route that visits each city exactly once and returns to the origin city?

A brute force approach to this can be very expensive computationally, O(n!). With 60 roads (edges) there are 60! = 8.32 x 10^81 possible routes. That is more than the number of atoms in the universe!

The particular TSP we will be solving is the 'symmetric' TSP. This means that the distance between cities is the same in both directions.  Therefore the data provided is an 'undirected graph' (symmetric problem would be a directed graph).

It isn't necessary to find the optimal soluton, the competition is for an algorithm that finds an approximate solution in a reasonable amount of time and scalable to a larger number of input cities.   Also, we may not stress your programs with 60 cities. However, we are looking for solutions that will scale and can find the best approximate solution in the least amount of time.  

We are providing a couple of small sample input files for development.  When it comes to the competition we will provide a larger 'real-world' problem drawn from the [TSPLIB95](http://comopt.ifi.uni-heidelberg.de/software/TSPLIB95/) predefined data sets.

## Challenge details​

Given a set of nodes (cities) you are to find an approximate shortest path in the least amount of time.

### Input

* We will be using a subset of the [TSPLIB95 file format](http://comopt.ifi.uni-heidelberg.de/software/TSPLIB95/tsp95.pdf) for input data. We are using TSPLIB95 to have available a set of standard Traveling Salesman Problems with known optimal solutions.
* For this challenge, the 'TYPE' will always be TSP (symmetric Traveling Salesman Problem), the 'DIMENSION' is the number of nodes/cities, and the EDGE_WEIGHT_TYPE will  be EXPLICIT (weight provided) and the EDGE_WEIGHT_FORMAT will be LOWER_DIAG_ROW.

```plaintext
NAME: example.tsp
TYPE: TSP
COMMENT: 6 New England capitals
DIMENSION: 6
EDGE_WEIGHT_TYPE: EXPLICIT
EDGE_WEIGHT_FORMAT: LOWER_DIAG_ROW
EDGE_WEIGHT_SECTION
0
229 0
93 149 0
115 116 63 0
65 190 41 95 0
173 138 152 90 178 0
EOF
```

#### LOWER_DIAG_ROW format

The LOWER_DIAG_ROW format provides explicit weights (distances) between any two nodes for a symmetric TSP data set.  Since the weights (distances) are symmetric, only half of the full matrix is required resulting in essentially a jagged array.

The EDGE_WEIGHT_SECTION in the example above is formatted to help visualize the "lower diagonal" data sequence. However, the actual data in the TSP file is only assumed to be whitespace separated integers with a 0 terminating a row of data.  The data you receive could be a vertical or a horizontal list of numbers, all of the following sequences of numbers  represent the same set of edge weight data.

All four of the following EDGE_WEIGHT_SECTION data represent the same jagged array data set.

##### TRIANGLE

```plaintext
EDGE_WEIGHT_SECTION
0
229 0
93 149 0
115 116 63 0
65 190 41 95 0
173 138 152 90 178 0
EOF
```

##### Horizontal

```plaintext
EDGE_WEIGHT_SECTION
0 229 0 93 149 0 115 116 63 0 65 190 41 95 0 173 138 152 90 178 0
EOF
```

##### Vertical

```plaintext
EDGE_WEIGHT_SECTION
0
229
0
93
149
0
115
116
63
0
65
190
41
95
0
173
138
152
90
178
0
EOF
```

##### Rectangular

```plaintext
EDGE_WEIGHT_SECTION
0 229 0 93 149 0 115
116 63 0 65 190 41 95
0 173 138 152 90 178 0
EOF
```

##### Resulting Jagged Array

|   | 1 | 2 | 3 | 4 | 5 | 6 |
|:-:|--:|--:|--:|--:|--:|--:|
| 1 | 0 | | | | | |
| 2 | 229 | 0 | | | | |
| 3 | 93 | 149 | 0 | | | |
| 4 | 115 | 116 | 63 | 0 | | | |
| 5 | 65 | 190 | 41 | 95 | 0 | |
| 6 | 173 | 138 | 152 | 90 | 178 | 0 |

#### Output

Once your program has completed the solution the following will need to be returned to STDOUT.
First a header typical for our challenges with one chqnge, the time will be reported in real # of seconds sss.sssss.  After the header list the sequence of nodes/cities representing your calculated route followed ending with the start city, followed by -1.

Header
    githubname, language, seconds (to neareest millisecond), real # distance (km), input filename, notes

##### Example output

```plaintext
githubname, C++, 3.21, 596, example.tsp, notes
1
5
3
4
2
6
1
-1
```

Note: output, like input, can be any whitespace (including newline) separated list of numbers ending with -1 followed by EOF on its own line.

#### Total time

Timer starts _immediately_. In C, this would mean the first line of `main()` would be the initiation of the timer.

#### Scoring

We are looking for the program that achieves the shortest length in the least amount of time. The lower the sscore the better.

score = sqrt( (resultTime / bestTime)^2 + (resultLength / shortestSolution)^2 )

### Solution Setup

Put each of your submitted solutions in its own directory at the root of the project. Any directory that is named `alphanumeric-alphanumeric` will be picked up by the test container, but general convention is use `yourlanguage-yourname/handle`.

Your solution directory should include the following:

* `build.sh` file (only if you need to build/compile your solution)
* `run.sh` file (a shell file that has the command to execute your solution)
  * **Important**: Make sure your solution can take an input. The input file will be passed as a will be sent as a string in a BASH variable. See example folder for details on how this will work.
* the file(s) needed to build and run your solution.

See the `example` directory for more guidance.

*Note*: You might need to update the Docker build file if your language is not yet supported (see below.) If you need help, ask in #monthly-challenge in Slack.

### Running the Tests (I.e. Docker and Stuff)

The Docker image is now moved to its own repo and is hosted on Dockerhub.

* [Source](https://github.com/ReformedDevs/challenge-docker)
* [Dockerhub](https://hub.docker.com/r/drewpearce/trd-challenge)

The image tagged latest currently supports these languages:

* C/C++
* .NET
* Node 11
* Python 3.6
* Ruby
* Rust

If you want to add support for another language, you can make a PR to the Source repo referenced above. If you need help, come on over to the #monthly-challenge channel on our Slack.

You can build the container locally by running `./build_docker.sh`.

You can run the container lcoally by running `./run_docker.sh` after building the container.

You can run the tests locally (assuming you have all the language support installed) by running `python(3) run_solutions.py`.

If you only want to run specific directories on a local run (i.e. just test your solution), run `python(3) run_solutions.py comma-separated,list-of,solution-dirs`.

### Leaderboard

This is where the leaderboard will go.

### Oops

If someone offers an incorrect solution, it will get posted here when the test suite is run.
