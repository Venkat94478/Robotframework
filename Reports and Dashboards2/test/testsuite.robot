*** Settings ***
Library           Selenium2Library    #Library    SeleniumLibrary
Library           Collections
Library           ExcelLibrary

*** Variables ***
${y}
${x}
${i}
${campaign_name}  OpenExcel.Read Cell Data By Coordinates   Campaigns    0    ${i}  
${URL}            https://www.treatmentperspectives.com/analytics/login
@{Credentials}    superadmin@treatmentperspectives.com    Swaas@321
&{LoginData}      Username=superadmin@treatmentperspectives.com    password=Swaas@321
${path_excel}     D:\\Work\\TP\\Rough\\23-09-2019\\Framework\\Test data\\ReportsandDashboards.xls
${SheetName}    Campaigns     

*** Test Cases ***
MyFirstTest
    Log    Hello World...

FirstSeleniumTest
    OpenBrowser    ${URL}    chrome
    Maximize Browser Window
    LoginKW
    Open excel
    CampaignSelect

*** Keywords ***
LoginKW
    Input Text    id=email    @{Credentials}[0]
    Input Password    id=password    @{Credentials}[1]
    Click Button    //button[@class='btn btn-primary btn-block btn-flat']
    Click Element    id=select2-main_selected_campaign-container

CampaignSelect
    
    ${campaign_name}    Read Cell Data By Coordinates    campaigns        0    1
Open excel
    ${mydata_list}=    create list
    ExcelLibrary.open Excel    ${path_excel}
    ${datasheet}    Get Sheet Names
    Log     ${datasheet}
    :For    ${i}    in range    1    3
    \    ${mydata}    Read cell data by coordinates    Campaigns    ${x}    ${y}
    \    Append to List    ${mydata_list}    ${my_data}    
     Log    ${my_data_list}  
    