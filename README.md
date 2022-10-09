# INSTA CLONE

Just an app to try things out.

## Setup

1. Clone the repository.
2. `docker compose run --rm runner bin/setup`

## Running The App
`docker compose up web`

## Tests and CI
`docker compose run --rm runner bin/ci` running all the tests and checks for the app

## Production
* All runtime configuration should be supplied in the UNIX environment
* Rails logging uses lograge. Use `bin/setup help` to see how to test it locally
