function clean_ingredients(dish_name, dish_ingredients)
    return (dish_name,Set(dish_ingredients))
end

function check_drinks(drink_name, drink_ingredients)
    if setdiff(Set(drink_ingredients),ALCOHOLS) == Set(drink_ingredients)
        return drink_name * " Mocktail"
    else
        return drink_name * " Cocktail"
    end
end

function categorize_dish(dish_name, dish_ingredients)
    if issubset(Set(dish_ingredients),VEGAN)
        category = "VEGAN"
    elseif issubset(Set(dish_ingredients), VEGETARIAN)
        category = "VEGETARIAN"
    elseif issubset(Set(dish_ingredients), PALEO)
        category = "PALEO"
    elseif issubset(Set(dish_ingredients), KETO)
        category = "KETO"
    else
        category = "OMNIVORE"
    end
    return dish_name * ": $category"
end

function tag_special_ingredients(dish)
    dish_name = dish[1]
    ingredients = Set(dish[2])
    return (dish_name,intersect(ingredients,SPECIAL_INGREDIENTS))
end

function compile_ingredients(dishes)
    master_dishes = Set()
    for dish in dishes
        master_dishes = union(master_dishes,dish)
    end
    return master_dishes
end

function separate_appetizers(dishes, appetizers)
    return setdiff(dishes,appetizers)
end

function singleton_ingredients(dishes, intersection)
    master_ingredient = Set()
    for dish in dishes
        master_ingredient = union(master_ingredient,dish)
    end
    return setdiff(master_ingredient,intersection)
end
