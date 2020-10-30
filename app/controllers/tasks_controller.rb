class TasksController < ApplicationController

  def index
    tasks = Task.order('created_at DESC')
    render json: { status: 'SUCCESS', messages: 'Loaded tasks', data: tasks }, status: :ok
  end

  def show
    task = Task.find(params[:id])
    render json: { status: 'SUCCESS', messages: 'Loaded task', data: task }, status: :ok
  end

  def create
    task = Task.new(task_params)

    if task.save
      render json: { status: 'SUCCESS', messages: 'Task saved', data: task }, status: :ok
    else
      render json: { status: 'ERROR', messages: 'Task not saved', data: task.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    task = Task.find(params[:id])

    if task.destroy
      render json: { status: 'SUCCESS', messages: 'Task deleted', data: task }, status: :ok
    else
      render json: { status: 'ERROR', messages: 'Task not deleted', data: task.errors }, status: :unprocessable_entity
    end
  end

  def update
    task = Task.find(params[:id])

    if task.update_attributes(task_params)
      render json: { status: 'SUCCESS', messages: 'Task updated', data: task }, status: :ok
    else
      render json: { status: 'ERROR', messages: 'Task not updated', data: task.errors }, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :completion, :user_id)
  end
end