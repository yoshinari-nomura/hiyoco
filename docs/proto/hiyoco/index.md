# Protocol Documentation
<a name="top"/>

## Table of Contents

- [hiyoco/calendar/event.proto](#hiyoco/calendar/event.proto)
    - [Date](#hiyoco.calendar.Date)
    - [DateOrTime](#hiyoco.calendar.DateOrTime)
    - [DateTime](#hiyoco.calendar.DateTime)
    - [Event](#hiyoco.calendar.Event)
    - [Result](#hiyoco.calendar.Result)
    - [Text](#hiyoco.calendar.Text)
  
  
  
  

- [hiyoco/calendar_watcher/service.proto](#hiyoco/calendar_watcher/service.proto)
  
  
  
    - [Filter](#hiyoco.calendar_watcher.Filter)
    - [Informant](#hiyoco.calendar_watcher.Informant)
    - [Sounder](#hiyoco.calendar_watcher.Sounder)
  

- [hiyoco/informant/service.proto](#hiyoco/informant/service.proto)
  
  
  
    - [Informant](#hiyoco.informant.Informant)
  

- [hiyoco/sounder/service.proto](#hiyoco/sounder/service.proto)
  
  
  
    - [Sounder](#hiyoco.sounder.Sounder)
  

- [Scalar Value Types](#scalar-value-types)



<a name="hiyoco/calendar/event.proto"/>
<p align="right"><a href="#top">Top</a></p>

## hiyoco/calendar/event.proto
Event related messages.

This file is event.proto for hiyoco calendar


<a name="hiyoco.calendar.Date"/>

### Date
Represents Date type variable provided by Google Calendar


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| date | [google.protobuf.Timestamp](#google.protobuf.Timestamp) |  | Date |






<a name="hiyoco.calendar.DateOrTime"/>

### DateOrTime
Represents which type is event, Date type or DateTime type


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| date | [Date](#hiyoco.calendar.Date) |  | Date type |
| dateTime | [DateTime](#hiyoco.calendar.DateTime) |  | DateTime type |






<a name="hiyoco.calendar.DateTime"/>

### DateTime
Represents DateTime type variables provided by Google Calendar


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| dateTime | [google.protobuf.Timestamp](#google.protobuf.Timestamp) |  | Datetime |
| timeZone | [string](#string) |  | Timezone |






<a name="hiyoco.calendar.Event"/>

### Event
Represents event detail


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| start | [DateOrTime](#hiyoco.calendar.DateOrTime) |  | Start date or dateTime of the event |
| end | [DateOrTime](#hiyoco.calendar.DateOrTime) |  | End date or dateTime of the event |
| summary | [string](#string) |  | Summary of the event |
| description | [string](#string) |  | Description about the event |






<a name="hiyoco.calendar.Result"/>

### Result
Represents return value of result


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [bool](#bool) |  | Result |






<a name="hiyoco.calendar.Text"/>

### Text
Represents plain text


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| body | [string](#string) |  | Text body |





 

 

 

 



<a name="hiyoco/calendar_watcher/service.proto"/>
<p align="right"><a href="#top">Top</a></p>

## hiyoco/calendar_watcher/service.proto


 

 

 


<a name="hiyoco.calendar_watcher.Filter"/>

### Filter


| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| SayEvent | [.hiyoco.calendar.Event](#hiyoco.calendar.Event) | [.hiyoco.calendar.Result](#hiyoco.calendar.Event) |  |


<a name="hiyoco.calendar_watcher.Informant"/>

### Informant


| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| SayEvent | [.hiyoco.calendar.Event](#hiyoco.calendar.Event) | [.hiyoco.calendar.Result](#hiyoco.calendar.Event) |  |


<a name="hiyoco.calendar_watcher.Sounder"/>

### Sounder


| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| SayEvent | [.hiyoco.calendar.Event](#hiyoco.calendar.Event) | [.hiyoco.calendar.Result](#hiyoco.calendar.Event) |  |

 



<a name="hiyoco/informant/service.proto"/>
<p align="right"><a href="#top">Top</a></p>

## hiyoco/informant/service.proto


 

 

 


<a name="hiyoco.informant.Informant"/>

### Informant
Service for handling SayEvent

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| SayEvent | [.hiyoco.calendar.Text](#hiyoco.calendar.Text) | [.hiyoco.calendar.Result](#hiyoco.calendar.Text) |  |

 



<a name="hiyoco/sounder/service.proto"/>
<p align="right"><a href="#top">Top</a></p>

## hiyoco/sounder/service.proto


 

 

 


<a name="hiyoco.sounder.Sounder"/>

### Sounder
Service for handling SayEvent

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| SayEvent | [.hiyoco.calendar.Text](#hiyoco.calendar.Text) | [.hiyoco.calendar.Result](#hiyoco.calendar.Text) |  |

 



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

