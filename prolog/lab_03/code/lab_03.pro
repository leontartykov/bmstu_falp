domains
    %general for all
    price = integer

    %phone
    surname = string
    phone_number = string
    city = string
    street = string
    house_number = integer
    flat_number = integer
    struct_address = address(city, street, house_number, flat_number)
    
    %cars
    car_brand = string
    car_color = string
    
    %bank depositor
    bank_name = string
    bank_account = string
    account_cost = integer
    
    %property owner
    property_name = string
    type = symbol
    property = building(property_name, type, price);
    	       plot(property_name, type, price);
    	       water_transport(property_name, type, price);
    	       car(property_name, car_brand, car_color, price)
    	       
predicates
    phone(surname, phone_number, struct_address).
    bank_depositor(surname, bank_name, bank_account, account_cost).
    owner(surname, property).
    
    find_info_name_properties(surname, surname, property_name).
    find_info_name_price_properties(surname, surname, property_name, price).
    
    find_sum(surname, price).
    find_sum_price_properties(surname, price).
    if_property(surname, type, price).
    
    
clauses
    phone("Pavlov", "+7(934)245-34-12", address("Moscow", "St.1905 year", 20, 154)).
    phone("Pavlov", "+7(924)056-78-34", address("Moscow", "St.1905 year", 20, 154)).
    phone("Dremin", "+7(984)874-91-23", address("Moscow", "Tverskaya", 53, 26)).
    phone("Agafonova", "+7(934)812-38-47", address("Moscow", "Bolshaya Dmitrovka", 7, 15)).
    phone("Agafonova", "+7(956)361-31-17", address("Moscow", "Bolshaya Dmitrovka", 7, 15)).
    
    owner("Pavlov", car("TC", "Toyota Camry", "Silver", 1200000)).
    owner("Pavlov", car("HO", "Honda Oddysey", "Black", 900000)).
    owner("Dremin", car("FM", "Ford Mustang", "Blue", 1800000)).
    owner("Pavlov", building("Home", flat, 15200)).
    owner("Dremin", water_transport("Jetmax", speedboat, 180000)).
    owner("Agafonova", plot("Greenland", speedboat, 9635000)).
    
    bank_depositor("Agafonova", "Sberbank", "0401-2535", 15000).
    bank_depositor("Agafonova", "Tinkoff", "1431-5836", 25000).
    bank_depositor("Dremin", "VTB", "9631-7521", 20000).
    bank_depositor("Pavlov", "Alpha", "9631-7521", 20000).
    	
    if_property(Surname, car, Price) :- owner(Surname, car(_, _, _, Price)), !.
    if_property(Surname, building, Price) :- owner(Surname, building(_, _, Price)), !.
    if_property(Surname, water_transport, Price) :- owner(Surname, water_transport(_, _, Price)), !.
    if_property(Surname, plot, Price) :- owner(Surname, plot(_, _, Price)), !.
    if_property(_, _, 0).
      
    find_sum(Surname, Sum_price) :- 
        if_property(Surname, car, Car_price),
        if_property(Surname, building, Building_price),
        if_property(Surname, water_transport, Water_transport_price),
        if_property(Surname, plot, Plot_price),
    	Sum_price = Car_price + Building_price + Water_transport_price + Plot_price.
   

    find_info_name_properties(Surname, Surname, Property_name) :- owner(Surname, car(Property_name, _, _, _)).
    find_info_name_properties(Surname, Surname, Property_name) :- owner(Surname, building(Property_name, _, _)).
    find_info_name_properties(Surname, Surname, Property_name) :- owner(Surname, water_transport(Property_name, _, _)).
    find_info_name_properties(Surname, Surname, Property_name) :- owner(Surname, plot(Property_name, _, _)).
    
    find_info_name_price_properties(Surname, Surname, Property_name, Price) :- owner(Surname, car(Property_name, _, _, Price)).
    find_info_name_price_properties(Surname, Surname, Property_name, Price) :- owner(Surname, building(Property_name, _, Price)).
    find_info_name_price_properties(Surname, Surname, Property_name, Price) :- owner(Surname, water_transport(Property_name, _, Price)).
    find_info_name_price_properties(Surname, Surname, Property_name, Price) :- owner(Surname, plot(Property_name, _, Price)).
    
    find_sum_price_properties(Surname, Sum_price) :- find_sum(Surname, Sum_price).								       
    
goal
    %find_info_name_properties("Dremin", Surname, Property_name).
    %find_info_name_price_properties("Dremin", Surname, Property_name, Price). 
    find_sum_price_properties("Dremin", Sum_price). 
