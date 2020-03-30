class TasksController < ApplicationController
   
  def index
    if logged_in?
     @task = current_user.tasks.build
     @tasks = current_user.tasks
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'Task が作成されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが作成されませんでした'
      render :new
    end
    
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success]='タスク更新された'
      redirect_to @task
    else
      flash.now[:danger] = 'タスク更新されない'
      render :edit
    end
  end

  def destroy
    @task=Task.find(params[:id])
    @task.destroy
    
    flash[:success]='タスクが削除されました'
    redirect_to tasks_url
  end
  def task_params
    params.require(:task).permit(:content,:status)
  end
end
