# Create your grading script here

GRADE=0
PERCENTAGE=0

rm -rf student-submission
git clone $1 student-submission

# Check if repo cloned successfully.
if test -d ./student-submission
then
    echo "  Cloning Finished."
    echo "  "
else
    echo "  Could not Clone Repo."
    echo "  "
fi

cp TestListExamples.java student-submission
cp -r lib student-submission

cd student-submission

# Check if the file exists.
if test -e ListExamples.java
then
    echo "  File Found. (+1 Point!)"
    ((GRADE++))
    echo "  "
else
    echo "  ListExamples.java not found."
    echo "  "
    PERCENTAGE=$(($GRADE / 3 * 100))
    echo "  Final Grade: [$GRADE/3] $PERCENTAGE%"
    exit 1
fi

# Compile and Run
if javac -cp .:./lib/hamcrest-core-1.3.jar:./lib/junit-4.13.2.jar *.java 2> compile-err.txt
then
    echo "  Compiled. (+1 Point!)"
    ((GRADE++))
    echo "  "
    if java -cp .:./lib/hamcrest-core-1.3.jar:./lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > test.txt
    then
        echo "  All tests were successful. (+1 Point!)"
        ((GRADE++))
        PERCENTAGE=$(($GRADE / 3 * 100))
        echo "  "
        echo "  Feedback Report:"
        echo "  ----------------"
        cat test.txt
        echo "  "
        echo "  Final Grade: [$GRADE/3] $PERCENTAGE%"
    else
        echo "  Some or all of the tests were not successful."
        PERCENTAGE=$(($GRADE * 100 / 3))
        echo "  "
        echo "  Feedback Report:"
        echo "  ----------------"
        cat test.txt
        echo "  "
        echo "  Final Grade: [$GRADE/3] $PERCENTAGE%"
    fi
else
    echo "  Compile Error."
    echo "  "
    echo "  Feedback Report:"
    echo "  ----------------"
    cat compile-err.txt
    PERCENTAGE=$(($GRADE / 3 * 100))
    echo "  "
    echo "  Final Grade: [$GRADE/3] $PERCENTAGE%"
fi
