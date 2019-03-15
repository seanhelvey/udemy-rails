require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
    describe '#index' do
        it 'should return success response' do
            get :index
            expect(response).to have_http_status(:ok)
        end
    end

    describe '#index' do
        it 'should return properly formatted json' do
            create_list :article, 2
            get :index
            json = JSON.parse(response.body)
            json_data = json['data']
            expect(json_data.length).to eq(2)
            expect(json_data[0]['attributes']).to eq({
                "title" => "My awesome title 1",
                "content" => "My awesome content 1",
                "slug" => "my-awesome-slug-1"
            })
            expect(json_data[1]['attributes']).to eq({
                "title" => "My awesome title 2",
                "content" => "My awesome content 2",
                "slug" => "my-awesome-slug-2"
            })
        end
    end

end
