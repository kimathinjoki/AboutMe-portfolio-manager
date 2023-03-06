# Me-Portfolio
Me-Portfolio is a basic API built with ruby's Sinatra DSL. 

It serves as a backend API for [link](about-me-portfolio-front-end.vercel.app)

```
about-me-portfolio-front-end.vercel.app

```

The application has been built with the MVC design pattern.

## Pre-Requisites
In order to use this repository you will need the following:



- Operating System **(Windows `10+`, Linux `3.8+`, or MacOS X `10.7+`)**
- RAM >= 4GB
- Free Space >= 2GB

## Built With
This application has been built with the following tools:

![ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![sqlite](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)
![bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)


- **Ruby `v2.7.+`**
- **SQlite3 `v1.6`**
- **ActiveRecord `v7.0.4`**
- **Rake `v13.0.6`**
- **Puma `v6.1`**
- **rerun `v0.14`**
- **Sinatra `v3.0.5`**
- **Bootstrap `v5.3.0`**


## Setup
You can setup this repository by following this manual

1. Clone the repository
    ```{shell}
   git clone git@github.com:kimathinjoki/AboutMe-Portfolio_FrontEnd.git
   ```
2. Ensure the ruby gems are setup in your machine
    ```{shell}
   bundle install
   ```
3. Perform any pending database migrations
   ```{shell}
   rake db:migrate
   ```
4. Run the application
    ```{shell}
    rake start
    ```
5. Open the application from your browser
    ```
   http://localhost:9292
   ```
   
## Application
This application is a simple web API that allows users to:

- Register / login to the platform.
- View all their listed projects.
- Add a new project to their portfolio.
- Able to update existing project data.
- Able to delete a project.
- Have a maximum of 10 skills.
- View their listed skills.
- Add, update and delete their skills.
- In order to use the application, the user must be logged in.
.

### MODELS
Database schema definitions.

#### PROJECTS

| COLUMN      | DATA TYPE                                       | DESCRIPTION                         | 
|-------------|-------------------------------------------------|-------------------------------------|
| id          | Integer                                         | Unique identifier.                  |
| title       | String                                          | The name of the Project.               |
| description | String                                          | A short description about the project. |
| user_id         | Integer                                            | This sets the user ID as the foreign key      |
| updated_at     | Date      | The date the project was updated.        |
| created_at   | Date                                            | The date the task was created.      |
| status      | ENUM `[CREATED, ONGOING, COMPLETED, CANCELLED]` | The status of the task.            |


#### USER

| COLUMN        | DATA TYPE | DESCRIPTION                           | 
|---------------|-----------|---------------------------------------|
| id            | Integer   | Unique identifier.                    |
| name     | String    | User's full name.                     |
| email | String    | User's email. |
| password_hash | String    | User's password hashed with `BCrypt`. |
| updated_at    | Date      | The date the user was updated.        |
| createdAt     | Date      | The date the user was created.        |


### ROUTES

1. `/signup` - Create a new user account.
   
   ```{json}
   ## REQUEST BODY
   {
    "name": "John Doe",
    "email": "mail@mail.com",
    "password": "12345678"
   }
   ```
2. `/signin` - Log in a user using email and password.

   ```{json}
   ## REQUEST BODY
   {
    "email": "mail@mail.com",
    "password": "12345678"
   }
   ```

3. `/users` - Shows all users

4. `/projects/create` - Add a new project item.

   ```{json}
   ## REQUEST BODY
   {
    "title": "Make Breakfast",
    "description": "Prepare milk and cereal",
    "user_id": 4
   }
   ```
5. `/projects` - List all Projects items.

   ```{json}
   ## RESPONSE SAMPLE
   {
    "data": [
        {
            "id": 2,
            "title": "Running another DSA practice 2",
            "description": "A wild desc",
            "updated_at": "2023-02-24T00:00:00.000Z",
            "created_at": "2023-02-24T09:34:41.856Z",
            "status": "CREATED"
        }],
    "message": "SUCCESS"
   }
   ```
6. `/user/projects/:id` - Gets the project associated with a specific user
7. `/project/update/:id` - Update an existing project.
8. `/project/delete/:id` - Delete a project item.


## LICENSE
This repository is distributed under the MIT License

```markdown
Copyright 2023 Kimathi Njoki

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), 
to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```


## Author
This repository is maintained by:

- [Kimathi Njoki](https://github.com/kimathinjoki) 