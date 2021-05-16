PROGRAM _CYCLIC
    (*This PRG tests the functionality of the CRC_GEN as described in the function description
	http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=219*)
    (*Run the test cases*)
    TEST_CASE_1_SETUP;
    TEST_CASE_1_EXEC;

    TEST_CASE_2_SETUP;
    TEST_CASE_2_EXEC;

    (*Instantiate the test runner*)
    testRunner(
    	Id := 409,
    	Name := 'CRC_GEN',
        RunTests := gRunAll OR vRunAll,
    	ResetTests := gResetAll OR vResetAll,
    	TestCases:=vTestCases);

    (*Report the results to the collection global*)
    gResults[testRunner.Id] := testRunner.Summary;
END_PROGRAM
