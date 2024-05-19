class SchedulesController < ApplicationController
  
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :startdate, :enddate, :allday, :memo))
    if @schedule.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :schedules
    else
      flash[:notice] = "スケジュールの登録に失敗しました"
      render "new"
    end

  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    p = params.require(:schedule).permit(:title, :startdate, :enddate, :allday, :memo)
    puts p
    puts p.include?(:allday)
    if p.include?(:allday) == false
      p[:allday] = false
    end
    puts p
    
    if @schedule.update(p)
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :schedules
    else
      flash[:notice] = "スケジュールの更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :schedules
  end
end
