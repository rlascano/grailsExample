<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
        <g:set var="entityNamePlural" value="${message(code: 'contact.label.plural', default: 'Contacts')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-contact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityNamePlural]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-contact" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="container">
              <h2>${contact.surname} ${contact.name}</h2>
              <p class="mb-4">${contact.years()} años</p>
              <g:link controller="phone" action="create" params="[contactId: this.contact.id]" style="text-decoration: none" class="btn btn-success mb-4">Nuevo telefono</g:link>
              <table>
                <tr>
                  <th>Despcripcion</th><th>Número</th><th></th>
                </tr>
                <g:each in="${this.phones}">
                  <tr>
                    <td>
                      ${it.description}
                    </td>
                    <td>${it.number}</td>
                    <td>
                      <g:form controller="phone" action="delete" id="${it.id}" method="DELETE">
                        <g:link style="text-decoration: none" class="btn btn-secondary" controller="phone" action="edit" id="${it.id}">Editar</g:link>
                        <input class="btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                      </g:form>
                    </td>
                  </tr>
                </g:each>
              </table>
          </div>
            <g:form resource="${this.contact}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.contact}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
