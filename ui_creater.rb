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
    return [] unless File.exist?("./data-controler/data/#{file}.json")

    File.open("./data-controler/data/#{file}.json", 'r') do |f|
      data = JSON.parse(f.read)
      return data
    end
  end

  def finder(arr)
    i = gets.chomp.to_i
    arr[i]
  end

  def book_table
    title1 = 'Book Shelf'
    line1 = ''
    @books.each_with_index do |book, index|
      line1 += "#{index} Title #{book['title'].upcase}, authored by #{book['author'].upcase} \n"
    end
    table_ui(title1, line1)
  end
end
