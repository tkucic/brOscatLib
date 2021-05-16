ACTION TEST_CASE_1_SETUP :
    IF vTestCases[0].state = ut_SETUP THEN
    	(*Setup the test case information*)
    	vTestCases[0].id := 1;
    	vTestCases[0].desc[0] := '';
        vTestCases[0].desc[1] := '';
    	
    	(*Setup needed variables*)
    	
    END_IF
END_ACTION
ACTION TEST_CASE_1_EXEC :
    IF vTestCases[0].state = ut_RUNNING THEN
    	(*Run the test case*)
    		vTestCases[0].state := ut_FAILED;
    		vTestCases[0].msg := 'Test case not implemented -> FAIL';
    END_IF
END_ACTION
ACTION TEST_CASE_2_SETUP :
    IF vTestCases[1].state = ut_SETUP THEN
    	(*Setup the test case information*)
    	vTestCases[1].id := 2;
    	vTestCases[1].desc[0] := '';
        vTestCases[1].desc[1] := '';
    	vTestCases[1].desc[2] := '';
    	
    	(*Setup needed variables*)
    END_IF
END_ACTION
ACTION TEST_CASE_2_EXEC :
    IF vTestCases[1].state = ut_RUNNING THEN
    	(*Run the test case*)
    		vTestCases[1].state := ut_FAILED;
    		vTestCases[1].msg := 'Test case not implemented -> FAIL';
    END_IF
END_ACTION
