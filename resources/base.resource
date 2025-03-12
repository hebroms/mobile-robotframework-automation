*** Settings ***

### Librarys
Library    AppiumLibrary    timeout=30
Library    OperatingSystem

### Utils
Resource    utils/openApp.resource
Resource    utils/fakerObjects.resource
Resource    utils/customKeywords.resource

### Elements
Variables   elements/contactsElements.yml
Variables   elements/createContactElements.yml
Variables   elements/viewContactElements.yml
Variables   elements/editContactElements.yml

### Pages
Resource    pages/basePage.resource
Resource    pages/contactsPage.resource
Resource    pages/createContactPage.resource
Resource    pages/viewContactPage.resource
Resource    pages/editContactPage.resource

*** Variables ***
${PLATFORM_NAME}    android