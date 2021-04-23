FUNCTION_BLOCK TREND
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=305*)
    TU := X > last_X;
    TD := X < last_X;
    Q := TU OR TD;
    D := X - LAST_X;

    last_X := X;



    (* revision history
    hm	21. aug. 2009	rev 1.0
    	original version

    *)

END_FUNCTION_BLOCK
