## ISIDrone
This is a e-commerce website selling drones built on JAVA and deployment to both Window/Linux systems, our team was assigned to add more features to this projet. We have worked on Jira for project management, Jenkins for auto-deployment and worked as a team with a product owner to simulate real-enterprise working context.

## Techstack
JAVA, Intellij, Jira, and Jenkins

## Installation / Deployment
##### For windows system (with Intellij)

To test the project, you should: 
- add the external images folder to Tomcat deployment:
Edit Tomact Configurations -> Tab Deployment -> Add -> External Sources -> Choose the products images folder

![](userGuide/startup.PNG)

- Tab `Startup/Connection`, choose `pass environement variables` and add an environement variable with the name `CATALINA.BASE` and value pointing to your Tomcat root folder

![](userGuide/deployment.PNG)

- Apply all changes and rebuild the project

##### For Linux system
To test the project in Linux environment:
- Install tomcat in your linux system
- Create `isidrone/products/img/` at the root base `/`
- Transfer all products images into the above created folder
- cd to `/isidrone/products/` and use command `chown tomcat:tomcat img/` to give access to Tomcat to images
- add context base `<Context docBase="/isidrone/products/img"  path="/ISIDrone/images/products" />` to your Tomcat `server.xml`. This is to allow Tomcat access to the product images folder
- Restart the Tomcat