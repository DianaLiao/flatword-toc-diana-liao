class TocFetcher
  BASE_TOC_URL = "https://s3.amazonaws.com/tocs.flatworldknowledge.com/"

  def initialize(book_id:)
    @book_id = book_id
  end

  def get_json
    RestClient.get(BASE_TOC_URL + "#{@book_id}.json")
  end
end