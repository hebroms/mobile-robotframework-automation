*** Settings ***
Resource    ../base.resource

*** Keywords ***
Open App
    [Documentation]     Abertura do aplicativo
    Open Application
    ...    remote_url=http://localhost:4723/wd/hub
    ...    automationName=UIAutomator2
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=Pixel 9
    ...    appPackage=com.google.android.contacts
    ...    appActivity=com.google.android.contacts/com.android.contacts.activities.PeopleActivity
    ...    disebleIdLocatorAutocompletion=true
    ...    autoGrantPermissions=true