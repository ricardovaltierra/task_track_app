class RecordsController < ApplicationController
  include CurrentUserConcern
  def index
    records = Record.where('user_id': @current_user).order('created_at DESC')
    render json: { status: 'SUCCESS', messages: 'Loaded records', records: records }, status: :ok
  end

  def show
    record = Record.find(params[:id])
    render json: { status: 'SUCCESS', messages: 'Loaded record', record: record }, status: :ok
  end

  def create
    record = Record.new(record_params)
    task = Task.find_by(id: record.task_id)

    new_completion = record.percentage + task.completion

    if new_completion <= 100
      if record.save && task.update('completion': new_completion)
        if new_completion == 100
          render json: { 
            status: 'SUCCESS', 
            messages: "Record saved. You completed your task with #{new_completion}%!!", 
            record: record
            }, status: :ok
        else
          render json: { status: 'SUCCESS', messages: 'Record saved', record: record }, status: :ok
        end
      else
        render json: { status: 'ERROR', messages: 'Record failed', errors: record.errors }, status: :unprocessable_entity
      end
    else
      render json: { 
        status: 'ERROR', 
        messages: "Current task completion is #{task.completion}%, please set a lower value for 100%", 
        record: record 
      }, status: :unprocessable_entity
    end
  end

  def destroy
    record = Record.find(params[:id])

    if record.destroy
      render json: { status: 'SUCCESS', messages: 'Record successfully destroyed', record: record }, status: :ok
    else
      render json: { status: 'ERROR', messages: 'Record delete error', errors: record.errors }, status: :unprocessable_entity
    end
  end

  def update
    record = Record.find(params[:id])

    if record.update_attributes(record_params)
      render json: { status: 'SUCCESS', messages: 'Record successfully updated', record: record }, status: :ok
    else
      render json: { status: 'ERROR', messages: 'Record update error', errors: record.errors }, status: :unprocessable_entity
    end
  end

  private

  def record_params
    params.require(:record).permit(:percentage, :user_id, :task_id)
  end
end