# yesod-heroku-example

Minimal example of a pipeline for deploying Yesod to Heroku through CircleCI.

### How it works?

When you push change to the repository, CircleCI builds yesod application,
runs tests and pushes statically linked binary to the Heroku.

As the Yesod app is statically compiled resulting binary doesn't need any dependencies.

### Required CircleCI Environment Variables

Environment variables you need to define in CircleCI project settings:
- `HEROKU_PROJECT` - Name of your Heroku project
- `HEROKU_LOGIN` - Your email
- `HEROKU_API_KEY` - Can be found on https://dashboard.heroku.com/account
