class TocFetcher
  BASE_TOC_URL = "https://s3.amazonaws.com/tocs.flatworldknowledge.com/"

  def initialize(book_id:)
    @book_id = book_id
  end

  def get_json
    begin
      RestClient.get(BASE_TOC_URL + "#{@book_id}.json")
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end