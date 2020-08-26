module Api
  class User
    def initialize
      @api = ClientApi::Api.new
    end

    def create(args)
      @api.post('/api/users', { "name": args[:name], "job": args[:job] })
      @api
    end

    def update(id, args)
      @api.put("/api/users/#{id}", { "name": args[:name], "job": args[:job] })
      @api
    end

    def update_partially(id, args)
      @api.patch("/api/users/#{id}", args)
      @api
    end

    def delete(id)
      @api.delete("/api/users/#{id}")
      @api
    end

    def get(id)
      @api.get("/api/users/#{id}")
      @api
    end
  end
end