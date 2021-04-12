FUNCTION _ARRAY_ABS : BOOL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
    END_VAR
    VAR
        i : UINT; (**)
        stop : UINT; (**)
    END_VAR
END_FUNCTION
FUNCTION _ARRAY_ADD : BOOL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
        X : REAL; (**)
    END_VAR
    VAR
        i : UINT; (**)
        stop : UINT; (**)
    END_VAR
END_FUNCTION
FUNCTION _ARRAY_INIT : BOOL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
        init : REAL; (**)
    END_VAR
    VAR
        i : UINT; (**)
        stop : UINT; (**)
    END_VAR
END_FUNCTION
FUNCTION _ARRAY_MEDIAN : REAL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
    END_VAR
    VAR
        i : UINT; (**)
        stop : UINT; (**)
    END_VAR
END_FUNCTION
FUNCTION _ARRAY_MUL : BOOL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
        X : REAL; (**)
    END_VAR
    VAR
        i : UINT; (**)
        stop : UINT; (**)
    END_VAR
END_FUNCTION
FUNCTION _ARRAY_SHUFFLE : BOOL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
    END_VAR
    VAR
        temp : REAL; (**)
        pos : INT; (**)
        i : INT; (**)
        stop : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION _ARRAY_SORT : BOOL
    VAR_INPUT
        PT : POINTER TO ARRAY[1..32000] OF REAL; (**)
        SIZE : UINT; (**)
    END_VAR
    VAR
        stack_count : UINT; (* Laufvariable Stack*)
        stack : ARRAY[1..32] OF UINT; (* Stackgröße~ 1,6*Log(n)/log(2) *)
        links : UINT; (* Anfangselement des Arrays *)
        rechts : UINT; (* Endelement des Arrays *)
        pivot : REAL; (* temporärer Schwellwert für Tauschbedingung *)
        i : UINT; (* Laufvariable1 *)
        j : UINT; (* Laufvariable2 *)
        ende_innen : BOOL; (* Ende innere Schleife *)
        ende_aussen : BOOL; (* Ende äußere Schleife *)
        tmp : REAL; (* Hilfsvariable zum Tauschen von Werten *)
    END_VAR
END_FUNCTION
FUNCTION ARRAY_AVG : REAL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
    END_VAR
    VAR
        i : UINT; (**)
        stop : UINT; (**)
    END_VAR
END_FUNCTION
FUNCTION ARRAY_GAV : REAL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
    END_VAR
    VAR
        i : UINT; (**)
        stop : UINT; (**)
    END_VAR
END_FUNCTION
FUNCTION ARRAY_HAV : REAL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
    END_VAR
    VAR
        i : UINT; (**)
        stop : UINT; (**)
    END_VAR
END_FUNCTION
FUNCTION ARRAY_MAX : REAL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
    END_VAR
    VAR
        i : UINT; (**)
        stop : UINT; (**)
    END_VAR
END_FUNCTION
FUNCTION ARRAY_MIN : REAL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
    END_VAR
    VAR
        i : UINT; (**)
        stop : UINT; (**)
    END_VAR
END_FUNCTION
FUNCTION ARRAY_SDV : REAL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
    END_VAR
END_FUNCTION
FUNCTION ARRAY_SPR : REAL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
    END_VAR
    VAR
        i : UINT; (**)
        stop : UINT; (**)
        array_max : REAL; (**)
        array_min : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION ARRAY_SUM : REAL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
    END_VAR
    VAR
        i : UINT; (**)
        stop : UINT; (**)
    END_VAR
END_FUNCTION
FUNCTION ARRAY_TREND : REAL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
    END_VAR
    VAR
        i : UINT; (**)
        stop : UINT; (**)
        x : REAL; (**)
        stop2 : UINT; (**)
    END_VAR
END_FUNCTION
FUNCTION ARRAY_VAR : REAL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
    END_VAR
    VAR
        avg : REAL; (**)
        i : UINT; (**)
        stop : UINT; (**)
    END_VAR
END_FUNCTION
FUNCTION IS_SORTED : BOOL
    VAR_INPUT
        pt : POINTER TO ARRAY[0..32000] OF REAL; (**)
        size : UINT; (**)
    END_VAR
    VAR
        stop : INT; (**)
        i : INT; (**)
    END_VAR
END_FUNCTION
