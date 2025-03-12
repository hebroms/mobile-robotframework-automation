*** Settings ***
Resource    ../base.resource

*** Keywords ***
Validate Title Edit
    Validate Element 	 ${editContact.${PLATFORM_NAME}.pageTitle} 	 Edit contact

Save Edit Contact
    Click in Element     ${editContact.${PLATFORM_NAME}.saveButton}

Cancel Edit Contact
    Click in Element     ${editContact.${PLATFORM_NAME}.cancelButton}

Edit fill in field
    [Arguments]         ${elements}     ${param}    ${text}
    Write in Element    ${elements}     ${param}    ${text}


Change information
    ${changeContact}    Create Contact Fake
    Set Global Variable    ${CHANGECONTACT}    ${changeContact}

    Edit fill in field      ${createContact.${PLATFORM_NAME}.formField}    ${contact.firstName}    ${changeContact.firstName}
    Set To Dictionary       ${contact}                                     firstName=${changeContact.firstName}

    Edit fill in field      ${createContact.${PLATFORM_NAME}.formField}    ${contact.lastName}    ${changeContact.lastName}
    Set To Dictionary       ${contact}                                     lastName=${changeContact.lastName}

    Edit fill in field      ${createContact.${PLATFORM_NAME}.formField}    ${contact.company}    ${changeContact.company}
    Set To Dictionary       ${contact}                                     company=${changeContact.company}

    Edit fill in field      ${createContact.${PLATFORM_NAME}.formField}    ${contact.phone}    ${changeContact.phone}
    Set To Dictionary       ${contact}                                     phone=${changeContact.phone}

    Fill in form field      ${createContact.${PLATFORM_NAME}.formField}    ${contact.email}    ${changeContact.email}
    Set To Dictionary       ${contact}                                     email=${changeContact.email}

Click in Save Edit Contact
    Capture Page Screenshot
    Save Edit Contact