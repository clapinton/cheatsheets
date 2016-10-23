#***** 1 - CREATE STRUCTURE *****#
# 1.1) Create User migration and model with:
username:string, password_digest: string, session_token:string

# 1.2) Create Session controller ONLY.

# 1.3) Add resources to routes.rb
resources :users, only: [:create, :new, :show]
resource :session, only: [:new, :create, :destroy]


#***** 2 - USER MODEL *****#
# 2.1) Validations
# It should validate:
  # • all cols to null: false;
  # • username, session_token to uniqueness: true;
  # • password to length minimum and allow_nil:true;
  # • after initialization, ensure_session_token

# 2.2) Write #password setter and getter methods (@pwd gets set on the setter method)

# 2.3) ::find_by_credentials(user,pwd)
# Search by username. If he exists, check if passwords match

# 2.4) reset_cookie!
# Regenerate the :session_token and save.


#***** 3 - APPLICATION CONTOLLER *****#
# 3.1) #current_user
# set @curr_user ||= to find_by(session_token: cookie)

# 3.2) #login(user)
# set cookie to user.session_token

# 3.3) #logout(user)
# user.reset_cookie. Optionally, set the cookie to nil.


#***** 4 - USERS CONTOLLER *****#
# 4.1) #new and #create
# #new renders the new form
# #create generates an instance of user with strong params and:
  # if valid: save and redirect somewhere
  # if invalid, renders :new

# 4.2) #show
# Checks if current_user.id == params[:id]. If so, render :show. If not, redirect to new_session_url (login page)


#***** 5 - SESSION CONTOLLER *****#
# 5.1) #new and #create
# #new renders login page
# #create runs find_by_credentials with strong params. If found, login and redirect. If not, render :new

# 5.2) #destroy
# #If there's a current_user, logout and redirect
