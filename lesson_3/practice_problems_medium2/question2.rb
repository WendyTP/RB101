
def fun_with_ids
  a_outer = 42  # id 85
  b_outer = "forty two"  # id 47267979604920
  c_outer = [42]  # id 47267979623520 
  d_outer = c_outer[0]  #  = 42  # id 85

  a_outer_id = a_outer.object_id  # = 85  # id 171
  b_outer_id = b_outer.object_id  # = 7267979604920  # id 14535959209841
  c_outer_id = c_outer.object_id  # = 47267979623520  # id 94535959247041
  d_outer_id = d_outer.object_id  # = 85  # id 171

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."   # 42 ; 85
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."   # "forty two" ; 7267979604920
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."   # [42] ; 47267979623520  # 42, 85
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block. 

"

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call." # 42 ; 85 ; 85
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call." # "fourty two"; 7267979604920 ;7267979604920
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call." # [42] ; 47267979623520 ; 47267979623520 # 42; 85; 85
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call.

"

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method.

" rescue puts "ugh ohhhhh"
end



def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id    # = 85
  b_outer_inner_id = b_outer.object_id    # = 7267979604920
  c_outer_inner_id = c_outer.object_id    # = 47267979623520
  d_outer_inner_id = d_outer.object_id    # = 85

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."   # 85; 85
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."   # 7267979604920 ; 7267979604920
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."   # 47267979623520 ; 47267979623520  # 85 ; 85
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method.

"

  a_outer = 22    #id 45
  b_outer = "thirty three"  #id 47267979707940
  c_outer = [44]        #id 47267979735300
  d_outer = c_outer[0]  # = 44   # id 89

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after." # 22; 85 ; 45
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after." # "thirty three" ; 7267979604920; 47267979707940
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."  # [44]; 47267979623520 ; 47267979735300 # 44 ; 85 ; 89
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.

"


  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)." # 22 ; 45 ; 45
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."  # "thirty three" ; 47267979707940; 47267979707940
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)." # [44]; 47267979735300 ;47267979735300 # 44 ;89; 89
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer).  

"
end

fun_with_ids