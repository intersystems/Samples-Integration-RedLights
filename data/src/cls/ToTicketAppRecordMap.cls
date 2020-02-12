/// RECORDMAP: Modified during compilation of RecordMap 'Demo.ToTicketAppRecordMap'
/// on 2019-01-17 at 17:15:08.944 [2019-01-17 22:15:08.944 UTC]
/// by user SuperUser
Class Demo.ToTicketAppRecordMap Extends EnsLib.RecordMap.RecordMap
{

/// Method to retrieve a record from a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod GetObject(pStream As %IO.DeviceStream, Output pObject As %RegisteredObject, pTimeout As %Numeric = -1, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status
{
	try {
		set tStatus = $$$OK
		set pObject = $$$NULLOREF
		if '$IsObject(pStream) {
			set tFilename = pStream
			set pStream = ##class(%IO.FileStream).%New()
			do pStream.Open(tFilename,,pTimeout,"UTF-8", .tStatus)
			if $$$ISERR(tStatus) quit
		}
		set tObjectName = $parameter($this,"OBJECTNAME")
		set tObject = $classmethod(tObjectName,"%New")
		if '$IsObject(tObject) {
			set tStatus = $$$ERROR($$$CannotCreateObject,tObjectName)
			quit
		}
		set tObject.%Source = pStream.Name
		set tGetTopFields = $parameter(tObject,"INCLUDETOPFIELDS")
		if pStream.AtEnd && (""=pLookAhead) {
			set tStatus = $$$ERROR($$$EnsRecordMapErrStreamAtEnd, pStream.Name)
			quit
		}
		set pStream.CharEncoding = "UTF-8"

		#; Parse incoming stream
		set tStatus = ..GetRecord(pStream, tObject, tGetTopFields, pTimeout, .pLookAhead, pLabelFound)
		if $$$ISERR(tStatus) quit
	}
	catch ex {
		set tStatus = ex.AsStatus()
	}
	if $$$ISERR(tStatus) { set pObject = $$$NULLOREF }
	else { set pObject = tObject }
	quit tStatus
}

/// Method to write a record to a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod PutObject(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pFlush As %Boolean = 1, ByRef pPadArray As %String) As %Status
{
	try {
		set tStatus = $$$OK
		if '$IsObject(pStream) {
			set tFilename = pStream
			set pStream = ##class(%IO.FileStream).%New()
			do pStream.Open(tFilename,"WAE",,"UTF-8", .tStatus)
			if $$$ISERR(tStatus) quit
		}
		set tHasTopFields = $parameter(pObject,"INCLUDETOPFIELDS")
		set pStream.CharEncoding = "UTF-8"

		set tStatus = ..PutRecord(pStream, pObject, tHasTopFields, .pPadArray)
		if $$$ISERR(tStatus) quit
		if pFlush do pStream.Flush(.tStatus)
		if $$$ISERR(tStatus) quit
	}
	catch ex {
		set tStatus = ex.AsStatus()
	}
	quit tStatus
}

Parameter OBJECTNAME = "Demo.ToTicketAppRecordMap.Record";

/// Internal helper method to perform parse of incoming data
ClassMethod GetRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pGetTopFields As %Boolean, pTimeout As %Numeric, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status [ Internal, Private ]
{
	set tStatus = $$$OK
	if pLabelFound { set tRecLabel = "" } 
	else { set tRecLabel = "" } 
	set tStatus = ..chunkRecord(pStream, .tRecordData, .tCharCount, "", pTimeout, $char(13,10), tRecLabel, .pLookAhead, "")
	if $$$ISERR(tStatus) quit tStatus
	set tMaxLocal = $$$MaxLocalLength
	set tRecordData("charcount") = +$get(tCharCount)
	set tCurrChunk = 1
	set tTopPiece = 1
	set tCurrSep = 1
	set tStrings = 1
	set tCurrString = ""
	set tSeps = $listbuild($char(44))
	if '$data(tRecordData(tCurrChunk, "block")) {
		set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	else {
		set tCurrString = tRecordData(tCurrChunk)
		set tCurrPiece = 1
	}
	do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	if pGetTopFields {
		set pObject.LicensePlate = tCurrString
	}
	if '$data(tRecordData(tCurrChunk, "block")) {
		set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	if pGetTopFields {
		set pObject.Date = tCurrString
	}
	if '$data(tRecordData(tCurrChunk, "block")) {
		set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	if pGetTopFields {
		set pObject.Time = tCurrString
	}
	if '$data(tRecordData(tCurrChunk, "block")) {
		set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	if pGetTopFields {
		set pObject.Intersection = tCurrString
	}
	quit tStatus
}

/// Internal helper method to output object to a stream
ClassMethod PutRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pHasTopFields As %Boolean, ByRef pPadArray As %String) As %Status [ Internal, Private ]
{
	set tStatus = $$$OK
	do pStream.Write($select(pHasTopFields: pObject.LicensePlate,1: ""),0)
	do pStream.Write($char(44) _ $select(pHasTopFields: pObject.Date,1: ""),0)
	do pStream.Write($char(44) _ $select(pHasTopFields: pObject.Time,1: ""),0)
	do pStream.Write($char(44) _ $select(pHasTopFields: pObject.Intersection,1: ""),0)
	do pStream.Write($char(13,10), 0, .tStatus)
	if $$$ISERR(tStatus) quit tStatus
	quit tStatus
}

ClassMethod GetGeneratedClasses(Output pClasses As %String) As %Status
{
	kill pClasses
	set pClasses("Demo.ToTicketAppRecordMap.Record")=""
	set pClasses($classname())=""
	quit $$$OK
}

ClassMethod getIdentifier() As %String [ CodeMode = expression ]
{
""
}

ClassMethod getType() As EnsLib.RecordMap.Model.DataType.RecordType [ CodeMode = expression ]
{
"delimited"
}

XData RecordMap [ XMLNamespace = "http://www.intersystems.com/Ensemble/RecordMap" ]
{
<Record xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="Demo.ToTicketAppRecordMap" type="delimited" char_encoding="UTF-8" targetClassname="Demo.ToTicketAppRecordMap.Record" recordTerminator="\x0d\x0a">
  <Separators>
    <Separator>,</Separator>
  </Separators>
  <Field name="LicensePlate" datatype="%String" sqlColumn="2">
  </Field>
  <Field name="Date" required="0" ignored="0" datatype="%String" sqlColumn="3" repeating="0">
  </Field>
  <Field name="Time" required="0" ignored="0" datatype="%String" sqlColumn="4" repeating="0">
  </Field>
  <Field name="Intersection" datatype="%String" sqlColumn="5">
  </Field>
</Record>
}

}
