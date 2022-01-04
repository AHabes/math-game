class Player

    attr_accessor :player, :score

    def initialize (name, score)
        @name = name
        @score = score
    end

    def answer_question
        gets.chomp
    end

    def update_score(result)
        if result == false
            @score = @score - 1
        end
    end

    def check_score
        if @score == 0
            return true
        end
         return false
    end

end