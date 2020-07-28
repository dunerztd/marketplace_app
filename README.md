*** CLEARLY define what you want to achieve and FOCUS on that and ONLY that ***

# T2A2 Marketplace App


Github link: http   
Heroku link: http

---

## Problem
Finding a guitar teacher can be difficult when starting out or for when you have a particular style/skill in mind. As we are currently in isolation due to COVID-19, many people are fulfilling a long held wish to learn a musical instrument and are reaching for a guitar.
This marketplace app will give you the ability to find a guitar teacher based on a particular style you want to play with teachers listed by their specialty. As we are unable to be in close contact, the app will give students the ability to purchase lessons blocks and set up lessons over a webcam. This has the advantage of location not being a problem plus opening up the potential to find students/teachers anywhere in the globe.

---

## Description

### Purpose

The purpose of this marketplace is to connect guitar teachers with students looking to learn the guitar in a specific style and to conduct the lesson over a webcam.

### Functionality/Features

- Guests can look through teacher profiles to get a feel of whats on offer.
- People who want to purchase a lesson can sign up. The student view displays all the lessons which the user has paid for with details to contact the teacher.
- Teacher profiles can be filtered according to style and also specifically by a teachers style speciality.
- Students can purchase a lesson block through Stripe by a simple click from the profile page.
- The same user account combines both student and teacher capabilities. From the student view, clicking 'become a teacher' from the menu directs the user to a form. Information such as name, availability, price, lesson length, a biography and additional teacher information cna combined with a profile photo to complete the teacher profile.
- Upcoming teaching lessons are displayed in the teacher view along with links to view and edit their profile.

### Sitemap

![](./docs/sitemap/sitemap.png)

### Screenshots



### Target Audience

The target audience for this marketplace is students wanting to learn the guitar in a specific style and teachers who are knowledgeable or experienced in a given style.

### Tech Stack

- **Front-end:** HTML, SCSS, Embedded Ruby, Javascript, jQuery, PopperJS, Bootstrap
- **Back-end:** Ruby, Ruby on Rails
- **Database:** Postgresql
- **Deployment:** Heroku
- **Storage:** AWS S3
- **Utilities:** Stripe, Devise, Cancancan

---

## User Stories

### Guest

- As a Guest, I want to see if there are any guitar teachers who specialise in playing jazz so I can become a jazz guitarist.
- As a Guest, I want to compare all the teachers available so I can find the best price.
- As a Guest, I want to see what the site has to offer before I make an account.


### Student

- As a Student, I want to book in a guitar lesson so I can start learning guitar.
- As a Student, I want to see all my upcoming lessons so I can be prepared.
- As a Student, I want to know my payments details are secure so I can focus on my guitar lessons.
- As a Student, I want detailed information on all the teachers so I can make an informed decision.
- As a Student, I want a way to contact a teacher directly once a payment is made so we can set up a time to conduct the lesson.

### Teacher

- As a Teacher, I want to teach guitar so I can earn some income.
- As a Teacher, I want to create a profile which really informs my prospective students.
- As a Teacher, I want to add a photo of myself to my profile so my students can get to know me a little better.
- As a Teacher, I want to see all my upcoming lessons so I can plan my week.
- As a Teacher, I want to see to able to contact my students so we can set up a lesson or discuss any issues.

---

## Wireframes

### Home

Full Size  |  Mobile
---------  |  --------
![](./docs/wireframes/home.png) | ![](./docs/wireframes/home_mobile.png)


### Show

Full Size  |  Mobile
---------  |  --------
![](./docs/wireframes/show.png) | ![](./docs/wireframes/show_mobile.png)


### Login

Full Size  |  Mobile
---------  |  --------
![](./docs/wireframes/login.png) | ![](./docs/wireframes/login_mobile.png)

### Sign Up

Full Size  |  Mobile
---------  |  --------
![](./docs/wireframes/sign_up.png) | ![](./docs/wireframes/sign_up_mobile.png)

### Student Navbar

Full Size  |  Mobile
---------  |  --------
![](./docs/wireframes/student_navbar.png) | ![](./docs/wireframes/student_navbar_mobile.png)

### Student Page

Full Size  |  Mobile
---------  |  --------
![](./docs/wireframes/student_page.png) | ![](./docs/wireframes/student_page_mobile.png)

### Student Show

Full Size  |  Mobile
---------  |  --------
![](./docs/wireframes/student_show.png) | ![](./docs/wireframes/student_show_mobile.png)

### Teacher Navbar

Full Size  |  Mobile
---------  |  --------
![](./docs/wireframes/teacher_navbar.png) | ![](./docs/wireframes/teacher_navbar_mobile.png)

### Teacher Page

Full Size  |  Mobile
---------  |  --------
![](./docs/wireframes/teacher_page.png) | ![](./docs/wireframes/teacher_page_mobile.png)

### Teacher Profile Form

Full Size  |  Mobile
---------  |  --------
![](./docs/wireframes/teacher_profile_form.png) | ![](./docs/wireframes/teacher_profile_form_mobile.png)

---

## ERD

![](./docs/erd/erd.png)

---

## High Level Components
(Precisely explains and shows understanding of the different high-level components of the app)

Guest

- can search profiles my filtering them according style. achieve my clicking a range tick boxes. it lists all teacher profiles
- these profile can be filtered further by clicking 'speciality only' at the top of the home page. it only lists profiles, by style, a teacher has selected as their speciality, being the style they the most experienced and knowledgeable in.
- can look at individual profiles
- doesn't have a an account
- can't purchase a lesson

Student

in addition to what a guest can do a student can do the following:
- must sign up for an account and login.
- is able to make purchases by clicking the 'purchase a lesson' button on a profile show page.
- has a student view, selected from the drop-down menu. The student can view all the lesson they have paid for
- has the ability to be a teacher with the same account by selecting 'become a teacher' from the drop down menu.

Teacher

in addition to what a student can do, a teacher can also do the following:
- create a teacher profile which includes selecting their teaching styles and style speciality. they can also add a profile image.
- has access to a 'teacher' page which displays upcoming teaching lessons and links to view and edit their profile.


Booking

- a booking is made when a student purchases a lesson from a teacher profile.
- the user pays through the online payment system Stripe.
- The booking shows up in the both student and teacher views. The views contain basic booking information about the respective parties.

---

## Model Relationships
## Describe your projects models in terms of the relationships (active record associations) they have with each other
(Complete discussion of the project’s models with an understanding of how its active record associations function)


User:
- has_one Teacher, a Teacher belongs_to a User
- has_many Bookings, a Booking belongs_to a User

In addition to these associations, a User can have one Teacher who can have many Styles, many Bookings and one Image.
Through Users association with Booking, Users can have many Bookings who can have a Teacher who has many Styles and one Image.

Teacher:
- belongs_to User, a User has_one Teacher
- has_many Bookings, a Booking belongs_to a Teacher
- has_many Styles, a Style belongs_to a Teacher
- has_one_attached image

In addition to these associations, A Teacher has one User who has many Bookings and a Teacher has many Bookings who has one User.

Booking:
- belongs_to a User, a User has_many Bookings
- belongs_to a Teacher, a Teacher has_many Bookings

The Booking associations of being between the User and Teacher models is an important one to the app. It allows a single user account to be both a Teacher and Student. Through Bookings we can find out information on the student through the User association. But also through the Teacher association, we can find information on the User associated with the teacher profile.

Style:
- belongs_to a Teacher, a Teacher has_many Styles

Through the Style models association with the Teacher model, a Style can have one Teacher who has one User and a Style can have one Teacher who has many Bookings who has one User. A Style can have one Teacher who has one Image.

---

## Database Relations
(Discuss the database relations to be implemented)
(Provides coherent discussion of the database relations, with reference to the ERD)

---

## Database Schema

---

## Planning

- using trello
- came up with 2 main ideas for the app. went with guitar lesson app.
- sketching out thoughts/ideas to start
- tested a few ideas out first to see if they were possible. Figured out how to apply a javascript drop down menu with Bootstrap pretty quickly. Did a lot of research in scheduling/appointments. Looked at gems and videos on how to do this. Came up with an OK solution of how to accomplish it.
- creating rough idea of how a guest/student/teacher would navigate through the app (user stories to help with this)
- created wireframes then ERD.
- decided against scheduling/appointments as this seen as an extra function and the user can just buy lesson 'blocks'. The actual lesson time can be figured out between the student and teacher.
- - Minimum Viable Product with minimal front-end as coding aim. If time permits add extra functionality and/or improve front-end.
- Finish all documentation (as much as possible) before start coding.
- have roughly 2 weeks to complete the coding.

- in trello
- first listed all mandatory tasks as per assignment outline (requirements/rubric)
- focused on finishing all the documentation tasks first.
- Will add all coding tasks once documentation tasks completed.

---

## Third Party Services

**Bootstrap:** Front-end framework for HTML, CSS and Javascript. Design templates for layouts, buttons, forms and other components.

**jQuery:** Javascript library used by Bootstrap.

**PopperJS:** Javascript library positioning engine used by Bootstrap. Will be used for the drop-down menu.

**Devise:** A rails gem for user authentication. Creates a simple solution for users to sign-up and login with an email address and encrypted password.

**Cancancan:** A rails gem for authorisation which controls what resources users have access to.

**Stripe:** Payment processing software for online payments.

**Ultrahook:** Enables webhooks to be received behind a firewall. Provides information back to the web app when a Stripe payment is made.

**AWS S3:** Provides cloud data storage. Used in conjunction with Active Storage to upload images for teacher profiles.

**Faker:** Generates fake data for populating databases and aids in application development.