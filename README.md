# Terrier Assignment

This assignement was built in WSL using:

rbenv v1.3.0

Ruby v3.3.4

Rails v7.2.0

SQLite3 v3.37.2


## Build Instructions

Ensure you have the above dependencies installed. The commands to setup and run the application are:

```
cd ./scheduling_assignment
```
This is the main folder for the application.

```
bundle install --gemfile
```
Install the necessary gems for the app.

```
rake db:reset

rake db:migrate
```
Resets and migrates the database, ensures a clean slate.

```
rake setup:import_all
```
Imports data from the given CSV files (pulled from RailsSchedulingAssignment dir).

```
rails server
```
Launch a local server. Open the local port indicated to view the shedule.


## Approach

The first thing I did after initializing the new project was scaffolding for the three databases. I found this to be a good way to start since it sets up a lot of the boilerplate code I would normally have to write myself.

That was able to setup the databases I needed, so the next step was importing the data into the database. I knew I needed to join these tables later on since the work orders did not contain all of the information that needed to be displayed. To ensure I was able to do this, I created references in each of the models to accomodate for this. As per the requirements document, I created a rake task to go through the CSV files and create new records for the rows in each CSV file. I ran into a few minor problems with this, but I ended up figuring them out after looking into errors and debugging with ```binding.b```.

With the data loaded into the database, it was time to create a web page to display the data. I ran into a problem originally here, because scaffold created three different views, controllers, and models for each of the tables. It took some thinking, but I decided to create one "main" controller and view, where I would pull the data from all three databases. This made things much simpler, especially since this app was meant for a single web page. Once I did this, I deleted a lot of the files created from the scaffold commands to clean up the repository.

I decided to use a grid layout for the body of the page because I am able to overlay the work orders as blocks on top of it, meaning I could keep the rows in the grid the same height. This allowed for a more intuitive view, where a work order block was taller if the duration was longer. This probably took the longest to figure out, especially with all the minor adjustments needed to align everything right.

Finally, I needed to implement the alerting feature. An algorithm for this took a while to think of, because of all the different edge cases there were. I gave each grid element that was associated with a technician an event listener to display the pop-up when clicked on. My thought process was that I could use certain attributes from the grid element that was clicked on to help calculate this, such as the hour and the technician ID. I used that implementation and developed a plan to find the relevent work orders, find their start and end times, and sort through them until I found the location that was clicked, displaying information accordingly.

## Possible Future Improvements

There are a lot of things that could be added to this application, as it is very basic. One thing that can be done is to add indexes to our database. Indexes would help optimize searching through the database. So for example, if someone wanted to search for a specific work order, a B+ index tree could be used to pull that information faster. This would be more of concern in a larger database. Another thing would be a way to create work orders from the site. For example, if a user clicks on an empty spot in the grid, give them the option to request a work order to be made, or the option to make one.

To list a few more, you could:

- Have a page for locations and technicians.
- Create a new technician or location, update the file accordingly.
- Modify the rake task to loop through a directory and pull data from multiple, similar CSV files.
- Have an option to edit work orders (edit button, drag and drop functionality, etc.).
- Scale the HTML elements based on web browser, monitor resolution, and more.
- Improve UI/UX with better display, smoother transitions, etc.