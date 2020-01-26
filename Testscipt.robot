*** Settings ***
Library  Selenium2Library

*** Variables ***
${signup}  //*[@id="__next"]/div/header/nav/ul[2]/li[2]
${signupPage}  //*[@id="__next"]/div/header/div[3]/div[2]/div[1]/h6
${yourname}  //*[@id="full_name"]
${email}  //*[@id="email"]
${password}  //*[@id="password"]
${accepterm}  //*[@id="accept_terms"]
${createMyAccount}  //*[@id="submit_button"]
${verifySingupSuccessUsername}  /html/body/div[2]/div[1]/h1  //Hi, testqwerty11!
${verifyLetgoButton}  /html/body/div[2]/div[1]/button
${verifySelectThemAfterSignin}  /html/body/div[2]/div[2]/h1 /*Pick your theme:*/
${verifyThemTodolist}  /html/body/div[2]/div[2]/div/ul/li[1]
${verifyThemDark}  /html/body/div[2]/div[2]/div/ul/li[2]
${verifyThemNeutal}  /html/body/div[2]/div[2]/div/ul/li[3]
${verifyThemTangerine}  /html/body/div[2]/div[2]/div/ul/li[4]
${verifyCreateMyTodoList}  /html/body/div[2]/div[2]/button
${verifyAllset}  /html/body/div[2]/div[3]/h1 
${verifyFirstLogin}  //*[@id="editor"]/div/div[1]/ul/li[2]/div/div[1]/div/button/span //Welcome! Let’s get started with a few tips
${verifyLoginSettingMenu}  //*[@id="gear_holder"]
${verifyLoginSettingButton}  /html/body/div[14]/div/div[2]/div[2]
${verifyName}  //*[@id="personal_info"]/dd/span
${verifyEmail}  //*[@id="login_info"]/dl[1]/dd/span

${loginGmail}  /html/body/div[1]/div[1]/button  ## //button[@class="ist_button ist_button_google"]
${loginFacebook}  //button[@class="ist_button ist_button_facebook"]
${butonAgreeTerm}  //*[@id="accept_terms"]

${verifyOpenMyTodolist}  /html/body/div[2]/div[3]/a
${verifyLoginSuccessListMenu}  list_holder
${verifyMainPage}  //*[@id="__next"]/div/section[1]/div[1]/h1

*** Keywords ***
Open Todolist Chrome Full Window
    Open Browser  https://todoist.com/	Chrome
    Maximize Browser Window

Click
    [Arguments]  ${Element}
    ## Wait Until Page Contains  ${Element}  10
    Click Element  ${Element}

Element Should Exist
    [Arguments]  ${Element}
    Wait Until Element Is Visible  ${Element}  10

Verify Login Page
    Page Should Contain Element  ${signupPage}  Sign up in seconds
    Selenium2Library.Log Source
    ## Element Should Exist  ${yourname}
    ## Element Should Exist  ${email}
    ## Element Should Exist  ${password}
    ## Element Should Exist  ${accepterm}
    ## Element Should Exist  ${createMyAccount}

Verify Main Page
    Page Should Contain Element  ${verifyMainPage}  Organize it all\nwith Todoist

*** Test Cases ***
Regis & Login flow with email and password
    Open Todolist Chrome Full Window
    Verify Main Page
    Click  ${signup}
    Verify Login Page
    Click  /html/body/div[1]/div[1]/button/img
    [Teardown]  Close Browser

