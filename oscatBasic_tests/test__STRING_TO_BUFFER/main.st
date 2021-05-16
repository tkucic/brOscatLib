PROGRAM _CYCLIC
    (*This PRG tests the functionality of the _STRING_TO_BUFFER as described in the function description
	http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=479*)
    (*Run the test cases*)
    TEST_CASE_1_SETUP;
    TEST_CASE_1_EXEC;

    TEST_CASE_2_SETUP;
    TEST_CASE_2_EXEC;

    (*Instantiate the test runner*)
    testRunner(
    	Id := 4,
    	Name := '_STRING_TO_BUFFER',
        RunTests := gRunAll OR vRunAll,
    	ResetTests := gResetAll OR vResetAll,
    	TestCases:=vTestCases);

    (*Report the results to the collection global*)
    gResults[testRunner.Id] := testRunner.Summary;
END_PROGRAM
