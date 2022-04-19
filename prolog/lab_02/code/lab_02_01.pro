include "lab_telephone.inc"

domains
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
    car_cost = integer
    
    %bank depositor
    bank_name = string
    bank_account = string
    account_cost = integer
    
predicates
    phone(surname, phone_number, struct_address).
    car(surname, car_brand, car_color, car_cost).
    bank_depositor(surname, bank_name, bank_account, account_cost).
    
    find_info_by_number(phone_number, surname, car_brand, car_cost).
    find_car_brand_by_number(phone_number, car_brand).
    find_info_by_surname_city(surname, city, phone_number, street, bank_name).
    find_info_by_brand_color(car_brand, car_color, surname, city, phone_number, bank_name).
    
clauses
    phone("Pavlov", "+7(934)245-34-12", address("Moscow", "St.1905 year", 20, 154)).
    phone("Pavlov", "+7(924)056-78-34", address("Moscow", "St.1905 year", 20, 154)).
    phone("Dremin", "+7(984)874-91-23", address("Moscow", "Tverskaya", 53, 26)).
    phone("Agafonova", "+7(934)812-38-47", address("Moscow", "Bolshaya Dmitrovka", 7, 15)).
    phone("Agafonova", "+7(956)361-31-17", address("Moscow", "Bolshaya Dmitrovka", 7, 15)).
    
    car("Pavlov", "Toyota Camry", "Silver", 1200000).
    car("Dremin", "Honda Oddysey", "Black", 900000).
    car("Pavlov", "Honda Oddysey", "Black", 900000).
    car("Dremin", "Ford Mustang", "Blue", 1800000).
    
    bank_depositor("Agafonova", "Sberbank", "0401-2535", 15000).
    bank_depositor("Agafonova", "Tinkoff", "1431-5836", 25000).
    bank_depositor("Dremin", "VTB", "9631-7521", 20000).
    bank_depositor("Pavlov", "Alpha", "9631-7521", 20000).
    
    find_info_by_number(Phone_number, Surname, Car_brand, Car_cost) :- phone(Surname, Phone_number, _),
    								       car(Surname, Car_brand, _, Car_cost).
    find_car_brand_by_number(Phone_number, Car_brand) :- find_info_by_number(Phone_number, _, Car_brand, _).
    find_info_by_surname_city(Surname, City, Phone_number, Street, Bank_name) :- phone(Surname, Phone_number, address(City, Street, _, _)),
    									  bank_depositor(Surname, Bank_name, _, _).
    									  
    find_info_by_brand_color(Car_brand, Car_color, Surname, City, Phone_number, Bank_name) :- car(Surname, Car_brand, Car_color, _),
    		 			phone(Surname, Phone_number, address(City, _, _, _)), 
    					bank_depositor(Surname, Bank_name, _, _).	 
    								       
    
goal
    %find_info_by_number("+7(984)874-91-23", Surname, Car_brand, Car_cost).
    %find_car_brand_by_number("+7(984)874-91-23", Car_brand).
    %find_info_by_surname_city("Agafonova", "Moscow", Phone_number, Street, Bank_name).
    find_info_by_brand_color("Honda Oddysey", "Black", Surname, City, Phone_number, Bank_name).    
