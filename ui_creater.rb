class UiCreater
  def ui_creater(prop)
    puts "-----------------------------------------\n#{prop} \n-----------------------------------------"
  end

  def title_ui(title = '')
    puts "******* Select an Option #{title} *******"
  end

  def table_ui(table_title, line)
    puts "========================== #{table_title} =========================="
    puts line
    puts '========================== *************** =========================='
  end

  def create_a_person_ui
    puts '1. To create a student'
    puts '2. To create a teacher'
    print 'Enter the option : '
  end
end
