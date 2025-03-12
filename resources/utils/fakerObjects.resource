*** Settings ***
Library    FakerLibrary     locale=pt_BR
Library    String
Library    Collections

*** Variables ***
@{TYPE_LIST}     Mobile    Home    Work  Other

*** Keywords ***
Create Contact Fake
    # Gerar nome aleatório e dividir em nome e sobre nome
    ${fullName}         FakerLibrary.Name
    ${names}            String.Split String    ${fullName}    ${SPACE}
    ${firstName}        Set Variable    ${names[0]}
    ${lastName}         Set Variable    ${names[1]}

    ${email}            FakerLibrary.Email

    # Gerar telefone e aplicar máscara
    ${number}                Generate Random String    11    [NUMBERS]
    ${phone}                 Format String    ({}) {}-{}    ${number[0:2]}    ${number[2:7]}    ${number[7:11]}

    ${company}               FakerLibrary.Company

    # Escolher aleatório
    ${randomIndexEmail}      Evaluate    random.randint(0, len(${TYPE_LIST}) - 1)    random
    ${typeEmail}             Get From List    ${TYPE_LIST}    ${randomIndexEmail}
    ${randomIndexPhone}      Evaluate    random.randint(0, len(${TYPE_LIST}) - 1)    random
    ${typePhone}             Get From List    ${TYPE_LIST}    ${randomIndexPhone}

    # Gerar data de nascimento
    ${generateDateBirth}                 FakerLibrary.Date        pattern=%d/%m/%Y
    @{dateSplit}                         Split String             ${generateDateBirth}    /
    ${dateBirthDay}                      Set Variable             ${dateSplit}[0]
    ${numMonth}                          Set Variable             ${dateSplit}[1]
    ${dateBirthYear}                     Set Variable             ${dateSplit}[2]
    ${dateBirthNameMonth}                Convert month number to month name  ${numMonth}


    &{CONTACT}      Create Dictionary
    ...             firstName=${firstName}
    ...             lastName=${lastName}
    ...             typeEmail=${typeEmail}
    ...             email=${email}
    ...             typePhone=${typePhone}
    ...             phone=${phone}
    ...             dateBirth=${generateDateBirth}
    ...             dateBirthNameMonth=${dateBirthNameMonth}
    ...             dateBirthDay=${dateBirthDay}
    ...             dateBirthYear=${dateBirthYear}
    ...             company=${company}

    RETURN      ${CONTACT}