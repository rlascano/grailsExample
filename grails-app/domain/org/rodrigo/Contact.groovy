package org.rodrigo

class Contact {

    String name
    String surname
    Date birthday

    static hasMany = [phones:Phone]

    static constraints = {
      name()
      surname()
      birthday nullable: true
      phones()
    }

    static mapping = {
      sort ([surname: 'asc', name: 'asc'])
    }

    def years() {
      def today = new Date()
      def yearDiff = today.getYear() - this.birthday.getYear()
      this.birthday.setYear(today.getYear())
      if(today < this.birthday)
        yearDiff-=1

      return yearDiff
    }
}
