# Worker.run('/some/task', { :id => 100 }, { :tags => 'production' })
class Worker
  HEADERS = {
    'Content-Type' => 'application/json'
  }

  class << self
    def run(route, payload = {}, options = {})
      request = {
        :payload => payload,
        :options => options
      }

      # PUT the request to the remote mapper
      Net::HTTP.start(self.mapper.host, self.mapper.port) do |http|
        http.request(Net::HTTP::Put.new(route, HEADERS), request.to_json)
      end
    end

    def mapper
      @mapper ||= URI.parse("http://localhost:18450")
    end

    def mapper=(mapper)
      @mapper = URI.parse(mapper)
    end
  end
end
