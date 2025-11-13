*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BaseURL}    https://rahulshettyacademy.com



&{ADD_BOOK_BODY}    name=Learn Appium Automation with Java    isbn=121    aisle=123    author=John foe
${BOOK_ID} =    121123
&{BOOK_ID_DELETE}    ID=121123


*** Test Cases ***
ADD_BOOK_API_TEST:
    Create Session  mysession    ${BaseURL}
    ${RESPONSE}=    POST Request    mysession    /Library/Addbook.php    json=${ADD_BOOK_BODY}
    Should Be Equal As Integers    200    ${RESPONSE.status_code}
    Log    ${RESPONSE.status_code}

GET_BOOK_API_TEST:
    Create Session    mysession    ${BaseURL}
    ${RESPONSE}=    GET Request    mysession    /Library/GetBook.php?ID=${BOOK_ID}
    Should Be Equal As Integers    200    ${RESPONSE.status_code}
    Log    ${RESPONSE.status_code}    

DELETE_BOOK_API_TEST:
    Create Session    mysession    ${BaseURL}
    ${RESPONSE}=    Delete Request    mysession   /Library/DeleteBook.php    json=${BOOK_ID_DELETE}
    Should Be Equal As Integers    200    ${RESPONSE.status_code}
    Log    ${RESPONSE.status_code}