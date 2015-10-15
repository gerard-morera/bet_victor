require 'rails_helper'

RSpec.describe "CanGetOutcomes", type: :request do
  describe "GET /can_get_outcomes" do

    let(:content_instance) { double 'content_instance' }
    let(:content) do 
      {"version"=>"9", "sports"=>[{"id"=>101, "title"=>"Football", "events"=>[{"event_id"=>1728292, "outcomes" => [{"outcome_id" => "111"}, {"outcome_id" => "222"}]}, {"event_id"=>23873287}]}, {"id"=>100, "title"=>"Tenis"}]}
    end

    before do 
      allow(BetVictor::Content).to receive(:new).
        and_return(content_instance)
      allow(content_instance).to receive(:get).
        and_return(content)
    end
    it "works! (now write some real specs)" do
      get sport_event_outcomes_path(:event_id => "1728292", :sport_id => "101")
      expect(response).to have_http_status(200)
    end

    it "works! (now write some real specs)" do
      get sport_event_outcomes_path(:event_id => "1728292", :sport_id => "101")
      expect(response.body).to eq("[{\"outcome_id\":\"111\"},{\"outcome_id\":\"222\"}]")
    end
  end
end
