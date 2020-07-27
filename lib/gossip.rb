class Gossip
  attr_accessor :author, :content, :array
  def initialize(author, content)
    @author = author
    @content = content
    @array = [@author, @content]
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << @array
      end
  end

  def self.all
  	  all_gossips = []
  	  CSV.parse(File.open("db/gossip.csv", "r+").read).each do |ligne|
  	  	one_gossip = Gossip.new(ligne[0], ligne[1])
  	  	all_gossips << one_gossip
  	   end
    return all_gossips
  end

  def self.find(id)
    return Gossip.all[id.to_i - 1]
  end
end
