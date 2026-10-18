-- The First Database: world_one
CREATE DATABASE game_store;
USE game_store;


CREATE TABLE games (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	description TEXT,
	price DECIMAL(5, 2),
	developer VARCHAR(255) NOT NULL,
	publisher VARCHAR(255) NOT NULL,
	is_released BOOL,
	release_date DATE,
	rating TINYINT CHECK (rating BETWEEN 0 AND 100)
);


CREATE TABLE genres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE game_genres (
    game_id INT NOT NULL,
    genre_id INT NOT NULL,
    
    PRIMARY KEY (game_id, genre_id),
    FOREIGN KEY (game_id) REFERENCES games(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);


CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	username VARCHAR(255) UNIQUE NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE reviews (
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    rating TINYINT CHECK (rating BETWEEN 0 AND 100),
    comment TEXT,
    created_at TIMESTAMP,
	
    UNIQUE(user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (game_id) REFERENCES games(id)
);



-- The Second Database: world_two
CREATE DATABASE uni;
USE uni;


CREATE TABLE students (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	gpa DECIMAL(3, 2) CHECK (gpa BETWEEN 0.00 AND 4.00)
);


CREATE TABLE instructors (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	age TINYINT NOT NULL,
	salary DECIMAL NOT NULL
);


CREATE TABLE courses (
	code CHAR(6) PRIMARY KEY,
	title VARCHAR(255) UNIQUE NOT NULL
);



-- The Third Database: world_three
CREATE DATABASE creatures;
USE creatures;


CREATE TABLE animals (
	name VARCHAR(255) UNIQUE NOT NULL,
	type VARCHAR(255) NOT NULL,
	location VARCHAR(255) DEFAULT 'Africa'
);


CREATE TABLE birds (
	name VARCHAR(255) UNIQUE NOT NULL,
	type VARCHAR(255) NOT NULL,
	location VARCHAR(255) DEFAULT 'Africa'
);