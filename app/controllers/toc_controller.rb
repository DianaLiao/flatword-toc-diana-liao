class TocController < ApplicationController
  def fetch_toc
    book_id = params[:book_id]

    toc_json = JSON.parse(TocFetcher.new(book_id: book_id).get_json)

    front_matter = toc_json.filter { |item| item["type"] == "front_matter"}
    chapters = toc_json.filter { |item| item["type"] == "chapter"}

    element_base_url = "https://scholar.flatworldknowledge.com/books/#{book_id}/"

    render partial: "contents", locals: { front_matter: front_matter, chapters: chapters, url: element_base_url }
  end
end
