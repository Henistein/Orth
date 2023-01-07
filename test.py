import os

COMPILER_SRC        = "./arithc/arithc"
GOOD_TESTS_SRC      = "./tests/good"
BAD_TESTS_SRC       = "./tests/bad"
SOLUTIONS_SRC       = "./tests/solutions"
RESULTS_SRC         = "./tests/results"
GOOD_COMPILED_SRC   = "./compiled/good"
BAD_COMPILED_SRC    = "./compiled/bad"

BLACK = "\033[0;30m"
RED = "\033[0;31m"
GREEN = "\033[0;32m"
BROWN = "\033[0;33m"
BLUE = "\033[0;34m"
PURPLE = "\033[0;35m"
CYAN = "\033[0;36m"
LIGHT_GRAY = "\033[0;37m"
DARK_GRAY = "\033[1;30m"
LIGHT_RED = "\033[1;31m"
LIGHT_GREEN = "\033[1;32m"
YELLOW = "\033[1;33m"
LIGHT_BLUE = "\033[1;34m"
LIGHT_PURPLE = "\033[1;35m"
LIGHT_CYAN = "\033[1;36m"
LIGHT_WHITE = "\033[1;37m"
BOLD = "\033[1m"
FAINT = "\033[2m"
ITALIC = "\033[3m"
UNDERLINE = "\033[4m"
BLINK = "\033[5m"
NEGATIVE = "\033[7m"
CROSSED = "\033[9m"
END = "\033[0m"

def main():
    if not os.path.exists(COMPILER_SRC):
        print(BOLD + RED + "COMPILER SOURCE NOT FOUND: " + END + UNDERLINE + COMPILER_SRC + END )
        return None
    
    if not os.path.exists(GOOD_TESTS_SRC):
        print(BOLD + RED + "GOOD TESTS DIRECTORY NOT FOUND: " + END + UNDERLINE + GOOD_TESTS_SRC + END)
        return None
    
    if not os.path.exists(BAD_TESTS_SRC):
        print(BOLD + RED + "BAD TESTS DIRECTORY NOT FOUND: " + END + UNDERLINE + BAD_TESTS_SRC + END)
        return None
    
    if not os.path.exists(SOLUTIONS_SRC):
        print(BOLD + YELLOW + "SOLUTIONS_SRC DIRECTORY NOT FOUND: " + END + UNDERLINE + SOLUTIONS_SRC + END)
        print(BOLD + YELLOW + "- CREATING SOLUTIONS_SRC" + END)
        os.makedirs(SOLUTIONS_SRC)
    
    
    if not os.path.exists(RESULTS_SRC):
        print(BOLD + YELLOW + "RESULTS DIRECTORY NOT FOUND: " + END + UNDERLINE + RESULTS_SRC + END)
        print(BOLD + YELLOW + "- CREATING RESULTS FOLDER" + END)
        os.makedirs(RESULTS_SRC)
            
    print(NEGATIVE + "\nCLEARING RESULTS_SRC CONTENT..." + END)
    for filename in os.listdir(RESULTS_SRC):
        os.remove(os.path.join(RESULTS_SRC, filename))
    print(NEGATIVE + "DONE\n" + END)
    
        
    if not os.path.exists(GOOD_COMPILED_SRC):
        print(BOLD + YELLOW + "GOOD_COMPILED_SRC DIRECTORY NOT FOUND: " + END + UNDERLINE + GOOD_COMPILED_SRC + END)
        print(BOLD + YELLOW + "- CREATING GOOD_COMPILED_SRC" + END)
        os.makedirs(GOOD_COMPILED_SRC)
    
    if not os.path.exists(BAD_COMPILED_SRC):
        print(BOLD + YELLOW + "BAD_COMPILED_SRC DIRECTORY NOT FOUND: " + END + UNDERLINE + BAD_COMPILED_SRC + END)
        print(BOLD + YELLOW + "- CREATING BAD_COMPILED_SRC" + END)
        os.makedirs(BAD_COMPILED_SRC)
    
    print(NEGATIVE + "\nCLEARING COMPILED_SRC CONTENT..." + END)
    for filename in os.listdir(GOOD_COMPILED_SRC):
        os.remove(os.path.join(GOOD_COMPILED_SRC, filename))
    
    for filename in os.listdir(BAD_COMPILED_SRC):
        os.remove(os.path.join(BAD_COMPILED_SRC, filename))
    print(NEGATIVE + "DONE\n" + END)
    
    
    print(NEGATIVE + "\nREADY TO TEST" + END)
    
    correctCount = 0
    wrongCount = 0
    amountGoodTests = 0
    amountBadTests = 0
    
    print(NEGATIVE + "\nSTARTING COMPILATION" + END)
    print("\n" + GREEN + NEGATIVE + "GOOD" + END)
    
    # Compile GOOD_TESTS_SRC files into GOOD_COMPILED_SRC
    for filename in os.listdir(GOOD_TESTS_SRC):
        fin = os.path.join(GOOD_TESTS_SRC, filename)
        fout = os.path.splitext(os.path.join(GOOD_COMPILED_SRC, filename))[0]
        
        if os.path.isfile(fin) and fin.endswith(".exp"):
            print("\n" + BOLD + UNDERLINE + CYAN + filename + END)
            
            if os.system(f"{COMPILER_SRC} {fin} -o {fout}.s") == 0:
                os.system(f"gcc -g -no-pie {fout}.s -o {fout}.out")
            else:
                print(LIGHT_RED + "FAILED" + END)

            amountGoodTests += 1

    print("\n" + RED + NEGATIVE + "BAD" + END)
    
    # Compile BAD_TESTS_SRC files into BAD_COMPILED_SRC
    for filename in os.listdir(BAD_TESTS_SRC):
        fin = os.path.join(BAD_TESTS_SRC, filename)
        fout = os.path.splitext(os.path.join(BAD_COMPILED_SRC, filename))[0]
        
        if os.path.isfile(fin) and fin.endswith(".exp"):
            print("\n" + BOLD + UNDERLINE + CYAN + filename + END)
            if os.system(f"{COMPILER_SRC} {fin} -o {fout}.s") != 0 \
                or os.system(f"gcc -g -no-pie {fout}.s -o {fout}.out") != 0:
                wrongCount += 1
            
            amountBadTests += 1
    
    print(NEGATIVE + "DONE\n" + END)
    
    print(NEGATIVE + "\nSTARTING EXECUTION\n" + END)
    print("\n" + GREEN + NEGATIVE + "GOOD" + END)

    
    # Execute GOOD_COMPILED_SRC files into good_[name].out on RESULTS_SRC 
    for filename in os.listdir(GOOD_COMPILED_SRC):
        if (filename.endswith(".out")):
            print("\n" + BOLD + UNDERLINE + CYAN + filename + END)
            execF = os.path.join(GOOD_COMPILED_SRC, filename)
            destination = os.path.join(RESULTS_SRC, "good_" + filename)

            os.system(f"{execF} > {destination} 2> {destination}")
        
    print("\n" + RED + NEGATIVE + "BAD" + END)
    
    # Execute BAD_COMPILED_SRC files into bad_[name].out on RESULTS_SRC
    for filename in os.listdir(BAD_COMPILED_SRC):
        if (filename.endswith(".out")):
            print("\n" + BOLD + UNDERLINE + CYAN + filename + END)
            execF = os.path.join(BAD_COMPILED_SRC, filename)
            destination = os.path.join(RESULTS_SRC, "bad_" + filename)
            
            os.system(f"{execF} > {destination} 2> {destination}")


    print(NEGATIVE + "DONE\n" + END)
    print(NEGATIVE + "\nSTARTING COMPARATION\n" + END)

    # Count the amount of differences between RESULTS_SRC files and SOLUTIONS_SRC
    for filename in os.listdir(RESULTS_SRC):
        if filename in os.listdir(SOLUTIONS_SRC):
            tstF = os.path.join(RESULTS_SRC, filename)
            solF = os.path.join(SOLUTIONS_SRC, filename)
            
            print("\n" + BOLD + UNDERLINE + CYAN + filename + END)
            
            if os.system(f"diff {tstF} {solF}") == 0:
                print(LIGHT_GREEN + "PASSED" + END)
                correctCount += 1
            else:
                if ("bad" in filename):
                    print(LIGHT_GREEN + "PASSED" + END)
                    wrongCount += 1
                else:
                    print(LIGHT_RED + "FAILED" + END)
        else:
            print(RED + UNDERLINE + "NO SOLUTION WAS FOUND FOR FILE: " + END + UNDERLINE + filename + END)
    
    print(NEGATIVE + "DONE\n" + END)
    
    print(
f"""
{NEGATIVE + BOLD}TESTS REACHED THE END WITH:{END}
    {correctCount}/{amountGoodTests} GOOD_TESTS PASSED
    {wrongCount}/{amountBadTests} BAD_TESTS PASSED
"""
    )

    # Start Script
    return None


if __name__ == "__main__":
    main()