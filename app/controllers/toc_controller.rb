class TocController < ApplicationController
  def fetch_toc
    if fetch_result.code == 200
      toc_json = JSON.parse(fetch_result)

      front_matter = toc_json.filter { |item| item["type"] == "front_matter"}
      chapters = toc_json.filter { |item| item["type"] == "chapter"}

      element_base_url = "https://scholar.flatworldknowledge.com/books/#{book_id}/"

      flash[:notice] = "Book found!"
      render partial: "contents", locals: { front_matter: front_matter, chapters: chapters, url: element_base_url }
    else
      flash[:alert] = "Book not found."
      render partial: "contents"
    end
  end

  private
  def book_id
    @book_id ||= params[:book_id]
  end

  def fetch_result
    TocFetcher.new(book_id: book_id).get_json
  end
end
