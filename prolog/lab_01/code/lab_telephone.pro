/*****************************************************************************

		Copyright (c) My Company

 Project:  LAB_TELEPHONE
 FileName: LAB_TELEPHONE.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "lab_telephone.inc"

domains
  name = string
  phone = string

predicates
  phone(name, phone).

clauses
  phone(ellen, "367890").
  phone(john, "475910").
  phone(tom, "458457").
  phone(eric, "483557").
  phone(mark, "104857").

goal
  phone(mark, X).
