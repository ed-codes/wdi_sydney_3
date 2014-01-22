CREATE TABLE posts 
(
id serial8 PRIMARY KEY,
title VARCHAR(255),
description TEXT,
body TEXT,
author VARCHAR(255),
created_at TIMESTAMP
);