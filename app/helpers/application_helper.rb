module ApplicationHelper


  def lessons_today(year, month, day)
    have_lessons=0
    all = all_lessons.map { |l|
      if l.time.month == month && l.time.day == day
        have_lessons = 1
      end
    }.flatten

    if have_lessons==1
      "Have lessons!"
    end

  end


  def event_today(year, month, day)
    have_lessons=0
    all = all_events.map { |l|
      if l.time.month == month && l.time.day == day
        have_lessons = 1
      end
    }.flatten

    if have_lessons==1
      "Have lessons!"
    end

  end



end
