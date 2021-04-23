FUNCTION_BLOCK GEN_RDT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=259*)
    tonRDMTimer ( IN:= Enable , PT:= tRDMTime );
    tof_xQ ( IN:= tonRDMTimer.Q , PT:= TP_Q );
    XQ := tof_xq.Q;
    IF tonRDMTimer.Q THEN
    		 xQ := TRUE ;
    		 rRDMTime := RDM ( last:= rRDMTime ) ;
    		 tRDMTime := REAL_TO_TIME ( rRDMTime * DINT_TO_REAL(TIME_TO_DINT( Max_Time_ms - Min_Time_ms ) + TIME_TO_DINT(Min_Time_ms ))) ;
    		 tonRDMTimer ( IN:= FALSE );
    END_IF

    (* revision history
    J. Schohaus	19. nov 2007	rev 1.0
    	origial version

    hm	16. mar. 2008			rev 1.1
    	added type conversion to avoid warnings under codesys 3.0
    *)
END_FUNCTION_BLOCK
