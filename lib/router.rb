module Router
  @@routes = {}

  def self.resolve(req, res)
    path = @@routes[req.path]
    return nil if not path

    method = path[req.verb]
    method.call(req, res) if method
  end

  def self.get(route, controller, method)
    puts controller.object_id
    self.def_route(route, controller, method, "GET")
  end

  def self.def_route(route, controller, method, verb)
    @@routes[route] = {} if not @@routes[route]
    @@routes[route][verb] = controller.method(method)
  end

end
