# Research Laboratory Database

## Developers
Kevin Yang  |  Email: kyang6@stanford.edu  |  Phone:4803160382  |  GitHub: github.com/kyang6

## Description
This application facilitates the discovery of research labs for students at a certain college. The student is presented on the home page with choices of categories. Clicking a category will display all the labs that are under that category. To further filter results, students can search or filter by open positions.

## How to Use
Accounts for principle investigators (pi) can only be created by an admin. To create an admin account first create an account by going to /users/sign_up. Next, open up ruby console and call u = User.last and set u.admin = true then u.save. Now this account will be an admin. The admin panel is located at /admin, from here the admin can quickly add/delete/modify (a/d/m) labs, a/d/m publications, a/d/m projects, and a/d/m users. Admins should create accounts for pi's and then pass on a preset email/login to the pi. On the first login the pi should go to "my profile" located on the top right of the navbar and then change their password. Pi's can modify the details of their lab by navigating to their lab and clicking "edit."

## Tech Stack
Ruby version: ruby 2.0.0p645  
Rails version: Rails 4.2.4  
Authentication: Devise  
Roles: CanCanCan  
Admin Panel: RailsAdmin  
Listings: smart_listing  
Form: simple_form  
Embedded form elements: cocoong  
Frontend: bootstrap and Haml  
Database Development: sqlite  
Database Production: pq  
Deploy: Heroku


## TODO
### Bugs
- adding publications and activities adds multiple at once, and spacing is subsequently messed up
insert image does not save the image file 
- deleting lab prompts notice twice
- when pagination is introduced the col is shifted to the right a little bit

### Improvements
- custom URL
- User_id in admin panel- make it a link
- When exporting and importing labs, publications and projects are not linked to a lab.


Please send bugs to kyang6@stanford.edu


