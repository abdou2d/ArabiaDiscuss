module ApplicationHelper
  def markdown content
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      superscript: true,
      space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end
  def time_ago_in_arabic created_at
    time_in_seconds = ( ( created_at - Time.now ).abs ).round
    time_in_minutes = (time_in_seconds.to_f / 60.0 ).round
    time_in_hours = ( time_in_minutes / 60.0 ).round
    time_in_days = ( time_in_hours.to_f / 24.0 ).round
    time_in_months = ( time_in_days.to_f / 30.0 ).round
    time_in_years = ( time_in_months.to_f / 12.0 ).round
    case time_in_minutes
      when 0
        case time_in_seconds
          when 0..1   then "قبل ثانية واحدة"
          when 2      then "قبل ثانيتين"
          when 3..10  then "قبل #{time_in_seconds} ثوان"
          when 11..50 then "قبل #{time_in_seconds} ثانية"
        end
      when 1       then "قبل دقيقة واحدة"
      when 2       then "قبل دقيقتين"
      when 3..10   then "قبل #{time_in_minutes} دقائق"
      when 11..50  then "قبل #{time_in_minutes} دقيقة"
      when 51..89  then "قبل ساعة واحدة"
      when 90..119 then "قبل أقل من ساعتين"
      when 120..1439
        case time_in_hours
          when 2      then "قبل ساعتين"
          when 3..10  then "قبل #{time_in_hours} ساعات"
          when 11..24 then "قبل #{time_in_hours} ساعة"
        end
      when 1440..2529 then "قبل يوم واحد"
      when 2530..2880 then "قبل أقل من يومين"
      when 2881..43199
        case time_in_days
          when 2 then "قبل يومين"
          when 3..10 then "قبل #{time_in_days} أيام"
          when 11..29 then "قبل #{time_in_days} يوم"
        end
      when 43200..525599
        case time_in_months
          when 0..1   then "قبل شهر واحد"
          when 2      then "قبل شهرين"
          when 3..10  then"قبل #{time_in_months} أشهر"
          when 11..12 then "قبل #{time_in_months} شهراً"
        end
      else
        case time_in_years
          when 1      then "قبل أكثر من سنة"
          when 2      then "قبل أكثر من سنتين"
          when 3..10  then "قبل #{time_in_years} سنوات"
          else
            "قبل #{time_in_years} سنة"
        end
    end
  end
end
