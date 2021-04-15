# Quirks between CODESYS PlcOpenXml data and B&R Automation studio

Here we list all the known quirks and differences between the source and the B&R Automation studio

## Data types

## Function blocks

## Functions

- AS function cannot return a string, array or a struct but Codesys can. These functions need to be converted that they return a BOOL and add a VAR_OUTPUT where the correct return result will be stored. This problem is solved partially by the automatic porter

## Pous in general

- Codesys uses syntax POINTER TO while AS uses REFERENCE TO. This problem is solved during the automatic porting
- Pointer dereferencing is not the same between systems. Needs to be fixed manually
- All identifiers like variables, functions, data types etc are case sensitive. Some problems have been fixed with the script
