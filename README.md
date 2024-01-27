# Contact API

## Descripción
This is an api for a contact list app, with restrictions and validations for the user, it has a CRUD for cities, states and contacts.
The app is made with Ruby on Rails, PostgreSQL and Docker.

## Versiones
- **Actual version:** v1.0.0
- Ruby version: 3.1.0
- Rails version: 7.1.3
- PostgreSQL version: alpine3.19
## Instalation and Usage

### Without Docker
1. **Previous requirements**
    - Ruby 3.1.0
    - Rails 7.1.3
    - PostgreSQL alpine3.19

2. **Clone repo:**
   ```bash
   git clone https://github.com/santiagoHV/contact-registry-api.git
   cd contact-registry-api

3. Install dependencies:
   ```bash
   bundle install
   ```
4. Change database.yml file with local host and if you want to change the user and password:
   ```bash
   host: localhost # Is a must in local instalation with docker
   username: user
   password: password
   ```

5. Create database:
   ```bash
    rails db:create
    ```
6. Run migrations:
    ```bash
     rails db:migrate
     ```
7. If you want to populate the database with some data (countries,states and cities), run:
   ```bash
   rails db:seed
   ```
   
8. Run server:
   ```bash
    rails s
    ```
9. Open your browser and go to:
    ```bash
     http://localhost:3000/
     ```
### With Docker
1. **Previous requirements**
    - Docker
    - Docker-compose
- **Clone repo:**
   ```bash
   git clone https://github.com/santiagoHV/contact-registry-api.git
   cd contact-registry-api
    
2. Create a .env file in the root of the project and add the following variables:
    ```bash
    POSTGRES_USER=user
    POSTGRES_PASSWORD=password
    POSTGRES_DB=postgres_db
    ```  
   
3. Build the image:
    ```bash
    docker-compose build
    ```
4. Run the container:
    ```bash
    docker-compose up -d
    ```

5. Run migrations:
    ```bash
     docker-compose run web rails db:migrate
     ```
6. If you want to populate the database with some data (countries,states and cities), run:
    ```bash
    docker-compose run web rails db:seed
    ```
7. Open your browser and go to:
    ```bash
     http://localhost:3000/
     ```
   
## API Documentation in swagger
- **Swagger URL:** http://localhost:3000/api-docs/index.html
- **Swagger JSON:** http://localhost:3000/api-docs/v1/swagger.json
