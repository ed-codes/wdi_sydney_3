INSERT INTO posts (title, description, body, author, created_at) VALUES ('Second Post', 'Second Description', 'Some more awesome body text', 'Eduard Fastovski', 'now');

CREATE TABLE comments 
(
id serial8 PRIMARY KEY,
comment_body TEXT,
author VARCHAR(255),
created_at TIMESTAMP
);

ALTER TABLE comments ADD COLUMN post_id INTEGER REFERENCES posts(id);


<% @comments.each do |comment| %>

<p><%= comment['body'] %></p>
<p><%= comment['author'] %></p>
<p><%= comment['created_at'] %></p>

<p><%= end %></p>


<% @posts.each do |field| %>
<h2><%= field['title'] %></h2>
<h3><%= field['description'] %></h3>
<p><%= field['body'] %></p>

<p class="author"><%= field['author'] %></p>
<p class="timestamp"><%= field['created_at'] %></p>

<a href="/posts/<%= @posts[0]['id'] %>/edit"><button>Edit</button></a>

<form action="/posts/<%= field['id'] %>/delete" method="post">
  <button>Delete</button>
</form>

<% end %>


<% @comments.each do |field| %>
<h2><%= field['comment_body'] %></h2>
<h3><%= field['author'] %></h3>
<p><%= field['created_at'] %></p>

<% end %>

