# Filter by Track Duration
MoveApps

Github repository: *github.com/movestore/filter_by_duration*

## Description
Filters your data set to only include tracks of a certain length.

## Documentation
This App filters the input data set to include only individual tracks that fullfill a certain lenght requirement. Lenght can be defined as number of locations or a time duration. The duration of each track is derived directly from the data, not from Movebank individual properties.

### Input data
moveStack in Movebank format

### Output data
moveStack in Movebank format

### Artefacts
none

### Parameters 
`rel`: By this parameter the direction in the required filter has to be selected. The possible values 'above' and 'below' determine if tracks of minimum or maximum defined length shall be retained.

`valu`: Value of the selected required length relation that the filtered part of the data set has to fullfill. Note that also comma-values can be entered. Example: `50.2`

`uni`: Unit of the length value that the filtered data set has to fullfill. Possible values are 'locations' or any time unit ranging between 'seconds' and 'years'.

### Null or error handling:
**Parameter `rel`:** If none of the relation options are selected, an error will be returned.

**Parameter `valu`:** If there is no value entered, an error will be returned. Only one numeric value can be entered, comma-values are possible.

**Parameter `uni`:** If there is no value selected, an error will be returned.

**Data:** If none of the individuals in the input data set satisfy the selected length requirement, a warning is given and a NULL data set is returned. The NULL return value likely produces an error.