require "rails_helper"

describe "TocFetcher", type: :service do
  context '#call' do
    let(:book_id) { 35880 }
    subject { TocFetcher.new(book_id: book_id).get_json }

    it "successfully returns" do
      expect(subject.code).to be(200)
    end

    it "returns a JSON-like body" do
      expect(JSON.parse(subject.body)).to be_an_instance_of(Array)
    end
  end
end