*** Settings ***
Resource    ../base.resource

*** Keywords ***
Validate Title
    Validate Element    ${createContact.${PLATFORM_NAME}.pageTitle}     Create contact

Save Contact Create
    Click in Element    ${createContact.${PLATFORM_NAME}.saveButton}

Cancel Create Contact
    Click in Element    ${createContact.${PLATFORM_NAME}.cancelButton}

Fill in form field
    [Arguments]         ${elements}     ${param}    ${text}
    Write in Element    ${elements}     ${param}    ${text}

Select option Label dropdown
    [Arguments]         ${element}          ${paramElement}     ${paramSpinner}
    Select Dropdown     ${element}          ${paramElement}     ${paramSpinner}

Fill in Significant date
    [Arguments]         ${element}          ${paramElement}     ${datepicker}      ${paramDate}     ${paramMonth}   ${paramYear}
    Select DatePicker   ${element}          ${paramElement}     ${datepicker}      ${paramDate}     ${paramMonth}   ${paramYear}

Set date in Significant date
    Click in Element  ${createContact.${PLATFORM_NAME}.setSignificanteDatePickerButton}

Fill out the entire form
    ${contact}    Create Contact Fake
    Set Global Variable    ${CONTACT}    ${contact}
    Validate Title
    Fill in form field                  ${createContact.${PLATFORM_NAME}.formField}                     First name                      ${contact.firstName}
    Fill in form field                  ${createContact.${PLATFORM_NAME}.formField}                     Last name                       ${contact.lastName}
    Fill in form field                  ${createContact.${PLATFORM_NAME}.formField}                     Company                         ${contact.company}
    Fill in form field                  ${createContact.${PLATFORM_NAME}.formField}                     Phone                           ${contact.phone}
    Fill in form field                  ${createContact.${PLATFORM_NAME}.formField}                     Email                           ${contact.email}

Click in Save Create Contact
    Capture Page Screenshot
    Save Contact Create