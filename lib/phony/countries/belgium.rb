include Phony::DSL

# Belgium uses a variable-length ndc code, thus we use a separate file to not let all_other.rb explode.
#
# Taken from: http://en.wikipedia.org/wiki/Telephone_numbers_in_Belgium
#
ndcs = [
 '2', # Brussels (Bruxelles/Brussel)
 '3', # Antwerpen (Antwerp), Sint-Niklaas
 '4', # Liège (Luik), Voeren (Fourons)
 '9', # Gent (Ghent/Gand)
]

mobile_regex = /^4[789]\d{7}$/ # Mobistar, Base, Proximus

service = [
  '70', # Specialty numbers, i.e. bus information or bank information
 '800', # Tollfree
 '900', # Premium
 '901', # Premium
 '902', # Premium
 '903', # Premium
 '904', # Premium
 '905', # Premium
 '906', # Premium
 '907', # Premium
 '908', # Premium
 '909'  # Premium
]

Phony::Countries::Belgium = one_of(*service)                >> format(3,3) or 
                            match(mobile_regex, 3)          >> format(6)   or
                            one_of(*ndcs, :max_length => 2) >> format(3,5)