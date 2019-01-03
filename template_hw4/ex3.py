import sys
# other imports

"""
CODE HERE
"""

if __name__ == "__main__":
    argN=3
    if len(sys.argv)-1 != argN:
        print "The number of arguments should be",argN,"and is",len(sys.argv)-1
        sys.exit()

    i=1
    def getparam():
        global i
        ret = sys.argv[i]
        i +=1
        return ret

    sciper=str(getparam())
    p3=int(getparam())
    n3=int(getparam())
    k3=int(getparam())
    c3=str(getparam())

    """
    CODE HERE
    """

    # print "3.",result
