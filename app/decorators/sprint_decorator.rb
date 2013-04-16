# coding: utf-8
class SprintDecorator < Draper::Decorator
  delegate_all

  def duration
    "#{calculate_duration} (с #{model.date_begin.to_date} по #{model.date_end.to_date})"
  end

  def calculate_duration
    (model.date_end - model.date_begin).to_int/(1.day)    
  end

  def delete_link
    h.link_to "Удалить", h.sprint_path(model), method: :delete, data: { confirm: "Вы уверены?" }, class: "btn btn-primary"    
  end
  def edit_link
    h.content_tag :a, href: h.edit_sprint_path(model), class: "btn btn-primary" do 
      'Редактировать'
    end
  end
  def show_link
    h.link_to model.name, h.sprint_path(model)    
  end

  def status_class
    if status == 'Успешно'
      'info'
    elsif status == 'Провалено'
      'error'
    elsif status == 'Идет'
      'success'
    else
      'warning'
    end
  end
end
