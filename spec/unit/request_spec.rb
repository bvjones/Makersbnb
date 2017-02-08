describe 'Request' do

  let(:name) { "Pedro's House" }
  let(:description) { "Very nice" }
  let(:price) { 200 }
  let(:from) { "20/03/2017" }
  let(:to) { "20/02/2017" }

  describe "making a request" do

    it 'increases the request count by 1' do
      sign_up
      create_new_space(name: name, description: description, price: price, from: from, to: to)
      user_id = User.first.id
      space_id = Space.first.id
      Request.create(date: '12/7/2017', status: :unconfirmed, user_id: user_id, space_id: space_id)
      expect(Request.count).to eq 1
    end
  end
end
