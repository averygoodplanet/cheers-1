require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_a_name_with_no_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("brt")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a.. B
Give me an.. R
Give me a.. T
BRT is GRAND!
EOS
    assert_equal shell_output, expected_output
  end

  def test_a_name_with_no_vowels_a_different_way
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("brt")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes_in_order shell_output, "Give me a.. B", "Give me an.. R", "Give me a.. T"
  end

# # But what about names with vowels?!!

  def test_a_name_with_vowel_sounds
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("gabrielle")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a.. G
Give me an.. A
Give me a.. B
Give me an.. R
Give me an.. I
Give me an.. E
Give me an.. L
Give me an.. L
Give me an.. E
GABRIELLE is GRAND!
EOS
    assert_equal shell_output, expected_output
  end


  def test_a_name_with_vowel_sounds_a_different_way
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("gabrielle")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes_in_order shell_output, "Give me a.. G", "Give me an.. I", "Give me an.. L", "Give me an.. E"
  end

  def test_no_name_entered_just_hit_return
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Hey, you didn't enter your name!
EOS
    assert_equal shell_output, expected_output
  end

  def test_a_name_with_a_hyphen
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("anne-marie")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me an.. A
Give me an.. N
Give me an.. N
Give me an.. E
Give me an.. M
Give me an.. A
Give me an.. R
Give me an.. I
Give me an.. E
ANNE-MARIE is GRAND!
EOS
    assert_equal shell_output, expected_output
  end
end