# Samples-Integration-RedLights

This example contains a sample integration solution within InterSystems IRIS that shows business orchestration and routing, easy consumption of data from files, and data transformations. It consumes data about red light violations from traffic cameras and routes the data to an archival system and a ticket application as appropriate.

For full exercise steps and a video that further explains this feature, see the [Interoperability QuickStart](https://learning.intersystems.com/course/view.php?name=Interop%20QS).


## Run the sample
 
1) Open the Management Portal, a user interface that allows you to configure your integration solutions. 

* Using the menu at the top, choose `InterSystems > InterSystems IRIS Management Portal`. 
* Then in the Management Portal, select `Interoperability > Configure > Production > Go`. 

> This shows the Demo.RedLights integration solution that consumes data from traffic cameras (RealTimeRedLightViolation), routes and transforms the data (Demo.TicketBPL), and sends data out to both the archive application (To_Archive) and ticket application (To_TicketApplication).

2) When provisioning this lab environment, the Demo.RedLights integration solution consumed a .txt file on the file system. View how this message traversed the integration solution using the Message Viewer.

* Select `Menu > Message Viewer`.
* Choose the top message with the source of `RealTimeRedLightViolation`.
* Select `Trace > View Full Trace`.

> This opens what is known as the Visual Trace and allows you to see how the data is passed between InterSystems IRIS production components. All messages are stored to the database, which makes troubleshooting and auditing easy.

3) **OPTIONAL:** Pass another message in by going back to the provided IDE and copying `LocalRedLightViolations1-copy.csv` from the `shared/Samples-Integration-RedLights/data/SampleFiles` folder to the `shared/Samples-Integration-RedLights/data/In` folder.

## Keep Exploring

* Want to follow the full exercise steps? See the [Interoperability QuickStart](https://learning.intersystems.com/course/view.php?name=Interop%20QS). 
* Want to create a new integration solution from scratch? Follow the [Connecting Systems Using Interoperability Productions](https://irisdocs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=AFL_productions) First Look.


