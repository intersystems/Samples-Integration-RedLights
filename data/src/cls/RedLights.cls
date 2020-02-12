Class Demo.RedLights Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.RedLights" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="To_TicketApplication" Category="" ClassName="EnsLib.RecordMap.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/home/project/shared/Samples-Integration-RedLights/data/Out/</Setting>
    <Setting Target="Host" Name="Filename">Tickets.txt</Setting>
    <Setting Target="Host" Name="RecordMap">Demo.ToTicketAppRecordMap</Setting>
  </Item>
  <Item Name="To_Archive" Category="" ClassName="Demo.StoreToArchive" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="RealTimeRedLightViolation" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="ArchivePath">/home/project/shared/Samples-Integration-RedLights/data/SampleFiles/</Setting>
	<Setting Target="Adapter" Name="FilePath">/home/project/shared/Samples-Integration-RedLights/data/In/</Setting>
    <Setting Target="Adapter" Name="FileSpec">LocalRedLight*</Setting>
    <Setting Target="Host" Name="RecordMap">Demo.RedLightViolationsRecordMap</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Demo.TicketBPL</Setting>
  </Item>
  <Item Name="Demo.TicketBPL" Category="" ClassName="Demo.TicketBPL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
