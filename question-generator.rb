class Question_generator
     attr_accessor :number1, :number2, :answer

    def initialize
        @number1 = rand(1...20)
        @number2 = rand(1...20)
        @answer = @number1 + @number2
    end

    def generate
        "What does #{number1} plus #{number2} equal?"
    end

    def check_answer(given_answer)
        if given_answer == answer
            return true
        end
            return false
    end

end
