class UsersController < ApplicationController
  http_basic_authenticate_with :name => "jmaison", :password => "secret", :expect => :index

  require 'rqrcode'
  # GET /users
  # GET /users.json
  def index
    @users = User.find(:all, :order => :email)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
	
	@tag = Tag.new
	@tag.data = params[:data]
	@tag.url = "http://bydefault.fr"
	puts "____________params[:data]"+params[:data]
	@tag.save
	
	#if @tag.save
	#	@user.tags[@user.tags.size - 1] = @tag
	#else
	#end
 
    respond_to do |format|
      if @user.save
		flash[:notice] = "User #{@user.email} was successfully created."
        format.html { redirect_to :action=>'index' }
        format.json { render json: @user, status: :created, location: @user }  
	  else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
		flash[:notice] = "User #{@user.email} was successfully updated."
        format.html { redirect_to :action=>'index' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
