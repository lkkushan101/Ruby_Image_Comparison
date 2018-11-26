require 'imatcher'
require 'benchmark/ips'
a = Imatcher::Image.from_file('a.png')
b = Imatcher::Image.from_file('a.png')
cmp = Imatcher::Matcher.new
cmp.mode #=> Imatcher::Modes::RGB

# create matcher with specific threshold
cmp = Imatcher::Matcher.new threshold: 0.05
cmp.threshold #=> 0.05

# create zero-tolerance grayscale matcher
cmp = Imatcher::Matcher.new mode: :grayscale, tolerance: 0
cmp.mode #=> Imatcher::Modes::Grayscale

res = cmp.compare(a, b)
res #=> Imatcher::Result

res.match? #=> true

res.score #=> 0.0

# Return diff image object
res.difference_image #=> Imatcher::Image
puts res.match?