class InvalidType < StandardError; end

class Newsletter
  attr_accessor :issue_number, :issue_date
  attr_reader :articles

def initialize
  @articles = []
end

def articles
  @articles.dup.freeze
end

def add_article(article)
  if !article.is_a?(Article)
      raise InvalidType, "Must Be An Article"
  else
  @@articles << article
  end
end


def first_article_url
  #articles is an array
  #the first element in that array must respond to url
  self.articles.first.url
end

end
