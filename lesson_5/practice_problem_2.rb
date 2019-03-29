=begin
Request: Order this array of hashes based on the year of publication of each book,
 from the earliest to the latest?


=end

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

ordered_books = books.sort_by do |element|
  element[:published].to_i
end

p ordered_books


# simpler way
=begin
ordered_books = books.sort_by do |element|
  element[:published]
end

# Since all values in :published keys are four character in length, we cna simply compare the strings without having to convert them to integers.
=end