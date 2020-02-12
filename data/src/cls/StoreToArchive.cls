Class Demo.StoreToArchive Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method StoreToArchive(pRequest As Demo.RedLightViolationsRecordMap.Record, Output pResponse As Ens.Response) As %Status
{

	$$$TRACE("Stored to archive")
	quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Demo.RedLightViolationsRecordMap.Record"> 
		<Method>StoreToArchive</Method>
	</MapItem>
</MapItems>
}

}
