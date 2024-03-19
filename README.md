# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Running Docker Container

  Make sure you have Docker up and running on your machine. If you haven't installed Docker yet, please refer to the official [Docker documentation](https://docs.docker.com/get-docker/) for installation instructions.

  Once Docker is installed, follow these steps in your terminal:

  1. Start the Docker containers:
    ```bash
    docker-compose build
    ```

  2. Build the Docker images (if needed):
    ```bash
    docker-compose up
    ```

  3. Create the database:
    ```bash
    docker-compose run rails bin/rails db:create
    ```

  4. Run migrations:
    ```bash
    docker-compose run rails bin/rails db:migrate
    ```

  These commands will set up your Docker environment and prepare your Rails application for use.


* ...
