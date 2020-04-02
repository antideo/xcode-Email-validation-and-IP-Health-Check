<img src="https://www.antideo.com/wp-content/uploads/2020/01/logo.png" width="200" alt="Antideo Logo">

[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/PanPanayotov/antideo-xcode/master/LICENSE)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

This is xcode framework created to help developers when using [Antideo's Email Validation and IP Health Check REST API](http://antideo.com). 
Antideo helps locating IP adresses, performs reputation (health) checks on both IP and email addresses.

## Quick links
* [Installation](#installation)
* [IP info](#get-ip-info)
* [IP location](#get-ip-location)
* [IP health/reputation](#get-ip-health-result)
* [Email info/reputation](#get-email-info)
* [Helpers](#available-helper-methods)

# Installation

## Carthage
```
github "antideo/xcode"
```
## How to use
First import the framework.
``` swift
import Antideo
```

Main helper class is called ``AAHelper`` from ``Antideo Application Helper`` and here is how to use it.

### Get IP info
``` swift
AAHelper.getIPInfo("1.2.3.4") { (result, error) in
     /*
      * IP address queried 
      */
      result?.ip // -> @optional String

     /*
      * Hostname for IP address 
      */
      result?.host // -> @optional String

     /*
      * ASN Organisation's name 
      */
      result?.orgName // -> @optional String

     /*
      * ASN (autonomous system number) 
      */
      result?.asn // -> @optional String

     /*
      * Date this ASN was assigned to the organisation
      */
      result?.asnAssigned // -> @optional NSDate

     /*
      * The origination country of the organisation 
      */
      result?.country // -> @optional String

     /*
      * Issuing registry
      */
      result?.registry // -> @optional String

     /*
      * Organisation category 
      */
      result?.category // -> @optional String       
}
```
#### Available IP address categories
* hosting
* education
* bank
* mobile
* government
* undefined

Please refer to [IPInfoResult](https://github.com/antideo/xcode/blob/master/Antideo/IPInfoResult.h) class for full and up-to-date property list.



### Get IP location
``` swift
AAHelper.getIPLocation("1.2.3.4") { (result, error) in
     /*
      * IP address for the location result 
      */
      result?.ip // -> @optional String 
      
     /*
      * Latitude value from the Geolocation 
      */
      result?.latitude // -> @optional Number
     
     /*
      * Longitude value from the Geolocation 
      */
      result?.longitude // -> @optional Number
      
     /*
      * Accuracy level of returned location
      * Number between 0 and 1000
      */
      result?.accuracy // -> @optional Number
      
     /*
      * City of IP address 
      */
      result?.city // -> @optional String
      
     /*
      * Region of IP address 
      */
      result?.region // -> @optional String
      
     /*
      * Country of IP address 
      */
      result?.country // -> @optional String
      
     /*
      * Two letter ISO country code. Example: US (United States) or IE (Ireland)
      */
      result?.countryCode // -> @optional String
}
```
Please refer to [IPLocationResult](https://github.com/antideo/xcode/blob/master/Antideo/IPLocationResult.h) class for full and up-to-date property list.

### Get IP health result
``` swift
AAHelper.getIPHealth("1.2.3.4") { (result, error) in
     /*
      * IP address for the health result
      */
      result?.ip // -> @optional String 
     
     /*
      * Indicates if IP is part of infected/hacked network, or
      * is beeing used for ssh/brute force attacks etc.
      */
      result?.toxic // -> @optional Bool
      
     /*
      * Holds proxy result values if clasified as proxy
      */
      result?.proxy // -> @optional AAProxyResult
      
     /*
      * Holds spam result values if there is spam reports agains it.
      */
      result?.spam // -> @optional AAReportResult
}
```
Please refer to [IPLocationResult](https://github.com/antideo/xcode/blob/master/Antideo/IPLocationResult.h) class for full and up-to-date property list.
See also 
* [AAProxyResult](https://github.com/antideo/xcode/blob/master/Antideo/AAProxyResult.h)
* [AAReportResult](https://github.com/antideo/xcode/blob/master/Antideo/AAReportResult.h)

### Get email info
``` swift
AAHelper.getEmailInfo("hello@test.com") { (result, error) in
     /*
      * Email address for the info result
      */
      result?.email // -> @optional String 
      
     /*
      * Indicates if email is from a free provider like GMail etc.
      */
      result?.freeProvider // -> @optional Bool 
     
     /*
      * Indicates if email is disposable/temporary
      */
      result?.disposable // -> @optional Bool 
      
     /*
      * Holds spam result values if there is spam reports agains it
      */
      result?.spam // -> @optional AAReportResult 
      
     /*
      * Holds scam result values if there is scam reports agains it
      */
      result?.scam // -> @optional AAReportResult
}
```
Please refer to [EmailHealthResult](https://github.com/antideo/xcode/blob/master/Antideo/EmailHealthResult.h) class for full and up-to-date property list.

See also:
[AAReportResult](https://github.com/antideo/xcode/blob/master/Antideo/AAReportResult.h)

## Available helper methods

### Validate email string
``` swift 
AAHelper.isValidEmail("test@test.com") // true
```

### Validate IP address
``` swift
// validates either ipv4 or ipv6 addresses
AAHelper.isValidIPAddress("1.2.3.4") // true

//validates only ipv4 addresses
AAHelper.isValidIPV4Address("1.2.3.4") // true

// validates only ipv6 addresses
AAHelper.isValidIPV6Address("1.2.3.4") // false
```
