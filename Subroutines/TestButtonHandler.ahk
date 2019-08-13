;respond to the test button

activateTestButton() {
    NN := "Static40"
    ControlGetText, TestResult, %NN%
    TrimmedTestResult = %TestResult%
    Logger(TrimmedTestResult, " in the " . NN . " field")
}