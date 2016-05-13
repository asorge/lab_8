  class RegexTester
    def initialize(pattern=nil)
      @pattern = pattern unless pattern.nil?
    end

    attr_accessor :pattern

    def statements=(arr)
    	begin
	      raise TypeError unless arr.class == Array
	      raise RuntimeError if arr.empty?
	      @statements = arr

	    rescue RuntimeError
	      STDERR.puts "You need to have at least one statement to test against the pattern."
	      add_insult
	      exit
	    rescue TypeError
	      STDERR.puts "You must enter an ARRAY of statements to use this regex_tester." 
	      add_insult
	      exit  
	    end
    end

    def statements
    	@statements
    end

	def test
		if pattern_matches? @statement
		  puts "MATCH: #{@statement}"
		else
		  STDERR.puts "NO MATCH: #{@statement}"
		end
	end 

	private

	def pattern_matches? statement
		statement.match(@pattern) != nil
	end

  end

  regex = RegexTester.new
  regex.pattern = /^(http:\/\/)?www\.\w+\.(com|edu|org)$/  # from test_arrays.rb
  puts regex.pattern
  regex.statement = "http://www.google.com"
  puts regex.statement

  puts "------"
  regex.test
  regex.statement = "apidock.com"
  regex.test