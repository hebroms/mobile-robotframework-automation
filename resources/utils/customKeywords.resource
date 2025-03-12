*** Settings ***
Resource    ../base.resource

*** Variables ***
@{MONTH}    Jan    Feb    Mar    Apr    May    Jun    Jul    Aug    Sep    Oct    Nov    Dec

*** Keywords ***
Select Random Option In Spinner
    [Arguments]         ${spinner_xpath}
    Click Element       ${spinner_xpath}
    @{options}          Get Webelements         //${PLATFORM_NAME}.widget.CheckedTextView
    ${qtd}              Get Length              ${options}
    ${index}            Evaluate                random.randint(0, ${qtd} - 1)               random
    Click Element       ${options}[${index}]

Convert month number to month name
    [Arguments]         ${numberMonth}
    ${monthIndex}       Evaluate                int('${numberMonth}') - 1
    ${nameMonth}        Get From List           ${MONTH}                    ${monthIndex}
    RETURN              ${nameMonth}

Select Date In DatePicker
    [Arguments]    ${elementDatapicker}         ${elementData}      ${target_day}    ${target_month}    ${target_year}

    # Seleciona o mês
    ${current_month}=    Get Text    ${elementDatapicker}[1]
    WHILE    '${current_month}' != '${target_month}'
        Click Element    ${elementData}[1]
        ${current_month}=    Get Text    ${elementDatapicker}[1]
    END

    # Seleciona o dia
    ${current_day}=    Get Text    ${elementDatapicker}[2]
    WHILE    '${current_day}' != '${target_day}'
        Click Element    ${elementData}
        ${current_day}=    Get Text    ${elementDatapicker}[2]
    END

    # Seleciona o ano
    ${current_year}=    Get Text    ${elementDatapicker}[3]
    WHILE    '${current_year}' != '${target_year}'
        Click Element    ${elementData}[1]
        ${current_year}=    Get Text    ${elementDatapicker}[3]
    END
