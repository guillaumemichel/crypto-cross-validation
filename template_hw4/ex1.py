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
        if i>=argN+1: return "bad parameter access"
        ret = sys.argv[i]
        i += 1
        return ret

    def tupleComprehension(s):
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


    sciper = str(getparam())
    Q1_good = tupleComprehension(str(getparam()))
    Q1_bad = tupleComprehension(str(getparam()))
    Q1_list = tupleArray(str(getparam()))
    Q1_pk = str(getparam())
    Q1_m = str(getparam())
    Q1_x = int(getparam())

    """
    CODE HERE
    """

    # print result
