package phonebook

import org.rodrigo.*

class BootStrap {

    def init = { servletContext ->
      100.times {
        Collections.shuffle(nombres)
        Collections.shuffle(apellidos)
        def contact = new Contact(name: nombres.first(), surname: apellidos.first())
        descriptions.each {
          contact.addToPhones(new Phone(description: it, number: '12345'))
        }
        contact.save()
      }
    }
    def destroy = {
    }

    def nombres = ['Rodrigo', 'Juan', 'Pedro', 'Silvana', 'Jorge', 'Javier', 'Alejandro', 'Marcos', 'Pablo',
    'José', 'Luis', 'Dario', 'Roberto', 'Omar', 'Fabian', 'Rodolfo', 'Sebastian', 'Mariano']
    def apellidos = ['Perez', 'Lopez', 'Lascano', 'Rodriguez', 'Gonzalez', 'Pereyra', 'Ledesma', 'Fonseca',
    'Borsotto', 'Juarez', 'Trejo', 'Ferreti', 'Palmiero', 'Lorio', 'Ferrero']
    def descriptions = ['Casa', 'Trabajo', 'Celular']
}
