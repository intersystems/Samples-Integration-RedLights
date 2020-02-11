/// 
Class Demo.TicketBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Demo.RedLightViolationsRecordMap.Record' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='Whitelisted' type='%Boolean' instantiate='0' />
<property name='CarType' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1000' >
<assign name="Set context" property="context.CarType" value="request.CARTYPE" action="set" xpos='200' ypos='250' />
<rule name='Check if whitelisted' rule='Demo.WhitelistRule'  resultLocation='context.Whitelisted' ruleContext='context' xpos='200' ypos='450' >
</rule>
<if name='If whitelisted' condition='context.Whitelisted = 1' xpos='200' ypos='550' xend='200' yend='800' >
<true>
<trace name='Vehicle whitelisted' value='"Vehicle whitelisted"' xpos='470' ypos='700' />
</true>
<false>
<call name='Call To_TicketApplication' target='To_TicketApplication' async='1' xpos='200' ypos='700' >
<request type='Demo.ToTicketAppRecordMap.Record' >
<assign property="callrequest.%Source" value="request.%Source" action="set" />
<assign property="callrequest.LicensePlate" value="request.LICENSEPLATENUM" action="set" />
<assign property="callrequest.Date" value="request.DATE" action="set" />
<assign property="callrequest.Time" value="request.TIME" action="set" />
<assign property="callrequest.Intersection" value="request.INTERSECTION" action="set" />
</request>
<response type='Ens.Response' />
</call>
</false>
</if>
<call name='Store all to repository' target='To_Archive' async='1' xpos='200' ypos='900' >
<request type='Demo.RedLightViolationsRecordMap.Record' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='Ens.Response' />
</call>
</sequence>
</process>
}

}
