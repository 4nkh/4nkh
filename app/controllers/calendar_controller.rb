class CalendarController < ApplicationController
  def calendar
    @month = params[:month].to_i
    @year = params[:year].to_i
    @shown_month = Date.civil(@year, @month)
    @event_strips = Event.by_user(params[:id]).event_strips_for_month(@shown_month) #Event.event_strips_for_month(@shown_month)
    render :layout => false
  end
end