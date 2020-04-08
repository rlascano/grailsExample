<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
        <g:set var="entityNamePlural" value="${message(code: 'contact.label.plural', default: 'Contacts')}" />
        <title><g:message code="default.list.label" args="[entityNamePlural]" /></title>
    </head>
    <body>
        <a href="#list-contact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-contact" class="content scaffold-list" role="main">
            <h1 class="mb-4"><g:message code="default.list.label" args="[entityNamePlural]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="container">
              <g:form action="index" method="GET" class="mb-4 form-group row">
                <input type="text" name="q" id="q" placeholder="buscar apellido" / class="col-sm-10">
                <input type="submit" class="btn btn-primary col-sm-2"/>
              </g:form>
              <table>
                <thead>
                  <tr>
                    <th>Apellido</th>
                    <th>Nombre</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <g:each in="${contactList}">
                  <tr>
                    <td>${it.surname}</td>
                    <td>${it.name}</td>
                    <td><g:link action="show" id="${it.id}" class="btn btn-primary">Ver</g:link></td>
                  </tr>
                </g:each>
                </tbody>
              </table>
            </div>
            <g:if test="${contactCount > 10}">
              <div class="pagination">
                  <g:paginate total="${contactCount ?: 0}" />
              </div>
            </g:if>
        </div>
    </body>
</html>
