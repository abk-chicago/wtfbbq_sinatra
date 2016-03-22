CREATE DATABASE omg_wtfbbq_app_sinatra;
\c omg_wtfbbq_app_sinatra
CREATE TABLE accounts (id SERIAL PRIMARY KEY, name VARCHAR(255), email VARCHAR(255), password_hash VARCHAR(255));
CREATE TABLE ingredients (id SERIAL PRIMARY KEY, name VARCHAR(255), quantity DECIMAL, food_group VARCHAR(255));
CREATE TABLE recipes (id SERIAL PRIMARY KEY, name VARCHAR(255), restriction VARCHAR(255), cuisine_style VARCHAR(255));
