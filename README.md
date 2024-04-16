# Seismic Data Viewer

Seismic Data Viewer is a web application developed in Ruby on Rails that allows users to view seismic data from the USGS (United States Geological Survey) and interact with it by submitting comments about earthquakes.
It's basic and its's a challenge for a job application in Frogmi.
## Features

- Fetches seismic data from the USGS API and persists it in the database.
- Exposes API endpoints for retrieving seismic features and submitting comments.
- Allows users to view a list of seismic features and submit comments about specific earthquakes.
- Validates and stores comments associated with earthquakes in the database.

## Requirements

- Ruby (version X.X.X)
- Rails (version X.X.X)
- Node.js and npm (for frontend development, optional)
- Sqlite3

## Setup

1. Start the Rails server:

    ```
    rails server
    ```

## Usage

1. Browse the list of seismic features on the homepage.
3. Use the form to submit a new comment about an earthquake (Write an id from 1....n) and write a comment.
4. The database is now updated

## API Endpoints
Fetch Data page : `http://127.0.0.1:3000/api/v1/earthquakes/1/seismic_features?page=' + page` 
  example:http://127.0.0.1:3000/api/v1/earthquakes/1/seismic_features?page=
comments : `http://127.0.0.1:3000/api/v1/earthquakes/${earthquakeId}/comments`
  example:http://127.0.0.1:3000/api/v1/earthquakes/2/comments


