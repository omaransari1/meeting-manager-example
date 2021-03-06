class MeetingsController < ApplicationController
  def index
    if params[:tag]
      @meetings = Tag.find_by(name: params[:tag]).meetings
    else
      @meetings = Meeting.all
    end
    render 'index.html.erb'
  end

  def new
    @meeting = Meeting.new #prevents crash
    render 'new.html.erb'
  end

  def create
    @meeting = Meeting.new(
     name: params[:name],
     address: params[:address],
     start_time: params[:start_time],
     end_time: params[:end_time],
     notes: params[:notes]
   )
    if @meeting.save
      flash[:success] = "Meeting created successfully!"
      redirect_to "/meetings/#{@meeting.id}"
    else 
      render 'new.html.erb'
    end

  end

  def show
    @meeting = Meeting.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
