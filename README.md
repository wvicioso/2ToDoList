## Site Overview

We'll be building a ToDoList site.

The required functionality of the site will be described in more detail in the Releases section below.

### All Users

  * Browse all lists

### Unregistered Users

  * Register a new account

### Registered Users

  * Sign in
  * Sign out
  * Create a new list
  * Add a new task to a list
  * Have a profile showing completed and uncompleted tasks

## Release 0: User Registration
 * Users will need to register for a new account. The form should contain email, username, and password. The username must be unique.
 
 * If constraints are met, the user should be considered logged in and redirected to the home page
 
 * If either constraint is not met, the user should see the registration form and error messages

## Release 1: Login/Logout
 * Create a link on the login page, where a user can enter email and password.
 * If email and password match a record, then the user should be considered logged in and redirected to the home page
 * If either constraint is not met, the user should see the login form and error messages


## Release 2: CRUD'ing a Resource

### Creating List
1. The registered user is signed in:
 * A user can create a new list with a name. (Add ajax for this part and preserve previous functionality)
 * A user can modify the name of lists.

### Creating Task:
1. The registered user is signed in:
   * For existing lists, a user can add new tasks with a description and a status(completed/uncompleted). The default value for status `false`. (You can use checkboxes for marking a task completed)
   * A user can delete a task. (Add ajax for this part and preserve previous functionality)

   * A user can modify the task. (Add ajax for this part and preserve previous functionality)
   
  
### Profile Page:
 * On profile page user can see all of their lists.

## Additional functionality
 * When a user creates a new Ttsk, they can add a due date for when a task should be completed. If the date is overdue and status of the task still `false` (uncompleted), then show message near task. 'task is overdue'
 * Add tags to a task
