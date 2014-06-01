require 'pg'

def connection
  begin
    connect = PG.connect(dbname: 'recipes')

    yield(connect)

  ensure
    connect.close
  end
end

def get_recipes
  connection do |connect|
    query = "SELECT recipes.name, recipes.id FROM recipes ORDER BY recipes.name"

    connect.exec(query)
  end
end

def get_recipe_detail(id)
  connection do |connect|
    query = "SELECT recipes.name, recipes.instructions,
             recipes.description AS desc, ingredients.name AS ingredient
             FROM recipes
             JOIN ingredients ON recipes.id = ingredients.recipe_id
             WHERE recipes.id = '#{id}'"
    connect.exec(query)
  end
end
