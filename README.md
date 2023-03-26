# PICTURE OF THE DAY

## Video Demo: <https://youtu.be/7v_doGKIb_o>
  
## Description:
#### What the project is
My project is a Salesforce Lightning Web Component (LWC) which utilizes an api from NASA to display an image or video according to a specified date inputted from the user. Every image and/or video the user looks up is also saved as a custom object for later viewing. I have also created a scheduled task to run daily to automatically save the new picture/video.
  
#### Files/Folders
Org Configuration - Contains a word document with instructions on setting up the Salesforce instance. This is not all inclusive, and you may need to make other configuration changes which I did not.

Screenshots - Contains screenshots of completed LWC
  
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
