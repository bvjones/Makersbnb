require 'date'
describe Space do

  let(:name) { "Pedro's House" }
  let(:description) { "Very nice" }
  let(:price) { 200 }
  let(:from) { "20/01/2017" }
  let(:to) { "20/02/2017" }

  subject(:space) { described_class.create(name: name, description: description, price: price, from: from, to: to) }

  let(:request_one) { double("Request") }
  let(:request_two) { double("Request") }
  let(:requests) { [request_one, request_two] }

  describe "#booked_dates" do
    it "returns an array of booked dates" do
      allow(space).to receive(:requests) { requests }
      allow(request_one).to receive(:status) { "confirmed" }
      allow(request_one).to receive(:date) { Date.new(2017,02,18) }
      allow(request_two).to receive(:status) { "confirmed" }
      allow(request_two).to receive(:date) { Date.new(2017,02,19) }
      expect(space.booked_dates).to eq(["18/02/2017","19/02/2017"])
    end
  end

end
