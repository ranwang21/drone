## Installation / Deployment
##### For windows system
For testing:
- Create a folder `isidrone/products/img` to your prefered location, stock all the images of products inside
- Create an environement variable pointing to the above location

**If you are Intellij user**
To test the project, you should: 
- add the external images folder to Tomcat deployment:
Edit Tomact Configurations -> Tab Deployment -> Add -> External Sources -> Choose the products images folder

![](userGuide/startup.PNG)

- Tab `Startup/Connection`, choose `pass environement variables` and add an environement variable with the name `CATALINA.BASE` and value pointing to your Tomcat root folder

![](userGuide/deployment.PNG)

- Apply all changes and rebuild the project

##### For Linux system
TBD