require 'pg'

class Bookmark
  attr_reader :name

  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  def initialize(name)
    @name = name
  end

end
