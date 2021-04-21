require 'pg'

class Entry 

  def self.all 
    begin
      con = PG.connect :dbname => 'diary'
      rs = con.exec "SELECT * FROM entries"
      rs.map { |entry| "#{entry['title']} #{entry['entry']}"}
    rescue PG::Error => e
      puts e.message 
    ensure
      rs.clear if rs
      con.close if con 
    end
  end

  def self.create(entry)


  end

end