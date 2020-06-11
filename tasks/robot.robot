*** Settings ***
Documentation   Searches Georgia UCC database
Resource        keywords.robot
Library         RPA.Browser
Library         OperatingSystem
Variables       variables.py

Suite Teardown  Teardown Actions


*** Task ***
Search for a Federal Tax Lien
    Open State of GA UCC Search
    Login to GA UCC Search          ${GA_UCC_USERNAME}      ${GA_UCC_PASSWORD}
    Search for federal tax lien on business     Plumbing
    Check for any results

