
class UserController < AppController

  # reads JSON body
  before do
    begin
      @user = user_data
    rescue
      @user = nil
    end
  end

  # signs up a new user
  post '/signup' do
    begin
      person = User.create(@user)
      json_response(code: 201, data: person)
    rescue => e
      error_response(422, e)
    end
  end

  #logs in user using email and password
  post '/signin' do
    begin
      user_data = User.find_by(email: @user['email'])
      if user_data.password_hash == @user['password_hash']
        json_response(code: 200, data: {
          id: user_data.id,
          name: user_data.name,
          email: user_data.email
        })
      else
        json_response(code: 422, data: { message: "Your email/password combination is not correct" })
      end
    rescue => e
      error_response(422, e)
    end
  end

  get '/users' do
    user = User.all
    user.to_json
  end

  get '/users/last' do
    user = User.all.last
    user.to_json
  end

  get '/user/:id' do
    user = User.find(params[:id].to_i)
    user.to_json
  end


  private

  # parse user JSON data
  def user_data
    JSON.parse(request.body.read)
  end

end
