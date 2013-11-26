class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.json
 before_filter :authenticate_user!, only:[:new, :edit, :create, :update, :destroy,:my_recipes]
 before_filter :has_recipe, only:[:edit, :update, :destroy]

  def index
    @recipes = Recipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user = current_user
   
    respond_to do |format|
      if @recipe.save
	UserMailer.update_mailer(@recipe.user).deliver
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
	
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    
    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

 def my_recipes
 @myRecipes = User.find(current_user)
 @recipes = @myRecipes.recipes
 respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
 end

 def has_recipe
  if !user_signed_in? || current_user != Recipe.find(params[:id]).user
  redirect_to recipes_path, error: "Access denied!"
  end
 end
end
