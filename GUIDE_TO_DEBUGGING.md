It's not always clear how to best setup for debugging inside Robot Framework, but here's a couple options that I've come to use.

First off, lets define what we are debugging. Inside of Robot Framework you're most likely going to run into issues with debugging the UI. That could be a field inside of browser, or some operation inside excel. You'll want to pause the execution at the point of failure and see what's happening.


# Debugging with Robot Framework

## Why

- Automation tends to be more brittle
- It's hard to debug just from error codes, sometimes you need to see the process
- It may be the only way to fix processes you didn't build or haven't worked on in some time

## Some basic common sense rules

1. Debugging should only occur when you're in development.
2. We need to not only allow for failures to pause the execution of a script, but also allow the developper to pause the script and multiple point without a task failure. This allows us to 'step through' the execution and see how everything is working. In some cases we may run into an error, but want to follow along by pausing multiple times before we get to the failure. In most programming languages, this would be done with the 'debug' keyword.

## Debugging with vanilla Robot Framework

- First route to quickly debug an issue
- Doesn't require any libraries, but can still be complex
- Allow us to pause, but we are limited in what we have access to (great for xpath debugging, not for debugging a coding issue)

## Dropping to Python to debug

- Requires us to add a library and some python knowledge
- Much more flexible, we can not just pause, but also run commands
- Gives us full access to both Robot Framework and Python (anything you can do in Python)


