# Händlerbund Api

This gem provides a simpe method to access [Händlerbund's](http://www.haendlerbund.de) API for (German) legal documents for online shopping use. You will need to sign up for an account with them and ask them for an access token. 

## Installation

Add this line to your application's Gemfile:

    gem 'haendlerbund_api', :git => 'git://github.com/leobossmann/haendlerbund_api'

And then execute:

    $ bundle

## Usage

initalize the API client with your access token:

    @client = HaendlerbundApi::LegalDocuments.new('access_token')

Then you can access the legal documents for your store:

    @client.terms_and_conditions

The following document types are available:

* terms\_and\_conditions (Allgemeine Geschäftsbedingungen)
* return\_policy (Rückgaberecht für Verbraucher)
* cancellation\_policy (Widerrufsbelehrung)
* payment\_and\_delivery\_terms (Bedingungen für Zahlung und Versand)
* privacy\_policy (Datenschutzerklärung)
* imprint (Impressunm)
* battery\_information (Batteriehinweise)

Optionally you can specify an output style:

     @client.terms_and_conditions :mode => :plain

The following document modes are available:

* default (HTML with inline styling)
* classes (HTML with CSS classes)
* classes\_head (HTML with CSS classes and CSS Snippet in header)
* plain (plain text)
  

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
