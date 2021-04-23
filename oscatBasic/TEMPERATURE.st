FUNCTION_BLOCK TEMPERATURE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=374*)
    YK := K + (C + 273.15) + (F + 459.67) * 0.555555555555 + (Re * 1.25 + 273.15) + (Ra * 0.555555555555);
    YC := YK -273.15;
    YF := YK * 1.8 - 459.67;
    YRe := (YK - 273.15) * 0.8;
    YRa := YK * 1.8;


    (* REvision history
    hm	21. feb. 2008	REv 1.0
    	original version

    *)
END_FUNCTION_BLOCK
