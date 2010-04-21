module AthletesHelper
  def format_hhmm(hours)
    minutes = (hours * 60).to_i
    "%d:%.2d" % [minutes / 60, minutes % 60]
  end
  
  def plot_hours_graph(athlete)
    data = []
    x_axis_labels = []
    7.downto(0) do |number|
      data << athlete.log_entries.total_hours_for(number.days.ago)
      x_axis_labels << number.days.ago.strftime("%a %d")
    end
    x_axis_labels[-1] = "Today"
    x_axis_labels[-2] = "Yesterday"
    
    y_axis_labels = [format_hhmm(0), format_hhmm(data.max)]

    Gchart.bar(:data => data, :title => "Workout time in the last week",
               :axis_with_labels => ["y,x"],
               :axis_labels => [y_axis_labels, x_axis_labels],
               :bar_width_and_spacing => [25,30],
               :size => "600x200")
  end
end
