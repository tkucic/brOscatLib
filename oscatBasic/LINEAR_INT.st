FUNCTION LINEAR_INT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=101*)
    (*make sure n is bound within the array size *)
    pts := MIN(pts,20);

    (* calculate the linear segement interpolation *)
    i := 2;
    (* search for segment and calculate output
    	below and above the defined segments we interpolate the last segment *)
    WHILE (i < pts) AND (XY[i,0] < X) DO
    	i := i + 1;
    END_WHILE;

    (* calculate the output value on the corresponding segment coordinates *)
    LINEAR_INT := ((XY[i,1] - XY[i-1,1]) * X - XY[i,1] * XY[i-1,0] + XY[i-1,1] * XY[i,0]) / (XY[i,0] - XY[i-1,0]);

    (* revision history
    hm	7. oct 2007		rev 1.0
    	original version

    hm	27 dec 2007		rev 1.1
    	changed code for better performance
    *)

END_FUNCTION
