# CodeigniterRestServiceSample
CodeigniterRestServiceSample

This project is a best example project for Chris Kacerguis's codeigniter-restserver. 

For Installation detail please refer the following link. https://github.com/chriskacerguis/codeigniter-restserver

I have created the sample application for Blood donor management application.

I have created the following API's


 <li> Register Donor</li>
 <li>Login for register User</li>
 <li>Update profile Information for register user</li>
 <li>changePassword for register user</li>
 <li>Forget password for register user</li>
 <li>Get User detail based on userid</li>

  <hr />
  
  <b> Configuration </b>
  
You need to create the database from .sql file avilable inside dbdump folder.

Change the database config information in database.php (Inside config folder) file with your credential

All Rest API controlers are present inside controllers/api folder

I have created 3 controllers for donor management , blood request managemnt and event

Example API URLS

http://host/CodeigniterRestServiceSample/index.php/api/events  - list all blood donation events

http://host/CodeigniterRestServiceSample/index.php/api/donor/user?id=15  -  register donor detail




