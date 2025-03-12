*** Settings ***
Resource    ../base.resource

*** Keywords ***
Click In Create Contact
    Click in Element  	 ${contacts.${PLATFORM_NAME}.createContactButton}

Validate Contact
    Wait Until Element Is Visible 	    ${contacts.${PLATFORM_NAME}.searchContactsBar}
    Page Should Contain List 	        ${contacts.${PLATFORM_NAME}.listContacts}
    Page Should Contain Text 	        ${contact.firstName} ${contact.lastName}

Click in Contact
    Wait Until Element Is Visible 	    ${contacts.${PLATFORM_NAME}.searchContactsBar}
    Click in Element Xpath              ${contacts.${PLATFORM_NAME}.nameContact}                ${contact.firstName} ${contact.lastName}

Validate existence of a contact
    Page Should Not Contain Text 	    ${contact.firstName} ${contact.lastName} 