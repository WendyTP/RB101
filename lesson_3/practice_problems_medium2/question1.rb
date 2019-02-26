=begin
* Predict how the values and object ids will change :
a_outer = 42 (# object id : 1)  # id 85
a_outer_id = a_outer.object_id  = 1  (# object id: 111)

b_outer = "forty two" (# object id : 2) # id 2152729580
b_outer_id = b_outer.object_id = 2    (# object id : 222)

c_outer = [42]  # array (# object id : 3) # 2152729540
c_outer_id = c_outer.object_id = 3   (# object id : 333)

d_outer = c_outer[0]  => 42 (# object id : 1  # refers to element in c_outer array) # id 85
d_outer_id = d_outer.object_id = 1   (# object id : 111)


a_outer_inner_id = a_outer.object_id = 1 (# object id : 111)
b_outer_inner_id = b_outer.object_id = 2  (# object id : 222)
c_outer_inner_id = c_outer.object_id = 3  (# object id: 333)
d_outer_inner_id = d_outer.object_id = 1  (# object id : 111)

########

a_outer = 22  (# object id : 5)  #id 45
b_outer = "thirty three"  (# object id: 6)  #id 2152728320
c_outer = [44]  (# object id: 7)            #id 2152728280
d_outer = c_outer[0] = 44 (#object id : 8  # refers to element in c_outer array)    #id 89

#########
a_inner = a_outer = 22 (# object id: 5)  #id 45
b_inner = b_outer = "thirty three" (# object id : 6)  #id 2152728320
c_inner = c_outer = [44] (#object id : 7)   #id 2152728280
d_inner = c_inner[0] => 44 (# object id : 8)  #id 89

a_inner_id = a_inner.object_id = 5   (# object id: 555)
b_inner_id = b_inner.object_id = 6    (# object id : 666)
c_inner_id = c_inner.object_id = 7   (# object id : 777)
d_inner_id = d_inner.object_id = 8  (# object id : 888)



=end