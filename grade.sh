CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

if [[ -e ./student-submission/ListExamples.java ]]
then
    echo "ListExamples.java found"
else
    echo "ListExamples.java not found"
    exit 1
fi

# mkdir ./test-environment
cp ./student-submission/ListExamples.java ListExamples.java
cp ./TestListExamples.java TestListExamples.java

javac -cp $CPATH *.java 2> compile.txt

if [[ `cat ./test-environment/compile.txt` == "" ]]
then
    echo "Compiled successfully"
else
    echo "Compile errors"
    exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > test-output.txt