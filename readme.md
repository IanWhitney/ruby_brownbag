# Ruby Brown-bag

## Part One: The Basics

### Running Ruby

For just experimenting, run `irb` to bring up a live coding environment. Everything you'll see here can be run by typing it in to `irb`.

Or you can write code into a file with an `.rb` extension and then run it with `ruby file_name.rb`

### Syntax

Ruby syntax is very plain. No semi-colons and very little in the way of parens or curly-braces.

```ruby
2 + 2
#=> 4
```

Variable names are lower case, and usually start with a letter. But can start with other characters.

```ruby
result = 2 + 2
#=> 4

_hello = "Hi"
#=> "Hi"
```

Variables that start with a `@` are special, and we'll see more about that later.

### Output


Puts, or put-s writes the content to standard out with a newline.

```ruby
result = 2 + 2
#=> 4
puts result
#=> 4
```

What if we want to fancy this up a bit? We can interpolate a variable in a string.

```ruby
result = 2 + 2
puts "The result is #{result}"
#=> "The result is 4"
```

Don't like double quotes?

```ruby
result = 2 + 2
puts 'The result is #{result}'
#=> "The result is #{result}"
```

Too bad.

There are different styles, but I find that always using double-quotes works best.

### Strings

Strings do a variety of useful things:

You can also spread strings out over multiple lines
```ruby
long_string = "
  It was the best of times,
  It was the worst of times.
"

#=>"\n  It was the best of times,\n  It was the worst of times.\n"

concatenate = "Hello, " + "World"
#=> "Hello, World"

list = "CFANS CBS CSE".split(' ')
#=> ["CFANS", "CBS", "CSE"]

lower_case = "CFANS".downcase
#=> "cfans"

upper_case = "cbs".upcase
#=> "CBS"

changed = "CSE".gsub(/SE/,"BS")
#=> "CBS"

query = "CSE".include?("FANS")
#=> False

"CEHD".empty?
#=> False

"".empty?
#=> True
```

If a method ends in ?, the Ruby idiom is to return a boolean.

Usually, methods return their results but don't mutate the receiver. But if a method ends in a `!`, that usually means it mutates the object in place.

```ruby
word = "minnesota"

upcased = word.upcase

puts upcased
#=> "MINNESOTA"

puts word
#=> "minnesota"

word.upcase!

puts word
#=> "MINNESOTA"
```

Anything you've done with a string in other languages can be done in Ruby.

### Numbers

Numbers in Ruby will be familiar.

```ruby
1 + 1
#> 2
```

To get non-integer answers, you need to use non-integers

```ruby
10 / 3
#=> 3

10.0 / 3
#=> 3.3333
```

You can compare numbers. Heck, you can compare most things. Though you might wonder why you would.

```ruby
10 == 10
#=> true

true != false
#=> false

"Hello" > "Goodbye"
#=> true
```

### Symbols

Symbols can be weird for people new to Ruby

They look a lot like strings

```ruby
puts :symbol
#=>symbol
```

They even act like strings

```ruby
puts :symbol.upcase
#=>SYMBOL

puts "#{:symbols} must be strings"
#=> "symbols must be strings"
```

But they aren't 

```ruby
puts :hello + :world
#=> undefined method `+' for :hello:Symbol

puts :symbol.is_a?(String)
#=> false
```

Two identical symbols are exactly the same. Which isn't true of strings

```ruby
puts :symbol.object_id == :symbol.object_id
#=> true

puts "symbol".object_id == "symbol".object_id
#=>false
```

Symbols show up where you want something string-like, but that's immutable and faster. We'll see them in hashes, later on.

### True, False and Nil

Ruby uses "nil" to represent anything that's not present:

```ruby
@y = 5
#=> 5
@x
#=> nil
```

You can ask if something is nil

```ruby
@x.nil?
#=> true

@y = 5
#@y.nil?
#=> false

nil.nil?
#=> true
```

In Ruby, nil-ness is false-ness

```ruby
@x.nil?
#=> true

if @x
  puts "@x is true"
else
  puts "@x is false
end

#=> "@x is false"
```

And anything that is not-nil is true

```ruby
@x = "monkey"
@x.nil?
#=> false

if @x
  puts "@x is true"
else
  puts "@x is false
end

#=> "@x is true"
```

Heck, the string doesn't even have to have anything in it

```ruby
@x = ""
@x.empty?
#=> true
@x.nil?
#=> false
```

There are also explicit True and False objects

```ruby
@x = true
@x.nil?
#=> false

if @x
  puts "@x is true"
else
  puts "@x is false
end

#=> "@x is true"
```

```ruby
@x = false
@x.nil?
#=> false


if @x
  puts "@x is true"
else
  puts "@x is false
end

#=> "@x is false"
```

### Control Statements

Obviously Ruby supports if statements. Other flow control statements work as well

```ruby

condition = true

if condition
  puts "Yay, the condition has been met"
end
#=> "Yay, the condition has been met"

unless condition
  puts "Oh no, the condition hasn't been met"
end
#=> nil

test = 9000

if conditon < 9000
  puts "that's under 9000"
elsif condition > 9000
  puts "that's over 9000!"
else
  puts "Huh, 9000 exactly"
end
```

No, I don't know where the second e went in elsif. Yes, I get it wrong all the time.

Branching conditionals can also use the case statement.

```ruby
option = "Ruby"

case option
  when "Java"
    puts "You picked Java"
  when "PHP"
    puts "You picked PHP"
  when "Ruby"
    puts "You picked Ruby"
  else
    puts "I don't know that language"
  end
end
```

Ternary statements shorten up simple if/else statements.

```ruby
condition = false

puts (condition ? "The condition was true" : "The condition was false")
#=> "The condition was false
```

Multiple conditions are fine. Ruby uses && for AND and || for OR.

```ruby
if true && false
  puts "this will never happen"
else
  puts "&& is the boolean AND"
end

if true || false
  puts "|| is the boolean OR"
end

if (true && true) || (false || true)
  puts "You can write confusing code in ruby, too"
end
```

Looping works as well, using `while` and `until` and `break`

```ruby
condition = true

while condition
  puts "Yep, still true"
  condition = false
end
```

```ruby
condition = false

until condition
  puts "Nope, still false"
  break
end
```

You can also do things an exact number of times.

```ruby
10.times do |num|
  puts "I can count to #{num}"
end
#=> 1
#=> 2
# etc
```

This uses iteration and blocks, which we'll talk about later.

## Section Two: Classes and Objects

Ruby is an Object Oriented language. You can ask things if they are objects, just to prove it.

```ruby
1.is_a?(Object)
#=> True

"string".is_a?(Object)
#=> True

Object.is_a?(Object)
#=> True

nil.is_a?(Object)
#=> True
```

Yep. Everything is an Object.

So let's make some Objects. Let's start with a Programmer.

```ruby
class Programmer
end

me = Programmer.new
#=> #<Programmer:>
```

Just by declaring something a class, we can automatically create instances of it. No need to write an initialization method.

We can create our own initialization code if we need to.

```ruby
class Programmer
  def initialize
    puts "Hey, you made a programmer!"
  end
end

me = Programmer.new
#=> "Hey, you made a programmer!"
#=> #<Programmer:>
```

Calling myself a Programmer is pretty specific, though. I'm more than just a programmer! Let's create a Person.

```ruby
class Person
end

class Programmer < Person
end

me = Programmer.new
#=> #<Programmer:>


me.is_a?(Programmer)
#=> True

me.is_a?(Person)
#=> True
```

Whew. Good to have that confirmed. ? in ruby means that the method will return a boolean. And `is_a?` tells you if your object is of that class, or if that class is an Ancestor. Programmer inherits from Person, so I am both.

This is classical inheritance. Ruby only offers single inheritance, not multiple.

```ruby
Programmer.ancestors
#=> [Programmer, Person, Object, Kernel, BasicObject]
```

Tune out that Kernel and BasicObject stuff. What's relevant here is Object is in everything's ancestors. Everything.

```ruby
1.is_a?(Object)
#=> True

"string".is_a?(Object)
#=> True

Object.is_a?(Object)
#=> True

nil.is_a?(Object)
#=> True
```

As a programmer/person I'm not very interesting. Let's give me some behavior.

```ruby
class Person
  def name=(x)
    @name=x
  end

  def name
    @name
  end
end

me = Person.new
me.name = "Ian Whitney"
puts me.name
#=> "Ian Whitney"
```

A variable that starts with @ is an instance variable, so it is stored as part of the object's state.

Writing getters & setters is tedious, though:

```ruby
class Person
  attr_accessor :name
end

me = Person.new
me.name = "Ian Whitney"
puts me.name
#=> "Ian Whitney"
```

A child class can override or alter their parent's behavior.

```ruby
class Person
  attr_accessor :name
end

class Programmer < Person
  def name
    super + ", programmer"
  end
end

me = Programmer.new
me.name = "Ian Whitney"
puts me.name
#=> "Ian Whitney, programmer"
```

Of course, methods can take parameters:

```ruby
class Programmer < Person
  def knows_language?(language)
    languages.include?(language)
  end

  def languages
    ["Ruby", "Perl"]
  end
end

me = Programmer.new
me.knows_language?("Ruby")
#=> True
me.knows_language?("Java")
#=> False
```

And parameters can have defaults

```ruby
class Programmer < Person
  def knows_language?(language = "Ruby")
    languages.include?(language)
  end

  def languages
    ["Ruby", "Perl"]
  end
end

me = Programmer.new
me.knows_language?
#=> True
me.knows_language?("Java")
#=> False
```

Classes can be altered any number of times. Even classes you didn't control.

```ruby
class Programmer < Person
  def name
    super + ", programmer"
  end
end

me = Programmer.new
me.name = "Ian"
puts me.name
#=> "Ian, programmer"

class Programmer < Person
  def name
    "not anymore!"
  end
end

puts me.name
#=> "not anymore!"

class String
  def upcase
    dowcase
  end
end

puts "Hello".upcase
#=> "hello"
```

With great power comes great responsibility, etc. etc.

So far we've only created methods that exist on an instance of a class. We can also create methods that exist on the class itself.

```ruby
class Person
  def self.make_group
    [new, new]
  end
end
#=> [#<Person:>, #<Person:>]
```

### Collections & Enumerables

The square brackets in the last example are an array. Ruby several types of collections

Arrays:

```
an_array = [1, "hello", nil]
#=> [1, "hello", nil]

an_array[1]
#=> "hello"

new_array = []
new_array << "Hi"
#=> ["Hi"]

[1, 2, 4].include?(3)
#=> false
```

Hashes:

```
a_hash = {:ruby => "is expressive", :c => "is fast"}
#=> {:ruby => "is expressive", :c => "is fast"}

a_hash[:ruby]
#=> "is expressive"

new_hash = {}
new_hash[:ruby] = "is expressive"
#=> {:ruby => "is expressive"}
```

There are a few types of hash syntax. Above we used `=>`, also called 'hashrocket' to separate our keys and our values. Since keys are so frequently symbols, you can also do:

```
a_hash = {ruby: "is expressive", c: "is fast"}
a_hash[:c]
#=> "is fast"
```

But if you want to use non-symbol keys, use the hashrocket:

```ruby
languages = {"ruby" => "is expressive", "c" => "is fast"}

puts languages["ruby"]
#=> "is the best"
```

Ranges:

```
a_range = (1..10)
#=> 1..10

a_range.first
#=> 1

a_range.last
#=> 10

alphabet_range = ("a".."z")
alphabet_range.include?("c")
#=> true
```

Collections of things in Ruby all share common behaviors. As a family they are called Enumerable.

### Each

The core enumerable behavior is `each`

```ruby
# Arrays
["Ruby", "Perl"].each do |language|
  puts "#{language} is the best!"
end
#=> Ruby is the best!
#=> Perl is the best!

# Hashes
languages = {ruby: "is the best", perl: "is fast"}

languages.each do |key, value|
  puts "#{key} #{value}!"
end
#=> Ruby is the best!
#=> Perl is fast!

# Ranges
(1..3).each do |number|
  puts "I can count to #{number}"
end
#=> I can count to 1
#=> I can count to 2
#=> I can count to 3
```

There are other enumerable things, but these are the ones you use most.

Enumerable things can be manipulated with a useful set of functions.

Want to find all the even numbers in a range?

```ruby
(1..10).select do |number|
 number.even?
}
#=> [2, 4, 6, 8, 10]
```

Want to make a bunch of programmers?

```ruby
class Programmer < Person
  def initialize(name)
    self.name = name
  end
end

programmers = ["Ian Whitney", "Andrea Grant", "Gideon Woldenselassie"].map do |name|
  Person.new(name)
end
#=> [#<Programmer: @name="Ian Whitney">, #<Programmer: @name="Andrea Grant">, #<Programmer: @name="Gideon Woldenselassie">]
```

Want to find the number of years we've spent programming?

```ruby
class Programmer < Person
  attr_accessor :name, :years_active

  def initialize(name, years_active)
    self.name = name
    self.years_active = years_active
  end
end

programmers = ["Ian Whitney", "Andrea Grant", "Gideon Woldenselassie"].map do |name|
  random_number = rand(20)
  Person.new(name, random_number)
end

programmers.inject(0) do |return, programmer|
  return += programmer.years_active
end
```

In Ruby, this `do...end` syntax can be replaced by a shorter form that uses {}

```ruby
programmers.inject(0) { |return, programmer| return += programmer.years_active }
```

Both of these are `blocks`. Typically you'll see the `{}` syntax if you're doing something short and the `do...end` syntax if you're doing something that takes more than one line.

Ruby's support for blocks (and closures) is deep, but something that we can cover another time.

### Testing

Ruby comes with one testing library built in, and there are a few other testing libraries that people use. Let's focus on the one that ships with Ruby, MiniTest

```ruby
require "minitest/autorun"

class TestExamples < Minitest::Test
  def test_that_true_is_true
    assert true
  end

  def test_that_false_is_false
    refute false
  end

  def test_that_numbers_are_equal
    assert_equal 1, 2
  end

  def test_that_tests_can_be_skipped
    skip
    raise, "This won't get called"
  end
end
```

We use 'require' to load some code that isn't loaded by default in Ruby.

Any method that starts with `test_` is run when we run our test suite.

You can play with this yourself by running `ruby -i test.rb` in the root of the brownbag project.

### A Project!

Look at the `./proverb/readme.md` file. We've been given some tests, let's write some code to get those tests passing.


### Additional Resources

Learning Ruby

- http://tryruby.org/
- https://www.bloc.io/ruby-warrior#/
- http://www.rubykoans.com/
- http://exercism.io/


Additional Resources (Koans, Paul's Closure thing?)
