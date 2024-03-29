module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), "javascript:changeMonth(#{month_date.year}, #{month_date.month})")#index_calendar_url(month_date.year, month_date.month), :method => :post)#{:month => month_date.month, :year => month_date.year})
  end
  
  # custom options for this calendar
  def event_calendar_opts
    {
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.prev_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>"    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event = args[:event]
      %(<a href="#{post_date_url(event.start_at.to_date)}" title="view_detail..." alt="view_detail..." style="color:maroon;">#{h(event.name)}</a>)
    end
  end
end
