require 'json'
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
  
  def data_loader(file)
    if File.exist?("./data-controler/data/#{file}.json")
        File.open("./data-controler/data/#{file}.json", 'r') do |f|
        data = JSON.parse(f.read)
        return data
      end
    else
      return []
    end
  end
end
