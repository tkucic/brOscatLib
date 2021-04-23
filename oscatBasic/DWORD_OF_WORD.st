FUNCTION DWORD_OF_WORD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=226*)
    DWORD_OF_WORD := SHL(WORD_TO_DWORD(W1),16) OR WORD_TO_DWORD(W0);


    (* revision history

    hm	18. jul. 2009	rev 1.0
    	original version

    *)
END_FUNCTION
