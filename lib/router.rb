module Router
  @@routes = {}

  def self.resolve(req, res)
    path = @@routes[req.path]
    return nil unless path

    method = path[req.verb]
    method&.call(req, res)
  end

  def self.get(route, controller, method)
    def_route(route, controller, method, 'GET')
  end

  def self.post(route, controller, method)
    def_route(route, controller, method, 'POST')
  end
  
  def self.put(route, controller, method)
    def_route(route, controller, method, 'PUT')
  end

  def self.delete(route, controller, method)
    def_route(route, controller, method, 'DELETE')
  end


  def self.def_route(route, controller, method, verb)
    @@routes[route] = {} unless @@routes[route]
    @@routes[route][verb] = controller.method(method)
  end
end
