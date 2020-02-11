/// RECORDMAP: Generated from RecordMap 'Demo.ToTicketAppRecordMap'
/// on 2019-01-17 at 17:15:08.928 [2019-01-17 22:15:08.928 UTC]
/// by user SuperUser
Class Demo.ToTicketAppRecordMap.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property LicensePlate As %String [ SqlColumnNumber = 2 ];

Property Date As %String [ SqlColumnNumber = 3 ];

Property Time As %String [ SqlColumnNumber = 4 ];

Property Intersection As %String [ SqlColumnNumber = 5 ];

Parameter RECORDMAPGENERATED = 1;

}
