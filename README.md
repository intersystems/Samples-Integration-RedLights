# Samples-Integration-RedLights
This repository contains sample red light violation data and the scripts to load it into your InterSystems IRIS instance. It is used in the Interoperability QuickStart which can be found on the InterSystems Learning site: https://learning.intersystems.com/course/view.php?name=Interop%20QS
The main goal is to show the benefits of integration within InterSystems IRIS Data Platform such as business orchestration, record mapper, data transformations.

---

## GET CONNECTED: Reset your password and get connection information
This sample assumes you already have an instance. If you do not yet have one, you can visit: [Get InterSystems IRIS](https://learning.intersystems.com/course/view.php?name=Get%20InterSystems%20IRIS).

---

## LOADING DATA: For instances running in GCP, Azure, or AWS Community Edition

1) Get the sample data and run the setup scripts
	
	`iris load https://github.com/intersystems/Samples-Integration-RedLights`

## LOADING DATA: Using InterSystems Learning Labs and GCP, Azure, or AWS Evalution Editions

This sample is already pre-loaded in these instances.

## LOADING DATA: Using a local instance

1) Clone this repository: `git clone https://github.com/intersystems/Samples-Integration-RedLights`
2) Either create a production-enabled namespace or make USER production-enabled running in InterSystems Terminal: 
	`do ##class(%Library.EnsembleMgr).EnableNamespace("USER")`
3) Navigate to System Explorer > Classes and import data/EndStateProduction.xml.
4) Navigate to Interoperability > Production > Production Configuration and open the Demo.RedLights production.
5) Change the File Path for RealTimeRedLightViolation to <repo home>/data/In, Archive Path to <repo home>/data/SampleFiles/ and the File Path for To_TicketApplication to <repo home>/data/Out. Don't forget to click Apply to save the changes for each.
6) Start the production using the Start button at the top.

---
## TAKE A LOOK AT THE DATA
 
1) Open the Management Portal > Interoperability > Choose the USER namespace > Configure > Production > Go.
2) Open Demo.RedLights (if its not already open) and start the production using the Start button at the top if it is not yet started.
3) In the Management Portal, select Menu > Message Viewer and view the message that was passed in when the production started.
4) Click View Full Trace to see how the message has been processed.
5) OPTIONAL: Pass another message in by copying LocalRedLightViolations1-copy.csv from the <repo home>/data/SampleFiles folder to the <repo home>/data/In folder.