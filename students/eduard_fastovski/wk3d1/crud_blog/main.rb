require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'
require 'active_record'

def run_sql(sql)
  # connect to the cats database
  conn = PG.connect(:dbname => 'blog')

  
  # exec the sql in the argument
  res = conn.exec(sql)

  # close the db connection
  conn.close
  # return the result of the SQL
  res
end

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :username => "ed",
  :database => "blog"
  )

class Posts < ActiveRecord::Base
  # validates :name, :presence => true, :uniqueness => true
end

class Comments < ActiveRecord::Base

end

get '/' do
  #home page redirects to posts page
redirect to '/posts'
end

get '/posts' do
  #show home page containing all posts
  sortby =  params[:sort] || "created_at" # creates sortby variable to use below
  
  @rows = Posts.all.order(sortby)
  # sql = "SELECT * FROM posts ORDER BY #{sortby}"
  # @rows = run_sql(sql)
  erb :home
end

get '/posts/new' do
  #display the new post form/page
  erb :new
end

get '/posts/:id' do
  #take the user to the 'show' page for that post by id - posts/1234
  @posts = Posts.where(:id => params[:id])
  # sql = "SELECT * FROM posts WHERE id = #{params[:id]}"
  # @posts = run_sql(sql)

  
  @comments = Comments.where(:post_id => params[:id] )

  # sql2 = "SELECT comment_body, comments.author, comments.created_at FROM comments 
  # LEFT JOIN posts ON comments.post_id = posts.id
  # WHERE posts.id = #{params[:id]}" 
  # @comments = run_sql(sql2)
  erb :show
end

post '/posts' do
  # take the input and put it in the database
    Posts.create(:title => params[:title], :description => params[:description], :body => params[:body], :author => params[:author], :created_at => 'now')
  # sql = "INSERT INTO posts (title, description, body, author, created_at) VALUES ('#{params[:title]}', '#{params[:description]}', '#{params[:body]}', '#{params[:author]}', 'now')"
  # run_sql(sql)
  redirect to '/'
end

post '/comment' do
  # INSERT comment into database

  Posts.create(:comment_body => params[:comment_body], :author => params[:author], :created_at => 'now')

  # sql = "INSERT INTO comments (comment_body, author, created_at, post_id) VALUES ('#{params[:comment_body]}', '#{params[:author]}', 'now',' #{params[:post_id]}' )"
  # run_sql(sql)
  redirect to "/posts/#{params[:post_id]}"
end

get '/posts/:id/edit' do
  #display the edit form
# sql = "SELECT * FROM posts WHERE id = #{params[:id]}"
#gets the posts where id = whatever, but that is still several posts it just happens to be unique
# @posts = run_sql(sql)
@posts = Posts.where(:id => params[:id])
#go into that actual post, save it in @post variable
@post = @posts[0]
erb :edit
end

post '/posts/:id' do
  # post the posts edit to the database
  current_post = Posts.find (params[:id])
  current_post.update_attributes(:title => params[:title], :description => params[:description], :body => params[:body], :author => params[:author])
  # sql = "UPDATE posts SET title = '#{params[:title]}', description = '#{params[:description]}', body = '#{params[:body]}', author = '#{params[:author]}' WHERE id = #{params[:id]} "
  # run_sql(sql)
  redirect to '/'
end

post '/posts/:id/delete' do
  #delete the post depending on id in url
  sql = "DELETE FROM posts WHERE id = #{params[:id]}"
  run_sql(sql)
  redirect to '/'
end













