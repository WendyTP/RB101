flintstones = { "Fred" => 0, "Wilma" => 1,
                "Barney" => 2, "Betty" => 3,
                "BamBam" => 4, "Pebbles" => 5 
              }

array = []
array.push(flintstones.key(2)).push(flintstones["Barney"])

p array

another_array = flintstones.select{|key,value| value == 2}.to_a.flatten

p another_array

selected_array = flintstones.assoc("Barney")

p selected_array