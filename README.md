# terrier_assignment

This assignement was built in WSL using:
    rbenv v1.3.0
    Ruby v3.3.4
    Rails v7.2.0

## Approach

After learning the different ways I could approach this problem, I created a plan to implement this application. After creating the rails project, the first step was setting up the databases. This was done using the scaffold command for each of the three tables given.
Next, I created a rakefile to import the CSV data into the database and their respective tables. I utilized the CSV object provided by rails and created a hash the convert into a new object (WorkOrder, Technician, or Location)

## Possible Improvements

One thing that can be done is to add indexes to our database. Indexes would help optimize searching through the database. So for example, if someone wanted to search for a specific work order, a B+ index tree could be used to pull that information faster. This would be more of concern in a larger database.

