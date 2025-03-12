*** Settings ***
Resource    ../base.resource

*** Keywords ***
Close Banner If Exists
    ${isVisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${viewContact.${PLATFORM_NAME}.closeBannerButton}    timeout=5s
    Run Keyword If    ${isVisible}    Click Element    ${viewContact.${PLATFORM_NAME}.closeBannerButton}

Click return Page Contacts
    Click Element 	                ${viewContact.${PLATFORM_NAME}.navigateUpButton}

Click in edit contact
    Click in Element 	            ${viewContact.${PLATFORM_NAME}.editContactButton}

Click action bar
    Click Element 	                ${viewContact.${PLATFORM_NAME}.actionMenuBar}

Click delete contact
    Click Text 	                Delete

Click confirm delete
    Click Element 	                ${viewContact.${PLATFORM_NAME}.deleteButton}

Click in delete contact
    Click action bar
    Click delete contact
    Click confirm delete

Validate view Contact
    Close Banner If Exists
    Page Should Contain Text 	    ${contact.firstName} ${contact.lastName}
    Page Should Contain Text 	    ${contact.phone}
    Page Should Contain Text 	    ${contact.email}
    Page Should Contain Text 	    ${contact.company}
    Capture Page Screenshot
    Click return Page Contacts

Return Page Contacts
    Click return Page Contacts