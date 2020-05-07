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

With this month's challenge we are beginning a series of truly hard problems. These are classic computer science problems known to be NP (non-deterministic polynomial time) hard.

The first of these is the classic "Travelling Salesman Problem" (TSP) which is simple to describe, but difficult to solve. Given a list of cities and the distances between them, what is the shortest possible route that visits each city exactly once and returns to the origin city?

A brute force approach to this can be very expensive computationally, O(n!). With 60 roads (edges) there are 60! = 8.32 x 10^81 possible routes. That is more than the number of atoms in the universe!

The particular TSP we will be solving is a 'symmetric' TSP. This means that the distance between cities will be the same in both directions.

It isn't necessary to find the optimal soluton, the competition is for an algorithm that finds an approximate solution and scales to larger number of cities. Also, we won't stress your programs with 60 cities. We are however looking for solutions that will scale. We may provide test input of 10 cities, but use 15 or 16 cities in the actual competition.

#### Challenge Details

Given a set of nodes (cities) you are to find the shortest path in the least amount of time. Note: we aren't expecting the optimal path.

#### Input

* We will be using a subset of the TSPLIB file format for input data.
* For this challenge, the 'TYPE' will always be TSP, the 'DIMENSION' will be the number of nodes, and the EDGE_WEIGHT_TYPE will always be EUC_2D

```plaintext
NAME : sample
COMMENT : a sample data set
TYPE : TSP
DIMENSION : 5
EDGE_WEIGHT_TYPE : EUC_2D
NODE_COORD_SECTION
1 37.0 63.0
2 49.0 49.0
3 52.0 64.0
4 30.0 26.0
5 40.0 30.0
EOF
```

#### Output

Once your program has finished the game the following will need to be returned to STDOUT:

```plaintext
Github Name, Program Language, Total Time (in ms), input filename, Notes
newline separate list of node #s indicated calculated route
-1  terminate list with -1 to indicate return to origin node
```

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
* **Important**: Make sure your solution can take an input. The letters to handle will be sent as a string in a BASH variable. See example folder for details on how this will work.
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
