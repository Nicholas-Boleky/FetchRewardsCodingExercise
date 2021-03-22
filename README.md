# Nicholas Boleky


## Build Tools & Versions Used
This was developed on _Xcode 12.1_ using _Swift 5_


## Approach

The approach I took was MVC. With a small project like this the risk of running the dreaded "Massive View Controller" was pretty low and the layout using MVC is pretty straightforward.


## Findings / Notes
* My biggest regret/hicucp with this challenge is that I did not end up implementing the specified feature that allowed the app to fetch relevant events from SeatGeek API while the user was typing. I want to explain that this is totally do-able with textDidChange, and I have the code necessary for it commented out with notes, but I didnt see that direction until my final readthrough and by then I had already implemented an alert controller that pops up when a user enters something that doesnt return a result and with that turned on it resulted in alerts constantly appearing while the user was typing. As noted in my comments I would normally reach out to UI/UX or my tech leader and ask if I should prioritize the calls while typing. If it is important I can implement this feature in less than a day, I just ran out of time to refactor my code. 
* I tried to show off by adding an alert when a user typed a keyword that didnt return results but as mentioned above that ended up biting me because it made it inconvienent to implement textDidChange...
* I forgot to round the corners on the UIImages but I promise I know how to do this.
* I had a lot of fun playing with this project and hashing out the logic for the favorite button. I hope that even if I'm not considered for the position I get a chance to talk to your senior devs about this project and where I could have improved.

* I really had no idea how the time works with this API. The documentation doesnt explain the difference between their local time vs UTC time and no matter which I used I was getting back events at bizzare start times like 1AM for a football game... The only reason I gave up on this was because in the mockups there are also 1am start times for football games so I decided it might be an issue with the API and didnt want to waste any more time on it.

* Even though directions said UI doesnt have to follow the screenshots it was important to me that I show you I could follow the exact designs presented to me on figma or a related template. I only added small modifications like the popups when an error is encountered. 


## How Long I Spent on the Project
I spent an embarassing ammount of time on this project. Aprox 8 hours in total. Some really small things ended up taking me longer than I would have hoped. The date formatting was a little new for me and probably took an hour in itself. I think I spent 30 minutes just trying to figure out how to make the status bar white instead of the black default. I think I took at least 45 minutes to sign up and get familiar with the API and run some test calls on postman. The logic with the favorite button took me some time to work out and even once I figured out how I wanted to do it I had to spend longer figuring out how to wire the UI up with it. The easiest bit was actually making the network calls since I have experience with this. 

## Code That Was Already Written
I did reference previous projects and adapted the network call functions from them into this project. I also reused my error enums/alert controller because I find them to be useful in communicating to the user some sense of what went wrong. 

## If I Had More Time
* I really wanted to add XCUnit tests to this project but I honestly just ran out of time. If you like what I have done so far and you would like to see what I can do I will gladly take more time on this project. I had a lot of fun with it and adding unit testing would be really fulfilling. 
* I would have rounded those dang corners on the UIImages...
* I would have gone back and made the search functionality work while the user was typing instead of pushing enter. I promise I can do this I just noticed that specification a little too late. I would take me some time to think about how to use notifications still (if at all) but I enjoy thinking about those types of problems.
* Swift has a new way to handle network calls using combine and I wanted to try that out here but I was too nervous. If I had more time I would work through it and implement it here.

## Final Thoughts
* Please Please share your feedback with me. Even if you find my code doesnt meet your expectations for taking on an internship I would love to know why and what I can do to improve. I get very excited to hear feedback because I know I am new and I can always improve. Your input is really valuable to me. I hope to hear from you soon!
