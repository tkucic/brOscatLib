FUNCTION GEO_TO_DEG
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=362*)
    GEO_TO_DEG := INT_TO_REAL(D) + INT_TO_REAL(M) * 0.016666666666667 + SEC * 0.00027777777777778;


    (* revision histroy
    hm	22. jan. 2009	rev 1.0
    	original release


    *)
END_FUNCTION
