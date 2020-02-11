/// 
Class Demo.WhitelistRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="Demo.TicketBPL.Context" production="">
<ruleSet name="Check if Whitelisted Rule" effectiveBegin="" effectiveEnd="">
<rule name="Whitelisted" disabled="false">
<when condition="(CarType=&quot;ambulance&quot;)||(CarType=&quot;police&quot;)||(CarType=&quot;firetruck&quot;)">
<return>1</return>
</when>
</rule>
<rule name="Proceed as usual" disabled="false">
<when condition="1">
<return>0</return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
