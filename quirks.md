# Quirks between CODESYS PlcOpenXml data and B&R Automation studio

Here we list all the known quirks and differences between the source and the B&R Automation studio

## Libraries

- Version attribute can only be in format X.YY.Z

## Data types



## Var files

- All variables here are constants
- Even though the data types of the constant have values they need to be initialized

## Function blocks

## Functions

- AS function cannot return a string, array or a struct but Codesys can. These functions need to be converted that they return a BOOL and add a VAR_IN_OUT where the correct return result will be stored. This problem is solved partially by the automatic porter and the return value must be fixed manually

## Pous in general

- Codesys uses syntax POINTER TO while AS uses REFERENCE TO. This problem is solved during the automatic porting
- Pointer dereferencing is not the same between systems. Needs to be fixed manually
- All identifiers like variables, functions, data types etc are case sensitive. Some problems have been fixed with the script
- Many pous use the variable edge which is a protected keyword. use edge_
- syntax for array and string sizes and also POUs like OSCAT_BASIC.STRING_LENGHT is converted to be just STRING_LENGHT as the library holding this constant needs to be added as dependency library
- END_IF;,END_CASE;, END_FOR; and END_WHILE; statements do not need a semicolon at the end. This is fixed with the script
- VAR_INPUT CONSTANT doesnt exist in automation studio. These need to be figured out what we do with them
- BYTE + BYTE is not possible
- DWORD + DWORD is not possible
- If ADR() is used, resulting data type must be UDINT
