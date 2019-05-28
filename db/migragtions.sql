DROP DATABASE IF EXISTS #DATABASE NAME HERE
CREATE DATABASE #DATABASE NAME HERE

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(32),
    password_digest VARCHAR(60)
);

CREATE TABLE ingredients(
    id SERIAL PRIMARY KEY,
    ingredient_name VARCHAR(255),
    img_url VARCHAR(255),
    fridge BOOL
    user_id INTEGER REFERENCES users(id)
);

#through table
CREATE TABLE meals(
    id SERIAL PRIMARY KEY,
    meal_name VARCHAR(255)
    recipe VARCHAR(255)
    img_url VARCHAR(255)
    user_id INTEGER REFERENCES users(id),
    ingredient_id INTEGER REFERENCES ingredients(id)
);