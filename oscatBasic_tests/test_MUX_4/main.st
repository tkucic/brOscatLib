PROGRAM _CYCLIC
    (*This PRG tests the functionality of the MUX_4 as described in the function description
	http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=229*)
    (*Run the test cases*)
    TEST_CASE_1_SETUP;
    TEST_CASE_1_EXEC;

    TEST_CASE_2_SETUP;
    TEST_CASE_2_EXEC;

    (*Instantiate the test runner*)
    testRunner(
    	Id := 216,
    	Name := 'MUX_4',
        RunTests := gRunAll OR vRunAll,
    	ResetTests := gResetAll OR vResetAll,
    	TestCases:=vTestCases);

    (*Report the results to the collection global*)
    gResults[testRunner.Id] := testRunner.Summary;
END_PROGRAM