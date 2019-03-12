require 'rails_helper'

describe ArticlesController do
    describe '#index' do
        it 'should return success response' do
            get :index
            expect(response).to have_http_status(:ok)
        end

        it 'should return proper json' do
            create_list :article, 2
            get :index
            json = JSON.parse(response.body)
            json_data = json['data']
            expect(json_data[0]['attributes']).to eq({
                "title" => "Article 1",
                "content" => "Content 1",
                "slug" => "slug-1"
            })
        end

    end
end