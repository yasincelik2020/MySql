CREATE TABLE Books (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  genre VARCHAR(50),
  year_published INT
);
INSERT INTO Books (title, author, genre, year_published) VALUES
  ('Harry Potter and the Sorcerer\'s Stone', 'J. K. Rowling', 'Fantasy', 1997),
  ('The Catcher in the Rye', 'J. D. Salinger', 'Coming-of-Age', 1951),
  ('One Hundred Years of Solitude', 'Gabriel Garcia Marquez', 'Magical Realism', 1967),
  ('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1925),
  ('Frankenstein', 'Mary Shelley', 'Gothic Fiction', 1818),
  ('The Adventures of Huckleberry Finn', 'Mark Twain', 'Satire', 1885),
  ('To Kill a Mockingbird', 'Harper Lee', 'Drama', 1960),
  ('The Book Thief', 'Markus Zusak', 'Historical Fiction', 2005);
  
  select * from books;