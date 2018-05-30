# Protocol Documentation
<a name="top"/>

## Table of Contents

- [event.proto](#event.proto)
    - [Date](#camome.calendar.Date)
    - [DateOrTime](#camome.calendar.DateOrTime)
    - [DateTime](#camome.calendar.DateTime)
    - [Event](#camome.calendar.Event)
    - [Result](#camome.calendar.Result)
    - [Status](#camome.calendar.Status)
  
  
  
  

- [Scalar Value Types](#scalar-value-types)



<a name="event.proto"/>
<p align="right"><a href="#top">Top</a></p>

## event.proto
Event related messages.

This file is event.proto for hiyoco calendar


<a name="camome.calendar.Date"/>

### Date
Represents Date type variable provided by Google Calendar


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| date | [google.protobuf.Timestamp](#google.protobuf.Timestamp) |  | Date |






<a name="camome.calendar.DateOrTime"/>

### DateOrTime
Represents which type is event, Date type or DateTime type


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| date | [Date](#camome.calendar.Date) |  | Date type |
| dateTime | [DateTime](#camome.calendar.DateTime) |  | DateTime type |






<a name="camome.calendar.DateTime"/>

### DateTime
Represents DateTime type variables provided by Google Calendar


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| dateTime | [google.protobuf.Timestamp](#google.protobuf.Timestamp) |  | Datetime |
| timeZone | [string](#string) |  | Timezone |






<a name="camome.calendar.Event"/>

### Event
Represents event detail


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| start | [DateOrTime](#camome.calendar.DateOrTime) |  | Start date or dateTime of the event |
| end | [DateOrTime](#camome.calendar.DateOrTime) |  | End date or dateTime of the event |
| summary | [string](#string) |  | Summary of the event |
| description | [string](#string) |  | Description about the event |






<a name="camome.calendar.Result"/>

### Result
Represents return value of result


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [bool](#bool) |  | Result |






<a name="camome.calendar.Status"/>

### Status
Represents status code of Slack


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status_code | [string](#string) |  | Status code |





 

 

 

 



## Scalar Value Types

| .proto Type | Notes | C++ Type | Java Type | Python Type |
| ----------- | ----- | -------- | --------- | ----------- |
| <a name="double" /> double |  | double | double | float |
| <a name="float" /> float |  | float | float | float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long |
| <a name="bool" /> bool |  | bool | boolean | boolean |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str |

