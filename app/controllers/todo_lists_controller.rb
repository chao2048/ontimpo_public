class TodoListsController < ApplicationController
    before_action :set_event
    before_action :set_todo_list, except: [:create]
    def create
        @todo_list = @event.todo_lists.create(todo_list_params)
        redirect_to @event
    end

    def destroy
        @todo_list = @event.todo_lists.find(params[:id])
        if @todo_list.destroy
         flash[:success] = "Reminder deleted."
        else
         flash[:error] = "Reminder could not be deleted."
        end
        redirect_to @event, status: 303
    end
    def update
        @todo_list.update_attribute(:completed_at, Time.now)
        redirect_to @event, notice: "Reminder completed"
    end

    private
    def set_event
        @event = Event.find(params[:event_id])
    end
    def set_todo_list
        @todo_list = @event.todo_lists.find(params[:id])
    end
    def todo_list_params
        params[:todo_list].permit(:content)
    end
end
