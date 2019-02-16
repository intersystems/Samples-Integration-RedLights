# Samples-Integration-RedLights
This repository contains sample red light violation data and the scripts to load it into your InterSystems IRIS instance. It is used in the Interoperability QuickStart which can be found on the InterSystems Learning site: https://learning.intersystems.com/course/view.php?name=Interop%20QS
The main goal is to show the benefits of integration within InterSystems IRIS Data Platform such as business orchestration, record mapper, data transformations.


## GET CONNECTED: Reset your password and get connection information
This sample assumes you already have an instance. If you do not yet have one, you can visit: [InterSystems Labs](https://learning.intersystems.com/course/view.php?name=Java%20Build), [Microsoft Azure](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/intersystems.intersystems-iris-single-node), [Google Cloud Platform](https://console.cloud.google.com/marketplace/details/intersystems-launcher/intersystems-iris), or [Amazon Web Services](https://aws.amazon.com/marketplace/pp/B07KVYZYT9).

Data is already preloaded into InterSystems Labs. If you have Azure, GCP, or AWS:
1) Reset the default passwords

	`iris password`
		This will ask you for your new password, and will reset the password for all default user accounts

2) Check the status of your iris instance

	`iris status`
		This will show the current status of the InterSystems IRIS instance
		
3) Get your connection information

	`iris info`
		This will show the URL for the Management Portal. Follow System Explorer > SQL to view schemas or execute queries.

## LOADING DATA: These steps are written for instances running in Google Cloud Platform, Azure, or AWS

1) Get the sample data and scripts
	
	`iris load https://github.com/intersystems/Samples-Integration-RedLights

---
## TAKE A LOOK AT THE DATA
 
1) Open the Management Portal > Interoperability > Choose the Interop namespace > Configure > Production > Go.
2) Select RealTimeRedLightViolation business service and notice the file location noted. Copy LocalRedLightViolations1.csv to this folder (or change the File Path to a folder you have, if needed).
3) In the Management Portal, select Menu > Message Viewer and view the message that has been passed in.
4) Click View Full Trace to see how the message has been processed.


