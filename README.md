
# Crypto homework cross validator

## Aim

This simple piece of code was made for students of the class Cryptography and Security (COM-401) at EPFL to cross validate the answers of the graded homework among peers. This bash file will read a given personal parameter file and parse the parameters into the python/sage program that will compute the answers. So, this program will not provide you the answers but can be useful to check your results.

## Usage
To verify efficiently the answers, the student have to implement a solution individually, they can use the structure below to input efficiently the parameters from the parameter file to the python code. Once it is successfully done, the students can run the script to get the answers associated to their parameter's file, and the ones associated with their peers parameter's files, and compare the outputs. The script can easily be run like this:
```bash
./cross-validate > output.txt
```
For a personalised usage, the user can modify the `pathtosage`,  `pathtoparameters` and `filename` variables in the script `cross-validate.sh`

## Requirements
To run this script the user needs to have a UNIX like host (MacOS, Linux) with Sagemath and Python2 installed.

## `sample_template`
This folder contains the sample structure of a homework, with a `parameters.txt`  and the exercises resolution python files for reference. The `parameters.txt` is an example of a parameter file and is certainly not valid. 

## Code structure
To import the parameters given by the script to your python/sage code, I recommend to use the following structure for every exercise.
```python
import sys
# other imports

"""
DEFINE FUNCTIONS
"""

if __name__ == "__main__":
    argN=3 # the number of arguments that you need for the specific question
    if len(sys.argv)-1 != argN:
        print "The number of arguments should be",argN,"and is",len(sys.argv)-1
        sys.exit()

    i=1
    def getparam():
    """ return the next parameter """
        global i
        ret = sys.argv[i]
        i +=1
        return ret

    def tupleComprehension(s):
    """ return the next tuple paramter """
        i=0
        t=()
        while i<len(s):
            if s[i] == "(": # start of a tuple
                ind = s[(i+1):].index(")")
                s1 = s[i:ind]
                s2 = s1.split("'")[(i+1):]
                s2 = [str(x) for x in s2 if x!=", " ]
                for j in s2:
                    t += (j,)
                return t
            else: i+=1
        return "fail"

    def tupleArray(s):
    """ return the next array of tuples paramter """
        i=0
        a=[]
        while i<len(s):
            if s[i]=="(":
                s1 = s[i:]
                ind = s1.index(")")
                a.append(tupleComprehension(s1[:(ind+1)]))
                i=i+ind
            else: i+=1
        return a

	# get all parameters
    sciper=str(getparam())
    param1 = str(getparam())
    param2 = str(getparam())
    tuple1 = str(tupleComprehension())
    param3 = str(getparam())
    tupleArray1=tupleArray(str(getparam()))

    """
    CODE HERE TO SOLVE THE EXERCISE
    """

    print result
```
