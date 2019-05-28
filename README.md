# sei-project-4

## What’s For Dinner

### A full-stack two-model C.R.U.D. app built with Ruby and Sinatra

#### User Story
##### User can:
  - login or register
  - add, edit and delete meals in a database
  - add, edit and delete ingredients in a database
  - see a list of meals
  - see a list of ingredients for all of the meals
  - see the ingredients for one meal
  - see all the ingredients for one user
  - see a random meal and its ingredients

##### When the user logs in, they see a button called "what's for dinner" and a button for "add a dinner"

##### When the user clicks "what's for dinner", 
    ###### - they are taken to a dinner show page that shows an image, recipe link, and ingredients. 
    ###### - there is a button to generate another dinner idea.
    ###### - there is a button to see all the dinner options.
##### When the user clicks add a dinner, they are given a form to 
    ###### - add a meal, 
    ###### - add recipe url
    ###### - add ingredients.

#### M.V.P. 
a useful app for times when a user is too busy to plan dinner and wants to see a random meal, ingredients and link to a recipe.

#### Possible Future developments
allow the user to select meals based on ingredients that they have, or add a calendar feature to plan more meals for different days.

### Data Tables
###### - user has many ingredients through meals
###### - ingredient has many users through meals
