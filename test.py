import os

COMPILER_SRC        = "./arithc/arithc"
GOOD_TESTS_SRC      = "./tests/good"
BAD_TESTS_SRC       = "./tests/bad"
SOLUTIONS_SRC       = "./tests/solutions"
RESULTS_SRC         = "./tests/results"
GOOD_COMPILED_SRC   = "./compiled/good"
BAD_COMPILED_SRC    = "./compiled/bad"

def main():
    if not os.path.exists(COMPILER_SRC):
        print("COMPILER SOURCE NOT FOUND: " + COMPILER_SRC)
        return None
    
    if not os.path.exists(GOOD_TESTS_SRC):
        print("GOOD TESTS DIRECTORY NOT FOUND: " + GOOD_TESTS_SRC)
        return None
    
    if not os.path.exists(BAD_TESTS_SRC):
        print("BAD TESTS DIRECTORY NOT FOUND: " + BAD_TESTS_SRC)
        return None
    
    if not os.path.exists(SOLUTIONS_SRC):
        print("SOLUTIONS_SRC DIRECTORY NOT FOUND: " + SOLUTIONS_SRC)
        print("- CREATING SOLUTIONS_SRC")
        os.makedirs(SOLUTIONS_SRC)
    
    
    if not os.path.exists(RESULTS_SRC):
        print("RESULTS DIRECTORY NOT FOUND: " + RESULTS_SRC)
        print("- CREATING RESULTS FOLDER")
        os.makedirs(RESULTS_SRC)
            
    print("\nCLEARING RESULTS_SRC CONTENT...")
    for filename in os.listdir(RESULTS_SRC):
        os.remove(os.path.join(RESULTS_SRC, filename))
    print("DONE\n")
    
        
    if not os.path.exists(GOOD_COMPILED_SRC):
        print("GOOD_COMPILED_SRC DIRECTORY NOT FOUND: " + GOOD_COMPILED_SRC)
        print("- CREATING GOOD_COMPILED_SRC")
        os.makedirs(GOOD_COMPILED_SRC)
    
    if not os.path.exists(BAD_COMPILED_SRC):
        print("BAD_COMPILED_SRC DIRECTORY NOT FOUND: " + BAD_COMPILED_SRC)
        print("- CREATING BAD_COMPILED_SRC")
        os.makedirs(BAD_COMPILED_SRC)
    
    print("\nCLEARING COMPILED_SRC CONTENT...")
    for filename in os.listdir(GOOD_COMPILED_SRC):
        os.remove(os.path.join(GOOD_COMPILED_SRC, filename))
    
    for filename in os.listdir(BAD_COMPILED_SRC):
        os.remove(os.path.join(BAD_COMPILED_SRC, filename))
    print("DONE\n")
    
    
    print("\nREADY TO TEST\n")
    
    correctCount = 0
    wrongCount = 0
    amountTests = 0
    
    print("\nSTARTING COMPILATION\n")
    print("GOOD")
    
    # Compile GOOD_TESTS_SRC files into GOOD_COMPILED_SRC
    for filename in os.listdir(GOOD_TESTS_SRC):
        fin = os.path.join(GOOD_TESTS_SRC, filename)
        fout = os.path.splitext(os.path.join(GOOD_COMPILED_SRC, filename))[0]
        
        if os.path.isfile(fin) and fin.endswith(".exp"):
            os.system(f"{COMPILER_SRC} {fin} -o {fout}.s")
            os.system(f"gcc -g -no-pie {fout}.s -o {fout}.out")

            amountTests += 1

    print("BAD\n")
    
    # Compile BAD_TESTS_SRC files into BAD_COMPILED_SRC
    for filename in os.listdir(BAD_TESTS_SRC):
        fin = os.path.join(BAD_TESTS_SRC, filename)
        fout = os.path.splitext(os.path.join(BAD_COMPILED_SRC, filename))[0]
        
        if os.path.isfile(fin) and fin.endswith(".exp"):
            if os.system(f"{COMPILER_SRC} {fin} -o {fout}.s") != 0:
                wrongCount += 1

            os.system(f"gcc -g -no-pie {fout}.s -o {fout}.out")
            
            amountTests += 1
    
    print("\nSTARTING EXECUTION\n")
    print("GOOD\n")
    
    # Execute GOOD_COMPILED_SRC files into good_[name].out on RESULTS_SRC 
    for filename in os.listdir(GOOD_COMPILED_SRC):
        if (filename.endswith(".out")):
            execF = os.path.join(GOOD_COMPILED_SRC, filename)
            destination = os.path.join(RESULTS_SRC, "good_" + filename)

            os.system(f"{execF} > {destination} 2> {destination}")
        
    print("BAD\n")
    
    # Execute BAD_COMPILED_SRC files into bad_[name].out on RESULTS_SRC
    for filename in os.listdir(BAD_COMPILED_SRC):
        if (filename.endswith(".out")):
            execF = os.path.join(BAD_COMPILED_SRC, filename)
            destination = os.path.join(RESULTS_SRC, "bad_" + filename)
            
            os.system(f"{execF} > {destination} 2> {destination}")

    print("\nSTARTING COMPARATION\n")

    # Count the amount of differences between RESULTS_SRC files and SOLUTIONS_SRC
    for filename in os.listdir(RESULTS_SRC):
        if filename in os.listdir(SOLUTIONS_SRC):
            tstF = os.path.join(RESULTS_SRC, filename)
            solF = os.path.join(SOLUTIONS_SRC, filename)
            
            if os.system(f"diff {tstF} {solF}") == 0:
                correctCount += 1
            else:
                wrongCount += 1
        else:
            print("NO SOLUTION WAS FOUND FOR FILE: " + filename)
    
    print(
f"""
TESTS REACHED THE END WITH:
    {correctCount}/{amountTests} CORRECT
    {wrongCount}/{amountTests} FAILED
"""
    )

    # Start Script
    return None


if __name__ == "__main__":
    main()