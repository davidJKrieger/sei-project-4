DROP DATABASE IF EXISTS DATABASE NAME HERE
CREATE DATABASE DATABASE NAME HERE

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(32),
    password_digest VARCHAR(60)
);

CREATE TABLE meals(
    id SERIAL PRIMARY KEY,
    meal_name VARCHAR(255)
    recipe_link_url VARCHAR(255)
    meal_img_url VARCHAR(255)
    user_id INTEGER REFERENCES users(id)
);

CREATE TABLE ingredients(
    id SERIAL PRIMARY KEY,
    ingredient_name VARCHAR(255),
    ing_img_url VARCHAR(255),
    meal_id INTEGER REFERENCES meals(id)
);

CREATE TABLE recipe(
    id SERIAL PRIMARY KEY,
    meal_id INTEGER REFERENCES meal(id)
    ingredient_id INTEGER REFERENCES ingredients(id)
    quantity INTEGER REFERENCES ingredients(id)
);