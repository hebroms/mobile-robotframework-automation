*** Settings ***
Resource    ../base.resource

*** Keywords ***
Click in Element
    [Arguments]                      ${element}
    Wait Until Element Is Visible 	 ${element}
    Click Element 	                 ${element}

Click in Element Xpath
    [Arguments]                      ${element}          ${param}
    Wait Until Element Is Visible 	 ${element.format(param='${param}')}
    Click Element 	                 ${element.format(param='${param}')}

Write in Element
    [Arguments]                      ${element}          ${param}           ${text}
    Wait Until Element Is Visible 	 ${element.format(param='${param}')}
    Input Text 	                     locator=${element.format(param='${param}')} 	 text=${text}


Select Dropdown
    [Arguments]                      ${element}          ${paramElement}     ${paramSpinner}
    Click in Element Xpath           ${element}          ${paramElement}
    Click Text                       ${paramSpinner}

Select DatePicker
    [Arguments]                      ${element}          ${paramElement}     ${datepicker}      ${paramDate}     ${paramMonth}   ${paramYear}
    Click in Element Xpath           ${element}          ${paramElement}
    Click in Element Xpath           ${datepicker}       ${paramDate}
    Click in Element Xpath           ${datepicker}       ${paramMonth}
    Click in Element Xpath           ${datepicker}       ${paramYear}

Validate Element
    [Arguments]     ${element}      ${text}
    Wait Until Element Is Visible 	 ${element}
    Element Should Contain Text 	 ${element} 	 ${text}

Validate Element Xpath
    [Arguments]     ${element}  ${param}    ${text}
    Wait Until Element Is Visible 	 ${element.format(param='${param}')}
    Element Should Contain Text 	 ${element.format(param='${param}')} 	 ${text}