package org.rodrigo

import grails.gorm.services.Service

@Service(Contact)
interface ContactService {

    Contact get(Serializable id)

    List<Contact> list(Map args)

    List<Contact> findBySurname(String surname)

    Long count()

    void delete(Serializable id)

    Contact save(Contact contact)

}
