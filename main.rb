require './music_album'
require './music_data'
require './genre'
require './book'
require './book_data'
require './game'
require './game_data'
require './item_data'

class Main
  def display_menu
    puts 'Please choose an option to enter in a number'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List of games'
    puts '5. List all genres (e.g. "Hip Hop", "Rock")'
    puts '6. List all labels (e.g. "Gift", "New")'
    puts '7. List all authors (e.g. "Stephen King", "J.K. Rowling")'
    puts '8. List all sources (e.g. "From a friend", "Amazon")'
    puts '9. Add a book'
    puts '10. Add a music album'
    puts '11. Add a game'
    puts '12. Exit'
  end

  def init_hash
    {
      1 => proc {
             puts ItemData.load('book')
           },
      2 => proc {
             puts ItemData.load('music_album')
           },
      3 => proc {
              puts ItemData.load('game')
            },
      9 => proc {
             ItemData.add_item('book', Book.create_from_ui)
             puts 'Book added'
           },
      10 => proc {
              ItemData.add_item('music_album', MusicAlbum.create_from_ui)
              puts 'Music album added'
            },
      11 => proc {
              ItemData.add_item('game', Game.create_from_ui)
              puts 'Game added'
            },
      12 => proc {
        puts 'Thank you for using this app!'
        exit
      }
    }
  end

  def run
    puts 'Welcome to Catologue App'

    loop do
      display_menu
      option = gets.chomp.to_i

      puts init_hash[option].call
      puts "\n"
    end
  end
end

Main.new.run
