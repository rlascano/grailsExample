<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'phone.label', default: 'Phone')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-phone" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link controller="contact" action="show" id="${this.phone.contact.id}">Volver</g:link></li>     
            </ul>
        </div>
        <div id="show-phone" class="content scaffold-show" role="main">
            <h1 class="mb-4"><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="container mb-4">
              <ul class="list-group">  
                <li class="list-group-item"><b>Descripcion: </b> <f:display bean="phone" property="description"/></li>
                <li class="list-group-item"><b>Número: </b> <f:display bean="phone" property="number"/></li>
              </ul>
            </div>
            <g:form resource="${this.phone}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.phone}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
