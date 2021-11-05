# Nicholas Boleky


## Build Tools & Versions Used
This was developed on _Xcode 12.1_ using _Swift 5_


## Approach

In this application I had to follow a set of instructions assigned to me as a test of my basic iOS skills. I was tasked with building an application that could search through events available in an API. Each event could be clicked on to bring up a detail view, and events had a 'favorite' feature that could be toggled by the user and would be displayed if the event was searched for again in the future.
The organizational approach I took was MVC. I find that MVC is extremely friendly towards small projects such as this and its an organizational structure I am comfortable with. 


## Findings / Notes
* I had a lot of fun playing with this project and hashing out the logic for the favorite button.

* I really had no idea how the time works with this API. The documentation doesnt explain the difference between their local time vs UTC time and no matter which I used I was getting back events at bizzare start times like 1AM for a football game... 


## How Long I Spent on the Project
Aprox 8 hours in total. Some really small things ended up taking me longer than I would have hoped. The date formatting was a little new for me and probably took an hour in itself. I think I spent 30 minutes just trying to figure out how to make the status bar white instead of the black default. I spent at least 45 minutes to sign up and get familiar with the API and run some test calls on postman. The logic with the favorite button took me some time to work out and even once I figured out how I wanted to do it I had to spend longer figuring out how to wire the UI up with it. The easiest bit was actually making the network calls since I have experience with this. 

## Code That Was Already Written
I did reference previous projects and adapted the network call functions from them into this project. I also reused my error enums/alert controller because I find them to be useful in communicating to the user some sense of what went wrong. 

## If I Had More Time
* I really wantto learn how to implement XCUnit tests to this project. Testable code is important but I have been prioritizing other areas of my curriculum. 
* I would love to go back and made the search functionality work while the user was typing instead of after pushing enter. In the documentation I found that the UISearchBar Delegate has a function called  searchBarTextDidEndEditing that I think would handle this.
* Swift has a new way to handle network calls using combine and I would like to start implementing that into my Network calls in the future.

## Final Thoughts
* I get very excited to hear feedback because I know I am new and I can always improve. Your input is really valuable to me. I hope to hear from you soon!
