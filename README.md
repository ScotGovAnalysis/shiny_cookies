# How to add Cookie Control to an R Shiny app

[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

## Introduction

Google Analytics (GA) is commonly used with Shiny apps to measure user-interactions. Since GA uses cookies to  "remember" what a user has done, it is important to comply with relevant legislation when using this technology.

This guide explains how to set up a cookie tool ([Cookie Control](https://www.civicuk.com/cookie-control/)) in your Shiny app so users can control whether cookies are stored on their device. It includes the source code for [this example Shiny app](https://jsphdms.shinyapps.io/shiny_app_with_cookie_control/) that uses GA. The general idea should work for other 3rd party tools such as [Mouseflow](https://mouseflow.com/).

The important bits are in [ui.R](https://github.com/jsphdms/shiny_cookies/blob/master/ui.R) and the Cookie Control [configuration](https://github.com/jsphdms/shiny_cookies/blob/master/www/cookie_control_config.js). You can see a practical application of this approach in the Scottish Government's [Equality Evidence Finder](https://scotland.shinyapps.io/sg-equality-evidence-finder/).

## Caveats
- This is not legal advice and I am not an expert in this area of the law or on cookies
- Following these instructions will not necessarily make your use of cookies compliant with the law

## The law
A number of laws regulate how data can and cannot be used:

[The GDPR](https://ico.org.uk/for-organisations/guide-to-data-protection/guide-to-the-general-data-protection-regulation-gdpr/key-definitions/what-is-personal-data/) applies to the processing of personal data. This guide assumes one of these apply:

- Your Shiny app is not being used to process personal data
- Your Shiny app processes personal data in compliance with the GDPR

[The PECR](https://ico.org.uk/for-organisations/guide-to-pecr/) give people specific privacy rights in relation to electronic communications. There are specific [rules on cookies](https://ico.org.uk/for-organisations/guide-to-pecr/cookies-and-similar-technologies/):

- tell people the cookies are there
- explain what the cookies are doing and why
- get the person’s consent to store a cookie on their device

## Steps

1. [build a Shiny app](https://shiny.rstudio.com/tutorial/)
1. [add Google Analytics](https://shiny.rstudio.com/articles/usage-metrics.html)
1. [add Cookie Control](https://www.civicuk.com/cookie-control/)
    a. [set up an account](https://www.civicuk.com/cookie-control/v8/download) and specify the URL your app will be deployed to.
    a. create a `www` folder within your Shiny app directory
    a. save your Cookie Control configuration in a `.js` file in `www`. It should look something like [this](https://github.com/jsphdms/shiny_cookies/blob/master/www/cookie_control_config.js). Remember to update with your API key, product edition, and GA tracking id.
    a. Add both the Cookie Control module and your own configuration to ui.R. It should look something like [this](https://github.com/jsphdms/shiny_cookies/blob/master/ui.R).
    a. Deploy the app. Cookie Control won't work until it's deployed at the URL you specified in your online account.
    a. Confirm Cookie Control is behaving correctly. You can do this by toggling the relevant option in Cookie Control and seeing the cookies appear/dissappear on your device (in MS Edge press F12 -> Debugger -> expand Cookies). Or if you're using GA you should see a change in the number of active users in your Real-Time report.
    a. Adjust the default behaviour and appearance of Cookie Control using the [configuration options](https://www.civicuk.com/cookie-control/v8/documentation).

## Gotchas

#### Cookie Control won't show up when testing locally
The Community Edition of Cookie Control only works for one URL. This means it won't show up when you test it locally. According to Cookie Control:

>All examples [in their documentation] use our test API Key, which can be used on your localhost, or JS Fiddle to experiment with the functionality available.

I don't know how to do this. If you figure this out please let me know so I can mention it here for the benefit of others.

#### For testing you'll need a browser that isn't configured to block cookies
If your browser is configured to block cookies you probably won't be able to confirm Cookie Control is behaving correctly. Try changing the settings in your browser, or using a different browser that isn't configured to block cookies.

#### The GA Real-Time report can take a few minutes to update
GA can take a few minutes to update the number of active users in your Real-Time report. This can be a little confusing if you're expecting to see a change. Try waiting a few minutes between toggling options in Cookie Control. It might help to only test one device at a time to keep things simple.
