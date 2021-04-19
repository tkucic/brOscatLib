FUNCTION_BLOCK CALENDAR_CALC
    VAR_INPUT
        SPE : BOOL;
        H : REAL := -0.83333333333;
    END_VAR
    VAR_IN_OUT
        XCAL : CALENDAR;
        HOLIDAYS : ARRAY[0..29] OF HOLIDAY_DATA;
    END_VAR
    VAR
        last : DT;
        last_day : DINT;
        holy : HOLIDAY;
        sun : SUN_TIME;
        last_hour : INT;
        utod : TOD;
        pos : SUN_POS;
        plast : DT;
        dtemp : DINT;
        tmp : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION DATE_ADD : DATE
    VAR_INPUT
        IDATE : DATE;
        D : INT;
        W : INT;
        M : INT;
        Y : INT;
    END_VAR
    VAR
        mo : INT;
        yr : INT;
        dm : INT;
    END_VAR
END_FUNCTION
FUNCTION DAY_OF_DATE : DINT
    VAR_INPUT
        idate : DATE;
    END_VAR
END_FUNCTION
FUNCTION DAY_OF_MONTH : INT
    VAR_INPUT
        IDATE : DATE;
    END_VAR
    VAR
        leap : INT;
    END_VAR
END_FUNCTION
FUNCTION DAY_OF_WEEK : INT
    VAR_INPUT
        IDATE : DATE;
    END_VAR
END_FUNCTION
FUNCTION DAY_OF_YEAR : INT
    VAR_INPUT
        IDATE : DATE;
    END_VAR
END_FUNCTION
FUNCTION DAY_TO_TIME : TIME
    VAR_INPUT
        IN : REAL;
    END_VAR
END_FUNCTION
FUNCTION DAYS_DELTA : DINT
    VAR_INPUT
        date_1 : DATE;
        date_2 : DATE;
    END_VAR
END_FUNCTION
FUNCTION DAYS_IN_MONTH : INT
    VAR_INPUT
        IDATE : DATE;
    END_VAR
END_FUNCTION
FUNCTION DAYS_IN_YEAR : INT
    VAR_INPUT
        IDATE : DATE;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK DCF77
    VAR_INPUT
        REC : BOOL;
        SET : BOOL;
        SDT : DT;
        DSI : BOOL;
        SYNC_TIMEOUT : TIME := TIME#2m0s0ms;
        TIME_OFFSET : INT := 1;
        DST_EN : BOOL := TRUE;
    END_VAR
    VAR_OUTPUT
        TP : BOOL;
        DS : BOOL;
        WDAY : INT;
        ERROR : BOOL := TRUE;
        RTC : DT;
        RTC1 : DT;
        MSEC : INT;
        SYNC : BOOL;
    END_VAR
    VAR
        mez : DT;
        utc : DT;
        state : INT;
        edge_ : BOOL;
        tx : TIME;
        ty : TIME;
        last : TIME;
        bits : ARRAY[0..58] OF BOOL;
        cnt : INT;
        i : INT;
        old_time : DT;
        minute : INT;
        hour : INT;
        day : INT;
        month : INT;
        year : INT;
        last_sync : TIME;
        t1 : TIME;
        tz : TIME;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION DST : BOOL
    VAR_INPUT
        UTC : DT;
    END_VAR
    VAR
        yr : INT;
        yr4 : DWORD;
        ltc : DWORD;
        idate : DWORD;
    END_VAR
END_FUNCTION
FUNCTION DT_TO_SDT : BOOL
    VAR_INPUT
        DTI : DT;
    END_VAR
    VAR_IN_OUT
        retVal : SDT; (*Return value of the function*)
    END_VAR
    VAR
        tmp : DATE;
        tdt : DWORD;
    END_VAR
END_FUNCTION
FUNCTION DT2_TO_SDT : BOOL
    VAR_INPUT
        DI : DATE;
        TI : TOD;
    END_VAR
    VAR_IN_OUT
        retVal : SDT; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION EASTER : DATE
    VAR_INPUT
        year : INT;
    END_VAR
    VAR
        b : INT;
        c : INT;
        oday : INT;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK EVENTS
    VAR_INPUT
        DATE_IN : DATE;
        ENA : BOOL;
    END_VAR
    VAR_OUTPUT
        Y : BOOL;
        NAME : STRING[30];
    END_VAR
    VAR_IN_OUT
        ELIST : ARRAY[0..49] OF HOLIDAY_DATA;
    END_VAR
    VAR
        i : INT;
        last_active : DATE;
        size : INT := 49;
        day_in : DINT;
        cyr : INT;
        lday : DINT;
        check : HOLIDAY_DATA;
        y_int : BOOL;
        name_int : STRING[30];
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK HOLIDAY
    VAR_INPUT
        DATE_IN : DATE;
        LANGU : INT;
        FRIDAY : BOOL;
        SATURDAY : BOOL;
        SUNDAY : BOOL;
    END_VAR
    VAR_OUTPUT
        Y : BOOL;
        NAME : STRING[30];
    END_VAR
    VAR_IN_OUT
        HOLIDAYS : ARRAY[0..29] OF HOLIDAY_DATA;
    END_VAR
    VAR
        last_active : DATE;
        ostern : DATE;
        i : INT;
        jahr : INT;
        x_date : DATE;
        lx : INT;
        wdx : INT;
    END_VAR
    VAR CONSTANT
        SIZE : INT := 29;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION HOUR : INT
    VAR_INPUT
        itod : TOD;
    END_VAR
END_FUNCTION
FUNCTION HOUR_OF_DT : INT
    VAR_INPUT
        XDT : DT;
    END_VAR
END_FUNCTION
FUNCTION HOUR_TO_TIME : TIME
    VAR_INPUT
        IN : REAL;
    END_VAR
END_FUNCTION
FUNCTION HOUR_TO_TOD : TOD
    VAR_INPUT
        IN : REAL;
    END_VAR
END_FUNCTION
FUNCTION JD2000 : REAL
    VAR_INPUT
        DTI : DT;
    END_VAR
END_FUNCTION
FUNCTION LEAP_DAY : BOOL
    VAR_INPUT
        IDATE : DATE;
    END_VAR
END_FUNCTION
FUNCTION LEAP_OF_DATE : BOOL
    VAR_INPUT
        idate : DATE;
    END_VAR
END_FUNCTION
FUNCTION LEAP_YEAR : BOOL
    VAR_INPUT
        yr : INT;
    END_VAR
END_FUNCTION
FUNCTION LTIME_TO_UTC : DT
    VAR_INPUT
        LOCAL_TIME : DT;
        DST : BOOL;
        TIME_ZONE_OFFSET : INT;
    END_VAR
END_FUNCTION
FUNCTION MINUTE : INT
    VAR_INPUT
        itod : TOD;
    END_VAR
END_FUNCTION
FUNCTION MINUTE_OF_DT : INT
    VAR_INPUT
        XDT : DT;
    END_VAR
END_FUNCTION
FUNCTION MINUTE_TO_TIME : TIME
    VAR_INPUT
        IN : REAL;
    END_VAR
END_FUNCTION
FUNCTION MONTH_BEGIN : DATE
    VAR_INPUT
        idate : DATE;
    END_VAR
END_FUNCTION
FUNCTION MONTH_END : DATE
    VAR_INPUT
        IDATE : DATE;
    END_VAR
END_FUNCTION
FUNCTION MONTH_OF_DATE : INT
    VAR_INPUT
        IDATE : DATE;
    END_VAR
END_FUNCTION
FUNCTION MULTIME : TIME
    VAR_INPUT
        t : TIME;
        M : REAL;
    END_VAR
END_FUNCTION
FUNCTION PERIOD : BOOL
    VAR_INPUT
        d1 : DATE;
        dx : DATE;
        d2 : DATE;
    END_VAR
    VAR
        day1 : INT;
        day2 : INT;
        dayx : INT;
    END_VAR
END_FUNCTION
FUNCTION PERIOD2 : BOOL
    VAR_INPUT
        DP : ARRAY[0..3, 0..1] OF DATE;
        DX : DATE;
    END_VAR
END_FUNCTION
FUNCTION REFRACTION : REAL
    VAR_INPUT
        ELEV : REAL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK RTC_2
    VAR_INPUT
        SET : BOOL;
        SDT : DT;
        SMS : INT;
        DEN : BOOL;
        OFS : INT;
    END_VAR
    VAR_OUTPUT
        UDT : DT;
        LOCAL_DT : DT;
        DSO : BOOL;
        XMS : INT;
    END_VAR
    VAR
        RT : RTC_MS;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK RTC_MS
    VAR_INPUT
        SET : BOOL;
        SDT : DT;
        SMS : INT;
    END_VAR
    VAR_OUTPUT
        XDT : DT;
        XMS : INT;
    END_VAR
    VAR
        init : BOOL;
        last : DWORD;
        Tx : DWORD;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION SDT_TO_DATE : DATE
    VAR_INPUT
        DTI : SDT;
    END_VAR
END_FUNCTION
FUNCTION SDT_TO_DT : DT
    VAR_INPUT
        DTI : SDT;
    END_VAR
END_FUNCTION
FUNCTION SDT_TO_TOD : TOD
    VAR_INPUT
        DTI : SDT;
    END_VAR
END_FUNCTION
FUNCTION SECOND : REAL
    VAR_INPUT
        itod : TOD;
    END_VAR
END_FUNCTION
FUNCTION SECOND_OF_DT : INT
    VAR_INPUT
        XDT : DT;
    END_VAR
END_FUNCTION
FUNCTION SECOND_TO_TIME : TIME
    VAR_INPUT
        IN : REAL;
    END_VAR
END_FUNCTION
FUNCTION SET_DATE : DATE
    VAR_INPUT
        YEAR : INT;
        MONTH : INT;
        DAY : INT;
    END_VAR
    VAR
        count : INT;
        ofs : ARRAY[1..12] OF INT := [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
        ENDIF : BOOL;
    END_VAR
END_FUNCTION
FUNCTION SET_DT : DT
    VAR_INPUT
        year : INT;
        month : INT;
        day : INT;
        hour : INT;
        minute : INT;
        second : INT;
    END_VAR
END_FUNCTION
FUNCTION SET_TOD : TOD
    VAR_INPUT
        hour : INT;
        minute : INT;
        second : REAL;
    END_VAR
END_FUNCTION
FUNCTION SUN_MIDDAY : TOD
    VAR_INPUT
        LON : REAL;
        UTC : DATE;
    END_VAR
    VAR
        T : REAL;
        OFFSET : REAL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK SUN_POS
    VAR_INPUT
        latitude : REAL; (* latitude of geographical position  *)
        longitude : REAL; (* longitude of geographical position  *)
        utc : DT; (*	world time				*)
    END_VAR
    VAR_OUTPUT
        B : REAL;
        H : REAL;
        HR : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SUN_TIME
    VAR_INPUT
        LATITUDE : REAL; (* latitude of geographical position  *)
        LONGITUDE : REAL; (* longitude of geographical position  *)
        UTC : DATE; (*	world time	*)
        H : REAL := -0.83333333333; (* heighth above horizon for sunrise *)
    END_VAR
    VAR_OUTPUT
        MIDDAY : TOD; (*	astrological midday in hours when sun stands at south direction	*)
        SUN_RISE : TOD; (*	sun rise for current day in local time *)
        SUN_SET : TOD; (*	sun set for current day in local time *)
        SUN_DECLINATION : REAL; (*	sun declination above horizon at midday in degrees	*)
    END_VAR
    VAR
        dk : REAL; (* sun declination at midday *)
        delta : TIME; (* delta from midday for sunrise and sunset  *)
        b : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION TIMECHECK : BOOL
    VAR_INPUT
        TD : TOD;
        START : TOD;
        STOP : TOD;
    END_VAR
END_FUNCTION
FUNCTION UTC_TO_LTIME : DT
    VAR_INPUT
        UTC : DT;
        DST_ENABLE : BOOL;
        TIME_ZONE_OFFSET : INT;
    END_VAR
    VAR
        tmp : INT;
    END_VAR
END_FUNCTION
FUNCTION WORK_WEEK : INT
    VAR_INPUT
        idate : DATE;
    END_VAR
    VAR
        d1 : DATE;
        w1 : INT;
        ds : DWORD;
        yr : INT;
        w31 : INT;
        w01 : INT;
        wm : INT;
    END_VAR
END_FUNCTION
FUNCTION YEAR_BEGIN : DATE
    VAR_INPUT
        y : INT;
    END_VAR
END_FUNCTION
FUNCTION YEAR_END : DATE
    VAR_INPUT
        y : INT;
    END_VAR
END_FUNCTION
FUNCTION YEAR_OF_DATE : INT
    VAR_INPUT
        IDATE : DATE;
    END_VAR
END_FUNCTION
