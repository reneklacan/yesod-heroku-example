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

## Do It Yourself Guide

1. Create a minimal Yesod app `tack new YOUR_APP_NAME yesod-minimal`
1. Update `src/Main.hs` to use port from the `PORT` env var ([example](src/Main.hs))
1. Create `.circleci` directory in the root of your project and add [config.yml](.circleci/config.yml) and [setup-heroku.sh](.circleci/setup-heroku.sh)
1. Create a Heroku project with null buildpack `heroku create YOUR_PROJECT_NAME --buildpack http://github.com/ryandotsmith/null-buildpack.git`
1. Add Heroku remote to your project `heroku git:remote -a YOUR_HEROKU_PROJECT_NAME`
1. Add Procfile with default web process pointing to binary which will be created durinng CircleCI build - `dist/YOUR_APP_NAME` ([example](Procfile))
1. Push your changes to your project's repo (Github or Bitbucket will both work)
1. Create new CircleCI project for project's repository and add required environment variables (`HEROKU_PROJECT`, `HEROKU_LOGIN`, `HEROKU_API_KEY`) in CircleCI's project settings. (In case you are not familiar with CircleCI check out [CircleCI 2.0 - First Steps](https://circleci.com/docs/2.0/first-steps/))
1. Now when you commit and push to your repository it will trigger CircleCI build which will deploy your app to Heroku
1. Once CircleCI build is finished, visit your app on Heroku and verify that it works - https://YOUR_HEROKU_PROJECT_NAME.herokuapp.com/
1. Celebrate
