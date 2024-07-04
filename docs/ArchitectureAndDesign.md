
## Architecture and Design
The architecture of a software system encompasses the set of key decisions about its overall organization. 

A well written architecture document is brief but reduces the amount of time it takes new programmers to a project to understand the code to feel able to make modifications and enhancements.

To document the architecture requires describing the decomposition of the system in their parts (high-level components) and the key behaviors and collaborations between them. 

In this section you should start by briefly describing the overall components of the project and their interrelations. You should also describe how you solved typical problems you may have encountered, pointing to well-known architectural and design patterns, if applicable.

### Logical architecture
We decided to use a layered architecture that resembles MVC (Model, View, Controller), using 3 layers: the PartyLander UI (User Interface), responsible to display the information to the screen, the PartyLander Business Logic, responsible for the app's back-end, and the Partylander Database Schema, responsible for storing the app's information.
Besides that, we also use an external layer composed by 3 Flutter plugins that use the Google Calendar API (in order to let the users sync their data to Google Calendar), the Google Maps API (to let the users see the events' locations) and the Google Sign-In API (for it to be possible to create accounts and login using only a Google Account). 

![LogicalView](https://github.com/FEUP-LEIC-ES-2022-23/2LEIC01T3/blob/main/images/Logical_view.png)

### Physical architecture
Our project's physical architecture can be described by its components and how they are deployed.
Our components are
#### PartyLander Mobile App:
    We're developing our app in Flutter, an open-source framework created by Google in 2015.
    
### PartyLander Server Machine:
    Our database will be hosted in this machine. Using the Firebase API, we're able to store the information of our users and events.
    
### Google Service Machine:
    For it to be possible for us to create accounts only using Google Accounts, to see the events' locations and to sync our in-app calendar with Google Calendar, we use 3 different API's from Google. These API's will be used through Flutter plugins, for it to be easier to implement.

![DeploymentView](https://github.com/FEUP-LEIC-ES-2022-23/2LEIC01T3/blob/main/images/PhysicalArchitecture.png)



### Vertical prototype
We have implemented a very initial prototype of what we want the app to look like. The [APK](https://github.com/FEUP-LEIC-ES-2022-23/2LEIC01T3/blob/main/app/partylander.apk) can be installed and is currently only optimized for the Pixel 4 device.
The source code for this initial vertical prototype can be found [here](https://github.com/FEUP-LEIC-ES-2022-23/2LEIC01T3/tree/main/app/partylander). 

Currently, only a hard-coded version of the Following Page is available, as well as an event that is also completly hard-coded (The first event on the page is clickable on the "See more" text). To return from the Event Page to the Following Page, you can click the application logo.
![FollowingPagePrototype](https://github.com/FEUP-LEIC-ES-2022-23/2LEIC01T3/blob/main/images/Following_Page_Prototype.png)
![EventPagePrototype](https://github.com/FEUP-LEIC-ES-2022-23/2LEIC01T3/blob/main/images/Event_Page_Prototype.png)
