# Create your grading script here

rm -rf student-submission
git clone $1 student-submission

# Check if repo cloned successfully.
if test -d ./student-submission
then
    echo "  Cloning Finished."
else
    echo "  Could not Clone Repo."
fi

cp TestListExamples.java student-submission
cp -r lib student-submission

cd student-submission

# Check if the file exists.
if test -e ListExamples.java
then
    echo "  Contains file."
else
    echo "  ListExamples.java not found."
    exit 1
fi

# Compile and Run
if javac -cp .:./lib/hamcrest-core-1.3.jar:./lib/junit-4.13.2.jar *.java 2> compile-err.txt
then
    echo "  Compiled."
    java -cp .:./lib/hamcrest-core-1.3.jar:./lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > test.txt
    echo "  "
    cat test.txt
else
    echo "  Compile Error."
    echo "  "
    cat compile-err.txt
fi




