class TasksController < ApplicationController
    
    #一覧を表示
    def index
        @tasks = Task.all
	end
	
	#詳細ページ
	def show
	    @task = Task.find(params[:id])
	end
	
	#新規作成ページ
	def new
	    @task = Task.new
	end
	
	#作成
	def create
	    @task = Task.new(task_params)
	    
	    if @task.save
	        flash[:success] = "正常に登録されました"
	        redirect_to @task
	    else
	        flash.now[:danger] = '登録できませんでした'
	        render :new
	    end
	end
	
	#編集
	def edit
	    @task = Task.find(params[:id])
	end
	
	#更新
	def update
	    @task = Task.find(params[:id])
	    
	    if @task.update(task_params)
	        flash[:success] = "正常に更新されました"
	        redirect_to @task
	    else
	        flash.now[:danger] = '更新できませんでした'
	        render :edit
	    end
	end
	
	#削除
	def destroy
	    @task = Task.find(params[:id])
	    @task.destroy
	    flash[:success] = "削除されました"
	    redirect_to tasks_url
	end
	
	private
	
	# Strong Parameter
	def task_params
		params.require(:task).permit(:content, :status)
	end
	
end
