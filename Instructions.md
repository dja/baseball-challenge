## Instructions

Read through the models and controllers to understand the base layer of the application.

API Endpoints Edits

- Add ability for Player to change teams.
- There's an error that happens when Updating a Run. It's not letting me update the Player (ie. if the wrong player was attributed to begin with).

Model Edits

- At the moment, a Game can be created with the same Home Team and Away Team, even though we know this isn't possible in real life.. How do we protect the app from allowing this?
- Game model has the ability to lookup Home Team Runs and Away Team Runs, but it is slow / too complex. How would you refactor this? (We're looking to see your thought process behind searching through large datasets)

External Integration

- Add MLB.rb gem and use MLB data to pre-populate Teams and Players.