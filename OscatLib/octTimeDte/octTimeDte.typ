TYPE
    STRUCT CALENDAR :
        UTC : DT; (* world time UTC *)
        YEAR : INT; (* year of LDATE *)
        MONTH : INT; (* month of LDATE *)
        DAY : INT; (* day of LDATE *)
        WEEKDAY : INT; (* weekday of LDATE *)
        OFFSET : INT; (* Time Zone Offset for Local time in minutes *)
        DST_EN : BOOL; (* daylight savings time enable *)
        DST_ON : BOOL; (* true when daylight savings time os on *)
        NAME : STRING[5]; (* name of time zone *)
        LANGUAGE : INT; (* location number pls see location setup *)
        LONGITUDE : REAL; (* longitude of current location *)
        LATITUDE : REAL; (* latitude of current location *)
        SUN_RISE : TOD; (* sun_rise for current location *)
        SUN_SET : TOD; (* sun_set for current location *)
        SUN_MIDDAY : TOD; (* worldtime when sun stands at south position *)
        SUN_HEIGTH : REAL; (* suns heigth at midday, south position *)
        SUN_HOR : REAL; (* sun angle horizontal 0 = north in degrees *)
        SUN_VER : REAL; (* sun angle vertical above horizon in degrees *)
        NIGHT : BOOL; (* true between sun_set and sun_rise *)
        HOLIDAY : BOOL; (* true when holiday *)
        HOLY_NAME : STRING[30]; (* name of holiday *)
        WORK_WEEK : INT; (* current work week *)
    END_STRUCT;
    STRUCT HOLIDAY_DATA :
        NAME : STRING[30]; (**)
        DAY : SINT; (**)
        MONTH : SINT; (**)
        USE : SINT; (**)
    END_STRUCT;
END_TYPE