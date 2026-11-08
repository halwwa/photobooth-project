CREATE DATABASE IF NOT EXISTS photobooth_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE photobooth_db;

-- 1. Таблица templates (Шаблоны)
CREATE TABLE templates (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  category VARCHAR(50) NOT NULL,
  preview_url VARCHAR(255),
  style_params TEXT,
  usage_count INT NOT NULL DEFAULT 0,
  activeness BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Таблица sessions (Сессии)
CREATE TABLE sessions (
  id INT NOT NULL AUTO_INCREMENT,
  qr_token VARCHAR(255) NOT NULL,
  template_id INT NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  expired_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_qr_token (qr_token),
  CONSTRAINT fk_sessions_template
    FOREIGN KEY (template_id) REFERENCES templates(id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Таблица orders (Заказы)
CREATE TABLE orders (
  id INT NOT NULL AUTO_INCREMENT,
  session_id INT NOT NULL,
  tariff_minutes INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  payment_method VARCHAR(50) NOT NULL,
  printed_count INT NOT NULL DEFAULT 5,
  printed BOOLEAN NOT NULL DEFAULT FALSE,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT fk_orders_session
    FOREIGN KEY (session_id) REFERENCES sessions(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. Таблица admins (Администраторы) - ее на картинке нет, но она нужна для задачи с 5 запросами
CREATE TABLE admins (
  id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  role VARCHAR(50) NOT NULL DEFAULT 'manager',
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
