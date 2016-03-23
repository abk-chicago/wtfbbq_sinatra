class AccountController < ApplicationController

  c = Colourize.new

  get '/' do
    p 'This is the account login/register page'
    @account_message = "Welcome! Please register or login!"
    erb :account_create
  end

  post '/login' do
    # assume this worked!
    @all_users = Account.all # this kinda sucks IRL but SOOOOONNN
    @all_users.each do |user|
      c.log(:yellow, user.to_s)
    end
    redirect '/'
  end

  get '/logout' do
    @account_message = "THANK YOU FOR VISITING US! PLZ COME BACK TYYYYY!"
    redirect '/'
  end

  post '/create' do
    #binding.pry
    @is_user_duplicate = true
    if (params[:password] != params[:password_conf])
      status 403
    end

    @all_users = Account.all # this kinda sucks IRL but SOOOOONNN
    @all_users.each do |user|
      c.log(:yellow, user.to_s)
      if (user.email == params[:email])
        status 403
      end
    end

    @new_user = Account.create({
      :name => params[:name],
      :email => params[:email],
      :password_hash => params[:password].to_s.reverse # do not irl srs
    })
    # @new_user = Account.new
    # @new_user.name = params[:name]
    # @new_user.email = params[:email]
    @new_user.save
    redirect '/'
  end

  get '/update' do
    @old_email = "james@codeforcoffee.org"
    @account_message = "Did you move? We need to track.. err help you!"
    erb :account_update
  end

  post '/update' do
    @all_users = Account.all # this kinda sucks IRL but SOOOOONNN
    @all_users.each do |user|
      c.log(:yellow, user.to_s)
    end
  end

  get '/all' do
    @all_users = Account.all
    erb :account_all
  end


end
