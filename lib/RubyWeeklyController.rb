class RubyWeeklyController

  def initialize
    puts "Welcome to Ruby Weekly"

    s = RubyWeeklyScraper.new(300)
    @newsletter = s.scrape_details

  end

  def call
    @newsletter.articles.each.with_index(1) do |a, i|
      puts "#{i}. #{a.title}"
    end
  end
end
