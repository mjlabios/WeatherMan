# WeatherMan
### Hourly Weather Man App


## Assumptions Made:

1. Time range used is hourly instead of daily. Due to the accuweather account being "limited trial" only up to 12hr can be called using the API Key.

2. Data in the forecasts used are the EpochDateTime, ImageIcon, IconPhrase and MobileLink.

3. No internet connection handling.

4. "Limited trial" accounts have a limit of 50 calls per day. Will be unable to display further calls after that, "No Data Fetched" will be displayed. [Link Here](https://developer.accuweather.com/packages)

5. Supports iPhones with resolutions of 1334x750 and above.

6. The only third-party pod used is Alamofire as it is well maintained and provides convenience for requests.

7. Designed my own assets.

8. Portrait-mode only.

9. Used own assets to minimize calls.

10. Temperature converted to Celcius. 

11. Epoch time converted to 12-hour time format.

12. Used phone default browser instead of WKWebView for viewing "MobileLink". No advantage in using WKWebView for viewing weather summary. Reasons: Faster load time, universal back navigation to app, security.

