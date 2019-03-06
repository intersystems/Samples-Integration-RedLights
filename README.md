# Samples-Integration-RedLights
This repository contains sample red light violation data and the scripts to load it into your InterSystems IRIS instance. It is used in the Interoperability QuickStart which can be found on the InterSystems Learning site: https://learning.intersystems.com/course/view.php?name=Interop%20QS
The main goal is to show the benefits of integration within InterSystems IRIS Data Platform such as business orchestration, record mapper, data transformations.


## GET CONNECTED: Reset your password and get connection information
This sample assumes you already have an instance. If you do not yet have one, you can visit: [InterSystems Labs](https://learning.intersystems.com/course/view.php?name=Java%20Build), [Microsoft Azure](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/intersystems.intersystems-iris-single-node), [Google Cloud Platform](https://console.cloud.google.com/marketplace/details/intersystems-launcher/intersystems-iris), or [Amazon Web Services](https://aws.amazon.com/marketplace/pp/B07KVYZYT9).

If you have Azure, GCP, or AWS:
1) Reset the default passwords

	`iris password`
		This will ask you for your new password, and will reset the password for all default user accounts.

2) Check the status of your iris instance

	`iris status`
		This will show the current status of the InterSystems IRIS instance.
		
3) Get your connection information

	`iris info`
		This will show the URL for the Management Portal. Follow Interoperability > USER namespace > Configure > Production to view the production.

## LOADING DATA: For instances running in GCP, Azure, or AWS

1) Get the sample data and run the setup scripts
	
	`iris load https://github.com/intersystems/Samples-Integration-RedLights`

## LOADING DATA: Using InterSystems Learning Labs

1) In the provided IDE, select Terminal > New Terminal. Clone the repo: `git clone https://github.com/intersystems/Samples-Integration-RedLights`
2) From the Management Portal > Home, select Terminal under Links. Make the USER namespace production-enabled by running: `do ##class(%Library.EnsembleMgr).EnableNamespace("USER")`
3) Navigate to System Explorer > Classes and import data/EndStateProduction.xml.
4) Navigate to Interoperability > Production > Production Configuration and open the Demo.RedLights production.
5) Change the File Path for RealTimeRedLightViolation to <repo home>/data/In, Archive Path to <repo home>/data/SampleFiles/ and the File Path for To_TicketApplication to <repo home>/data/Out. Don't forget to click Apply to save the changes for each.
6) Start the production using the Start button at the top.

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
2) Select RealTimeRedLightViolation business service and notice the file location noted. Copy LocalRedLightViolations1.csv to this folder (or change the File Path to a folder you have, if needed).
3) In the Management Portal, select Menu > Message Viewer and view the message that has been passed in.
4) Click View Full Trace to see how the message has been processed.


