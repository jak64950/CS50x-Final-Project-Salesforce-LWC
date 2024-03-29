# PICTURE OF THE DAY

## Video Demo: <https://youtu.be/7v_doGKIb_o>
  
## Description:
#### What the project is
My project is a Salesforce Lightning Web Component (LWC) which utilizes an api from NASA to display an image or video according to a specified date inputted from the user. Every image and/or video the user looks up is also saved as a custom object for later viewing. I have also created a scheduled task to run daily to automatically save the new picture/video.
  
#### Files/Folders
Org Configuration - Contains a word document with instructions on setting up the Salesforce instance. This is not all inclusive, and you may need to make other configuration changes which I did not.

Screenshots  
Lightning Web Component allowing user to enter date
![LWC](https://github.com/jak64950/CS50x-Final-Project-Salesforce-LWC/blob/main/Screenshots/NASA_Lightning_Page_Image_Tab.png?raw=true)

Picture displayed if date returns data
![Picture of the Day](https://github.com/jak64950/CS50x-Final-Project-Salesforce-LWC/blob/main/Screenshots/POD.png?raw=true)

All lookups stored in a custom object
![Custom Objects](https://github.com/jak64950/CS50x-Final-Project-Salesforce-LWC/blob/main/Screenshots/NASA_Viewed_Images_Tab.png?raw=true)

Data stored in a custom object
![Custom Object Data](https://github.com/jak64950/CS50x-Final-Project-Salesforce-LWC/blob/main/Screenshots/Custom_Object_Data.png?raw=true)
  
classes - Contains all the Apex classes used to create the functioning LWC (uploaded directly from VSCode).
1) NASAImageDataController will make a callout to grab the info from the NASA api and store it into a custom object
2) NASAImageSchedulerHelper will run NASAImageDataController to save the image/video of the day
3) NASAImageScheduler will run NASAImageSchedulerHelper (needed as callouts cannot be scheduled directly)
4) The rest of the classes are unit tests of the above files. It is important to note that callouts cannot be made in test files, hence why NASAImageDataControllerMock is needed to "simulate" making a call.
  
lwc - Contains the javascript and html files used to create the LWC (uploaded directly from VSCode). No CSS changes were made.
1) nasaImageComponent.html - Will display the Picture/Video of a user inputted date, or an error if the date is invalid or no item exists
2) nasaImageComponent.js - Calls NASAImageDataController Apex to retrieve data to pass to html

## Improvements
Idea's I was juggling around
1) Utilize different NASA api's and add as new LWC's
2) Fix Video's not auto playing (currently have to use link to access)
3) Add logic to allow user's to enter different date formats
4) Add special keyword to allow user to save every image/video to date in Custom Object

## Helpful Resources
Salesforce has its own documentation covering everything from Apex, Lightning Components, API's, and more. This was an invaluable resource in debugging and generating the code for this project. The documentation can be found at <https://developer.salesforce.com/docs/?pagenum=1>

Other than writing code, this project also requires knowledge of the Salesforce ecosystem in general so that configuration changes inside the organization can be made. The best place to learn how to work in the Salesforce ecosystem would be via Salesforce's own learning platform, Trailhead <https://trailhead.salesforce.com/>

## Biggest Issues
1. There are some nuances with Apex/javascript that I was unfamiliar with which added a few days to the project. In my NASAImageDataController apex file, I initially had `cacheable=true` which is usually recommended, but must be false when upserting the data. Consequently, since it was set to false, the javascript had to call the Apex function via a connectedCallback instead of using wireAdapter.
2. You cannot schedule a callout directly, so I had to create a schedule helper file which would make the callout. This is according to the Salesforce developer documentation anyways, but I still don't have it working. 
3. I cannot get the html to display videos pulled from the API. Not sure if it is bad code, or a permission issue within Salesforce blocking it.
