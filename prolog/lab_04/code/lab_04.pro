domains
   sex = string
   name = symbol
predicates
   parent(sex, name, name)
   grandparent(sex, name, name, sex)
clauses
   parent("M", alexey, mark).
   parent("W", ulyana, mark).
   
   parent("W", julia, maria).
   parent("M", nikita, maria).
   
   parent("W", maria, rita).
   parent("W", maria, sasha).
   
   parent("M", roman, alexey).
   parent("W", tatiana, alexey).
   
   parent("W", sofia, ulyana).   
   
   grandparent(Sex, Grandparent, Child_name, Line) :- parent(Line, Parent, Child_name), parent(Sex, GrandParent, Parent).
goal
   %grandparent("M", Grandparent, mark, _).
   %grandparent("W", Grandparent, mark, _).
   %grandparent(Sex, Grandparent, mark, Line).
   %grandparent("W", Grandparent, mark, "W").
   %grandparent(Sex, Grandparent, rita, "W").
