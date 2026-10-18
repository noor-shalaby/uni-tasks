CREATE DATABASE game_platform;
USE game_platform;


CREATE TABLE games (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    
    price_cents INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    
    release_date DATE,
    last_update TIMESTAMP NULL,
    
    cover_image_url TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE countries (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    iso_code CHAR(2) NOT NULL UNIQUE,
    currency_code CHAR(3) DEFAULT 'USD',   -- USD, EUR, EGP
    region VARCHAR(50) NOT NULL;           -- Europe, Asia, etc.
);


CREATE TABLE developers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    country_id INT,
    
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

CREATE TABLE game_developers (
    game_id INT,
    developer_id INT,
    
    PRIMARY KEY (game_id, developer_id),
    
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (developer_id) REFERENCES developers(id) ON DELETE CASCADE
);


CREATE TABLE publishers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    country_id INT,
    
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

CREATE TABLE game_publishers (
    game_id INT,
    publisher_id INT,
    
    PRIMARY KEY (game_id, publisher_id),
    
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (publisher_id) REFERENCES publishers(id) ON DELETE CASCADE
);


CREATE TABLE genres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE game_genres (
    game_id INT,
    genre_id INT,
    
    PRIMARY KEY (game_id, genre_id),
    
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE
);

CREATE TABLE tags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE game_tags (
    game_id INT,
    tag_id INT,
    
    PRIMARY KEY (game_id, tag_id),
    
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);


CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    country_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (country_id) REFERENCES countries(id)
);


CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    total_price_cents INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE order_items (
    order_id INT,
    game_id INT,
    price_cents INT NOT NULL,
    
    PRIMARY KEY (order_id, game_id),
    
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id)
);


CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 10),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(user_id, game_id),
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);


CREATE TABLE system_requirements (
    id INT PRIMARY KEY AUTO_INCREMENT,
    game_id INT NOT NULL,
    type ENUM('minimum','recommended') NOT NULL,
    os VARCHAR(100),
    cpu VARCHAR(100),
    ram_gb INT,
    gpu VARCHAR(100),
    storage_gb INT,
    directx_version VARCHAR(20),
    
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);


CREATE TABLE game_screenshots (
    id INT PRIMARY KEY AUTO_INCREMENT,
    game_id INT NOT NULL,
    url TEXT NOT NULL,
    description TEXT,
    sort_order INT DEFAULT 0,
    
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);

CREATE TABLE game_videos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    game_id INT NOT NULL,
    url TEXT NOT NULL,
    description TEXT,
    sort_order INT DEFAULT 0,
    
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);


CREATE TABLE dlcs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    game_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price_cents INT NOT NULL DEFAULT 0,
    release_date DATE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);


CREATE TABLE age_ratings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    system VARCHAR(50) NOT NULL,  -- e.g., ESRB, PEGI, CERO, USK, ASB, etc.
    code VARCHAR(10) NOT NULL,    -- e.g., M, 18, T
    description TEXT
    
    UNIQUE (system, code);
);

CREATE TABLE game_age_ratings (
    game_id INT,
    age_rating_id INT,
    
    PRIMARY KEY (game_id, age_rating_id),
    
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (age_rating_id) REFERENCES age_ratings(id) ON DELETE CASCADE
);


CREATE TABLE wishlists (
    user_id INT PRIMARY KEY,      -- user_id doubles as wishlist ID
    is_private BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE wishlist_items (
    user_id INT NOT NULL,         -- links to wishlist/user
    game_id INT NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (user_id, game_id),
    
    FOREIGN KEY (user_id) REFERENCES wishlists(user_id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);

CREATE TABLE wishlist_notifications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    notification_type ENUM('price_drop','dlc_release','sale_start','sale_end') NOT NULL,
    triggered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);


