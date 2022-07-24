class TodosController < ApplicationController
  before_action :set_current_user
  before_action :set_todo, only: %i[ show edit update destroy ]

  # GET /todos or /todos.json
  def index
    @todos = Current.user.todos.all
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Current.user.todos.build
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = Current.user.todos.build(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todo_url(@todo), notice: "Todo was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todo_url(@todo), notice: "Todo was successfully updated." }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url, notice: "Todo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_current_user
      if session[:user_id]
          Current.user = User.find_by(id: session[:user_id])
        else 
          redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.user.nil? 
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:title, :description)
    end
end
