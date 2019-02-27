# How to set up Cookie Control on an R Shiny web app

## The law
A number of laws regulate how data can and cannot be used.

### The GDPR
[The GDPR](https://ico.org.uk/for-organisations/guide-to-data-protection/guide-to-the-general-data-protection-regulation-gdpr/key-definitions/what-is-personal-data/) applies to the processing of personal data. The guide assumes one of these apply:

- Your shiny app is not being used to process personal data
- Your shiny app processes personal data in compliance with the GDPR

### The PECR

[The PECR](https://ico.org.uk/for-organisations/guide-to-pecr/) give people specific privacy rights in relation to electronic communications. There are specific [rules on cookies](https://ico.org.uk/for-organisations/guide-to-pecr/cookies-and-similar-technologies/):

- tell people the cookies are there
- explain what the cookies are doing and why
- get the person’s consent to store a cookie on their device

This guide explains how to set up a cookie tool in a shiny app to comply with the last rule above (specifically [Cookie Control](https://www.civicuk.com/cookie-control/)).
