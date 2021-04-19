FUNCTION_BLOCK BASE64_DECODE_STR
    VAR_INPUT
        RUN : BOOL;
    END_VAR
    VAR_OUTPUT
        DONE : BOOL;
    END_VAR
    VAR_IN_OUT
        STR1 : STRING[192];
        STR2 : STRING[144];
    END_VAR
    VAR
        BASE64_DECODE_STREAM : BASE64_DECODE_STREAM;
        run_last : BOOL;
        buf1 : ARRAY[0..63] OF BYTE;
        buf2 : ARRAY[0..47] OF BYTE;
        mode : INT;
        size1 : INT;
        size2 : INT;
        end : INT;
        pos : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BASE64_DECODE_STREAM
    VAR_INPUT
        SIZE1 : INT;
    END_VAR
    VAR_OUTPUT
        SIZE2 : INT;
    END_VAR
    VAR_IN_OUT
        BUF1 : ARRAY[0..63] OF BYTE;
        BUF2 : ARRAY[0..47] OF BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BASE64_ENCODE_STR
    VAR_INPUT
        RUN : BOOL;
    END_VAR
    VAR_OUTPUT
        DONE : BOOL;
    END_VAR
    VAR_IN_OUT
        STR1 : STRING[144];
        STR2 : STRING[192];
    END_VAR
    VAR
        BASE64_ENCODE_STREAM : BASE64_ENCODE_STREAM;
        run_last : BOOL;
        buf1 : ARRAY[0..47] OF BYTE;
        buf2 : ARRAY[0..63] OF BYTE;
        mode : INT;
        size1 : INT;
        size2 : INT;
        end : INT;
        pos : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BASE64_ENCODE_STREAM
    VAR_INPUT
        SIZE1 : INT;
    END_VAR
    VAR_OUTPUT
        SIZE2 : INT;
    END_VAR
    VAR_IN_OUT
        BUF1 : ARRAY[0..47] OF BYTE;
        BUF2 : ARRAY[0..63] OF BYTE;
    END_VAR
    VAR
        a : INT;
        b : WORD;
        i : INT;
        i2 : INT;
        i3 : INT;
        c : INT;
        BASE64 : STRING[64] := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
    END_VAR
END_FUNCTION_BLOCK
FUNCTION HTML_DECODE : BOOL
    VAR_INPUT
        IN : STRING[STRING_LENGTH];
    END_VAR
    VAR_IN_OUT
        retVal : STRING[STRING_LENGTH]; (*Return value of the function*)
    END_VAR
    VAR
        pos : INT;
        end : INT;
        tmp : STRING[10];
        code : STRING[1];
    END_VAR
END_FUNCTION
FUNCTION HTML_ENCODE : BOOL
    VAR_INPUT
        IN : STRING[STRING_LENGTH];
        M : BOOL;
    END_VAR
    VAR_IN_OUT
        retVal : STRING[STRING_LENGTH]; (*Return value of the function*)
    END_VAR
    VAR
        pt_in : REFERENCE TO ARRAY[1..255] OF BYTE;
        pt_out : REFERENCE TO ARRAY[1..256] OF BYTE;
        pos_in : INT;
        pos_out : INT;
        stop : INT;
        B : BYTE;
        tmp : STRING[10];
        i : INT;
    END_VAR
END_FUNCTION
FUNCTION IP4_CHECK : BOOL
    VAR_INPUT
        NIP : DWORD;
        LIP : DWORD;
        SM : DWORD;
    END_VAR
END_FUNCTION
FUNCTION IP4_DECODE : DWORD
    VAR_INPUT
        str : STRING[15];
    END_VAR
    VAR
        pos : INT;
    END_VAR
END_FUNCTION
FUNCTION IP4_TO_STRING : BOOL
    VAR_INPUT
        IP4 : DWORD;
    END_VAR
    VAR_IN_OUT
        retVal : STRING[15]; (*Return value of the function*)
    END_VAR
    VAR
        tmp : STRING[3];
    END_VAR
END_FUNCTION
FUNCTION IS_IP4 : BOOL
    VAR_INPUT
        str : STRING[255];
    END_VAR
END_FUNCTION
FUNCTION IS_URLCHR : BOOL
    VAR_INPUT
        IN : BYTE;
    END_VAR
END_FUNCTION
FUNCTION MD5_AUX : DWORD
    VAR_INPUT
        N : INT;
        A : DWORD;
        B : DWORD;
        C : DWORD;
        D : DWORD;
        X : DWORD;
        U : INT;
        T : DWORD;
    END_VAR
    VAR
        w : DWORD;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK MD5_CRAM_AUTH
    VAR_IN_OUT
        RUN : BOOL;
        USERNAME : STRING[64];
        PASSWORD : STRING[64];
        B64_TS : STRING[64]; (* Base64 coded ServerTimeStamp *)
        AUTH_KEY : STRING[192];
    END_VAR
    VAR
        BASE64_DECODE_STR : BASE64_DECODE_STR;
        BASE64_ENCODE_STR : BASE64_ENCODE_STR;
        MD5_STREAM : MD5_STREAM;
        step : INT;
        md5_mode : INT;
        buf : ARRAY[0..63] OF BYTE;
        md5 : ARRAY[0..15] OF BYTE;
        md5_first : ARRAY[0..15] OF BYTE;
        md5_str1 : STRING[64];
        md5_str2 : STRING[64];
        size : UDINT;
        n1 : INT;
        n2 : INT;
        pos : UDINT;
        b64d_run : BOOL;
        b64d_done : BOOL;
        b64e_run : BOOL;
        b64e_done : BOOL;
        str_192 : STRING[192];
        str_144 : STRING[144];
        xpad : BYTE;
        pt : REFERENCE TO BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MD5_STR
    VAR_INPUT
        RUN : BOOL;
    END_VAR
    VAR_OUTPUT
        DONE : BOOL;
    END_VAR
    VAR_IN_OUT
        STR : STRING[STRING_LENGTH];
        MD5 : ARRAY[0..15] OF BYTE;
    END_VAR
    VAR
        run_last : BOOL;
        MD5_STREAM : MD5_STREAM;
        buf : ARRAY[0..63] OF BYTE;
        mode : INT;
        size : UDINT;
        pos : UDINT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MD5_STREAM
    VAR_OUTPUT
        POS : UDINT;
    END_VAR
    VAR_IN_OUT
        MODE : INT;
        BUF : ARRAY[0..63] OF BYTE;
        MD5 : ARRAY[0..15] OF BYTE;
        SIZE : UDINT;
    END_VAR
    VAR
        hash : ARRAY[0..3] OF DWORD;
        a : DWORD;
        b : DWORD;
        c : DWORD;
        d : DWORD;
        end : UDINT;
        block : UDINT;
        x : ARRAY[0..15] OF DWORD;
        n : INT;
        n1 : INT;
        z : INT;
        pad_1 : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION MD5_TO_STRH : BOOL
    VAR_INPUT
        MD5 : ARRAY[0..15] OF BYTE;
    END_VAR
    VAR_IN_OUT
        retVal : STRING[32]; (*Return value of the function*)
    END_VAR
    VAR
        i : INT;
        tmp : BYTE;
        pt : REFERENCE TO BYTE;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK RC4_CRYPT_STREAM
    VAR_OUTPUT
        POS : UDINT;
    END_VAR
    VAR_IN_OUT
        MODE : INT;
        KEY : STRING[40];
        BUF : ARRAY[0..63] OF BYTE;
        SIZE : UDINT;
    END_VAR
    VAR
        sbox : ARRAY[0..255] OF BYTE;
        skey : ARRAY[0..255] OF BYTE;
        a : INT;
        b : INT;
        c : INT;
        d : USINT;
        e : USINT;
        end : UDINT;
        v : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SHA1_STR
    VAR_INPUT
        RUN : BOOL;
    END_VAR
    VAR_OUTPUT
        DONE : BOOL;
    END_VAR
    VAR_IN_OUT
        STR : STRING[STRING_LENGTH];
        SHA1 : ARRAY[0..19] OF BYTE;
    END_VAR
    VAR
        run_last : BOOL;
        SHA1_STREAM : SHA1_STREAM;
        buf : ARRAY[0..63] OF BYTE;
        mode : INT;
        size : UDINT;
        pos : UDINT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SHA1_STREAM
    VAR_OUTPUT
        POS : UDINT;
    END_VAR
    VAR_IN_OUT
        MODE : INT;
        BUF : ARRAY[0..63] OF BYTE;
        SHA1 : ARRAY[0..19] OF BYTE;
        SIZE : UDINT;
    END_VAR
    VAR
        hash : ARRAY[0..4] OF DWORD;
        end : UDINT;
        block : UDINT;
        pad_1 : BOOL;
        w : ARRAY[0..79] OF DWORD;
        n : INT;
        n1 : INT;
        a : DWORD;
        b : DWORD;
        c : DWORD;
        d : DWORD;
        e : DWORD;
        f : DWORD;
        k : DWORD;
        x : DWORD;
        z : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION SHA1_TO_STRH : BOOL
    VAR_INPUT
        SHA1 : ARRAY[0..19] OF BYTE;
    END_VAR
    VAR_IN_OUT
        retVal : STRING[40]; (*Return value of the function*)
    END_VAR
    VAR
        i : INT;
        tmp : BYTE;
        pt : REFERENCE TO BYTE;
    END_VAR
END_FUNCTION
FUNCTION STRING_TO_URL : BOOL
    VAR_INPUT
        STR : STRING[STRING_LENGTH];
        DEFAULT_PROTOCOL : STRING[10];
        DEFAULT_PATH : STRING[80];
    END_VAR
    VAR_IN_OUT
        retVal : URL; (*Return value of the function*)
    END_VAR
    VAR
        pos : INT;
        pos2 : INT;
        x : STRING[STRING_LENGTH];
    END_VAR
END_FUNCTION
FUNCTION URL_DECODE : BOOL
    VAR_INPUT
        IN : STRING[STRING_LENGTH];
    END_VAR
    VAR_IN_OUT
        retVal : STRING[STRING_LENGTH]; (*Return value of the function*)
    END_VAR
    VAR
        pos : INT;
        seq : STRING[3];
        new : STRING[1];
    END_VAR
END_FUNCTION
FUNCTION URL_ENCODE : BOOL
    VAR_INPUT
        IN : STRING[STRING_LENGTH];
    END_VAR
    VAR_IN_OUT
        retVal : STRING[STRING_LENGTH]; (*Return value of the function*)
    END_VAR
    VAR
        pt_in : REFERENCE TO ARRAY[1..255] OF BYTE;
        pt_out : REFERENCE TO ARRAY[1..256] OF BYTE;
        pos_in : INT;
        pos_out : INT;
        stop : INT;
        tb : BYTE;
    END_VAR
END_FUNCTION
FUNCTION URL_TO_STRING : BOOL
    VAR_INPUT
        IN : URL;
    END_VAR
    VAR_IN_OUT
        retVal : STRING[STRING_LENGTH]; (*Return value of the function*)
    END_VAR
END_FUNCTION
