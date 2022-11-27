rand(2..10).times do |i|
  restaurant = Restaurant.find_or_create_by!(name: "Restaurant #{i}")
  7.times do |j|
    menu = restaurant.menus.find_or_create_by!(day: Menu.days.invert[j])
    rand(2..10).times do |k|
      menu.dishes.find_or_create_by!(name: "Dish #{k} (#{Menu.days.invert[j].pluralize} at #{restaurant})", price: rand(10.0..2000.0))
    end
  end
end
