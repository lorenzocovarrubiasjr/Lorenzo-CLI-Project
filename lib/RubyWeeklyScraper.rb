#1. We need a RubyWeeklyScraper class
#2. That class needs to instantiate the the Newsletter for that issue_date
#3. We need to scrape the details of the Newsletter
#4. We need to scrape the individual articles for that newsletter and add them to that instance


class RubyWeeklyScraper

  attr_accessor :newsletter, :doc

  def initialize(issue_number)
    @newsletter = Newsletter.new
    @newsletter.issue_number = issue_number
    @doc = Nokogiri::HTML(open("http://rubyweekly.com/issues/#{issue_number}"))
  end

  def scrape
    scrape_details
    @newsletter #=> This instance should have articles & details
  end

  def scrape_details
    #populate Newsletter with more issue_date
    date = @doc.search("table.gowide.lonmo").text.gsub("Issue #{@issue_number}","")
  end

  def scrape_articles
    @doc.search("td[align= 'left'] table.gowide")[2..-1].each do |article_table|
      a = Article.new
      a.author = article_table.search("div:first").text.strip
      a.title = article_table.search("a:first").text.strip
      a.url = article_table.search("a:first").attr("href").text.strip

      @newsletter.add_article(a)
      binding.pry
    end
  end

end
