package phonebook

class UrlMappings {

    static mappings = {
      "/$controller/$action?/$id?(.$format)?" {
           constraints {
           // apply constraints here
           }
        }

        "/"(controller: "contact", action:"index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
