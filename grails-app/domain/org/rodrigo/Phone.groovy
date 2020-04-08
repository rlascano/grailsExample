package org.rodrigo

class Phone {

    String description
    String number

    static belongsTo = [contact:Contact]

    static constraints = {
    }
}
