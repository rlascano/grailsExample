package org.rodrigo

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class PhoneController {

    PhoneService phoneService
    ContactService contactService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond phoneService.list(params), model:[phoneCount: phoneService.count()]
    }

    def show(Long id) {
        respond phoneService.get(id)
    }

    def create() {
        respond new Phone(params)
    }

    def save(Phone phone, Long contactId) {
        if (phone == null) {
            notFound()
            return
        }

        def contact = contactService.get(contactId)

        try {
            phone.contact = contact
            phoneService.save(phone)
        } catch (ValidationException e) {
            respond phone.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'phone.label', default: 'Phone'), phone.id])
                redirect contact
            }
            '*' { respond phone, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond phoneService.get(id)
    }

    def update(Phone phone) {
        if (phone == null) {
            notFound()
            return
        }

        def contact = contactService.get(phone.contact.id)

        try {
            phoneService.save(phone)
        } catch (ValidationException e) {
            respond phone.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'phone.label', default: 'Phone'), phone.id])
                redirect contact
            }
            '*'{ respond phone, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        def contact = phoneService.get(id).contact.id
        phoneService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'phone.label', default: 'Phone'), id])
                redirect contactService.get(contact)
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'phone.label', default: 'Phone'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
