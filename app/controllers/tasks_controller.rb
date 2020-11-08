class TasksController < ApplicationController
  include CurrentUserConcern
  def index
    tasks = Task.where('user_id': @current_user).order('created_at DESC')
    render json: { status: 'SUCCESS', messages: 'Loaded tasks', tasks: tasks }, status: :ok
  end

  def show
    task = Task.find(params[:id])
    render json: { status: 'SUCCESS', messages: 'Loaded task', task: task }, status: :ok
  end

  def create
    task = Task.new(task_params)

    if task.save
      render json: { status: 'SUCCESS', messages: 'Task saved', task: task }, status: :ok
    else
      render json: { status: 'ERROR', messages: 'Task not saved', errors: task.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    task = Task.where('user_id': @current_user)

    if task.destroy_all
      render json: { status: 'SUCCESS', messages: 'Tasks and records deleted', tasks: tasks }, status: :ok
    else
      render json: { status: 'ERROR', messages: 'Task/Records not deleted', errors: task.errors }, status: :unprocessable_entity
    end
  end

  def update
    task = Task.find(params[:id])

    if task.update_attributes(task_params)
      render json: { status: 'SUCCESS', messages: 'Task updated', task: task }, status: :ok
    else
      render json: { status: 'ERROR', messages: 'Task not updated', errors: task.errors }, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :completion, :user_id)
  end
end