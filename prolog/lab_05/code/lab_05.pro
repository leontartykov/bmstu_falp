domains
   number = integer
predicates
   max_from_two(number, number, number)
   max_from_two_cut(number, number, number)
   max_from_three(number, number, number, number)
   max_from_three_cut(number, number, number, number)
clauses
   max_from_two(Number_1, Number_2, Number_1) :- Number_1 >= Number_2.
   max_from_two(Number_1, Number_2, Number_2) :- Number_2 > Number_1.
   
   max_from_two_cut(Number_1, Number_2, Number_1) :- Number_1 >= Number_2, !.
   max_from_two_cut(_, Number_2, Number_2).
   
   max_from_three(Number_1, Number_2, Number_3, Number_1) :- Number_1 >= Number_2, Number_1 >= Number_3.
   max_from_three(Number_1, Number_2, Number_3, Number_2) :- Number_2 >= Number_1, Number_2 >= Number_3.
   max_from_three(Number_1, Number_2, Number_3, Number_3) :- Number_3 >= Number_2, Number_3 >= Number_1.
   
   max_from_three_cut(Number_1, Number_2, Number_3, Number_1) :- Number_1 >= Number_2, Number_1 >= Number_3, !.
   max_from_three_cut(_, Number_2, Number_3, Number_2) :- Number_2 >= Number_3, !.
   max_from_three_cut(_, _, Number_3, Number_3).
goal
   %max_from_two(4, 5, Max_number).
   %max_from_two_cut(4, 5, Max_number).
   max_from_three(3, 4, 1, Max_number).
   %max_from_three_cut(3, 4, 1, Max_number).