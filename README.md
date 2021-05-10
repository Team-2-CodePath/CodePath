Original App Design Project
===


# To Do List

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This app will allow people to input what they want to do for the day or plan out the rest of year, month, etc.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Productivity Mobile Apps / Utility Mobile Apps
- **Mobile:** This app would be primarily developed for mobile use. However, we are planning to implement a log in feature that will allow the user to use this application on other mobile devices if they wish to.
- **Story:** Allows user to make tasks for the day, month, year etc. Visuals can be customized to the users liking or taste. Log in feature will be implemented in the future as well.
- **Market:** Anybody could use this app. People with jobs or in school would use this app the most.
- **Habit:** This app could be used all the time wether it be to stay motivated or to just plan ahead. 
- **Scope:** As we mentioned before, the log in feature could be implemented. Users could be able to share their to do lists with others. Templates could be created by others and shared in some kind of store or main in page.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Users can log in to access previous to do lists or the to do lists can be saved to their device
* User can possibly choose from a template
* User can make a new list or look at their previous ones
* ...

**Optional Nice-to-have Stories**

* [fill in your required user stories here]
* Log in features
* calendar

### 2. Screen Archetypes

* Login Screen
  * User can login into their account
  * User can choose to login as a guest or personal account

* Registration Screen
  * User can create a new account
  
* Creation 
 * User can create a new task, edit, and delete 
 * User can mark the task as 'done'
 
* Calendar 
  * User can visualize dates or events into calendar form
  * User can see the "to-do" list in the calendar 
  * Categorize to-do task by colors based on the task

* Detail 
  * User can find information and tips on how to be more productive

* Settings
  * User can configure app options and edit their profile

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Settings
* Calendar
* ToDo Lists
* Note (Like pop up stickers)

Optional:
	* Resources

**Flow Navigation** (Screen to Screen)

* The user can choose either to sign up as a guest or create an account (will go to ToDo List page afterwards)
* ToDo Lists -> Our main page showing the to do list. With a bar that provided the option to add more to do lists. (can navigate to setting and calendar and log out)
	* The user can add the due date to each to do lists that will be show on calendar tab.
	* The user can add priority on each tasks (P1, P2, P3). (The list will be sorted depending on the priority and due dates)
	* The user can add category to the ToDoLists
* Settings -> toggle settings (the user can update their email, the font, the size of the letters)
* Calendar -> Showing a calendar with to do lists based on the due date 


## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://i.imgur.com/DCAunbk.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models

Profile
| Property     		    | Type      | Description   			|
| ------------------------- | ----------|---------------------------------------| 
| user_id      		    | String    | unique id for each user		|
| user_email   		    | String    | user email address			|
| user_image   		    | File      | user profile picture		        |
| notification 		    | Boolean   | notification can toggle (on/off)  	|

Tasks
| Property     		    | Type      | Description			    |
| ------------------------- | ----------|-----------------------------------|
| task_id      		    | String    | unique id for the tasks	    |
| task_description  	    | String    | description of the tasks 	    |
| task_start_date           | DateTime 	| start date of the tasks 	    |
| task_due_date             | DateTime  | end date of the tasks       	    |
| task_priority		    | String    | task priority			    |

### Networking

(Read/GET) Query all tasks based on the end date
```
let query = PFQuery(className:"Tasks")
query.whereKey("task_end_date", equalTo: currentDate)
query.order(byDescending: "myPriority")
query.findObjectsInBackground { (tasks: [PFObject]?, error: Error?) in
   	if let error = error { 
      		print(error.localizedDescription)
   	} else if let posts = posts {
      		print("Successfully retrieved all task due today")
  	// TODO: Do something with tasks...
	}
}
```

(Create/POST) Create a new task
```
let myTask = PFObject(className:"Task")
```

(Delete) Delete task
```
PFObject.deleteAll(inBackground: objectArray) { (succeeded, error) in
	if (succeeded) {
		// task successfully deleted
	} else {
		// there was an error in deleting
	}
}
```
- [OPTIONAL: List endpoints if using existing API such as Yelp]

## Video Walkthrough

Here's a walkthrough of our progress on the project so far.
Sprint 10

<img src='http://g.recordit.co/ZP9RW5J7Qv.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

Sprint 11

![](https://i.imgur.com/80Mc7XN.gif)

Sprint 12

![](https://i.imgur.com/5WQl6jX.gif)

Sprint 13

![](https://i.imgur.com/4hvp44G.gif)
