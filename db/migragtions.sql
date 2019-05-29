DROP DATABASE IF EXISTS whats_for_dinner;
CREATE DATABASE whats_for_dinner;

\c whats_for_dinner

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(32),
  password_digest VARCHAR(60)
);

CREATE TABLE meals(
    id SERIAL PRIMARY KEY,
    meal_name VARCHAR(255),
    recipe_link_url VARCHAR(255),
    meal_img_url VARCHAR(255),
);

CREATE TABLE ingredients(
    id SERIAL PRIMARY KEY,
    ingredient_name VARCHAR(255),
    ing_img_url VARCHAR(255),
    ing_desc VARCHAR(255), 
);

CREATE TABLE recipes(
    id SERIAL PRIMARY KEY, 
    quantity VARCHAR(255),
    --a recipe belongs to a meal
    --a dinner has many recipes
    meal_id INTEGER REFERENCES meals(id),
    --a recipe belongs to an ingredient
    --an ingredient has many recipes
    ingredient_id INTEGER REFERENCES ingredients(id),   
);


