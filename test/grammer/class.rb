class Test
  def initialize(name, age)
    @name = name
    @age = age + 10
    @introduce = "안녕하세요 #@name 입니다. #@age 살이에요. "

    puts @introduce
  end
  @@No_of_color = 3
end

new_girl = Test.new('Linda', 15)
puts new_girl
