# -*- encoding : utf-8 -*-
# support/her_api.rbj

# Her setup
Her::API.setup url: 'https://api.example.com' do |c|
  # Request
  c.use Faraday::Request::UrlEncoded

  # Response
  c.use Her::Paginated::HeaderParser
  c.use Her::Middleware::DefaultParseJSON

  # Adapter
  c.adapter :test do |stub|
    stub.get("/champions") do |env|
      champions = [
        { id: 1, name: 'Aatrox'},
        { id: 2, name: 'Ahri'},
        { id: 3, name: 'Akali'},
        { id: 4, name: 'Alistar' },
        { id: 5, name: 'Amumu' },
        { id: 6, name: 'Anivia' },
        { id: 7, name: 'Annie' },
        { id: 8, name: 'Ashe' },
        { id: 9, name: 'Azir' }
      ]
      page = env.params[:page] || 1
      per_page = env.params[:per_page] || 5
      headers = {
        'x-total' => champions.size,
        'x-page' => page,
        'x-per-page' => per_page
      }
      [200, headers, champions.to_json]
    end
  end
end
