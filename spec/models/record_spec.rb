require 'rails_helper'
require 'faker'

RSpec.describe Record, type: :model do
  FactoryBot.create(:user)

  it 'Validates all fields presence ✓' do
    @user = create(:user)
    @task = FactoryBot.create(:task, user_id: @user.id)
    @record = FactoryBot.create(:record,
      user_id: @user.id,
      task_id: @task.id)
    expect(@task).to be_valid
    puts "
    Validates all fields presence
    --------------------------------
    User
    email: #{@user.email}
    password: #{@user.password}
    created_at: #{@user.created_at}
    updated_at: #{@user.updated_at}
    --------------------------------
    Task
    name: #{@task.name}
    description: #{@task.description}
    completion: #{@task.completion}
    user's id: #{@task.user.id}
    --------------------------------
    Record
    percentage: #{@record.percentage}
    user_id: #{@record.user_id}
    task_id: #{@record.task_id}
    --------------------------------".
    colorize(:color => :light_blue)
  end

  it 'Returns error for percentage not present ✓' do
    @user = create(:user)
    @task = FactoryBot.create(:task, user_id: @user.id)

    expect {
      create(
        FactoryBot.create(:record,
          percentage: nil,
          user_id: @user.id,
          task_id: @task.id
          ))
    }.to raise_error(ActiveRecord::RecordInvalid,
    "Validation failed: Percentage can't be blank")
    
    puts "
    Returns error for percentage not present
    --------------------------------
    User
    email: #{@user.email}
    password: #{@user.password}
    created_at: #{@user.created_at}
    updated_at: #{@user.updated_at}
    --------------------------------
    Task
    name: #{@task.name}
    description: #{@task.description}
    completion: #{@task.completion}
    user's id: #{@task.user.id}
    --------------------------------".
    colorize(:color => :red)
  end

  it 'Returns error for user id not present ✓' do
    @user = create(:user)
    @task = FactoryBot.create(:task, user_id: @user.id)

    expect {
      create(
        FactoryBot.create(:record,
        task_id: @task.id
        ))
    }.to raise_error(ActiveRecord::RecordInvalid,
    "Validation failed: User must exist")

    puts "
    Returns error for user\s id not present
    --------------------------------
    Task
    name: #{@task.name}
    description: #{@task.description}
    completion: #{@task.completion}
    user's id: #{@task.user.id}
    --------------------------------".
    colorize(:color => :red)
  end

  it 'Returns error for task\s id not present ✓' do
    @user = create(:user)

    expect {
      create(
        FactoryBot.create(:record,
        user_id: @user.id))
    }.to raise_error(ActiveRecord::RecordInvalid,
    "Validation failed: Task must exist")

    puts "
    Returns error for task\s id not present
    --------------------------------
    User
    email: #{@user.email}
    password: #{@user.password}
    created_at: #{@user.created_at}
    updated_at: #{@user.updated_at}
    --------------------------------".
    colorize(:color => :red)
  end
end