require 'pp'
require './player'
require './question-generator'

class Main
    attr_accessor :question_generator, :switch
    SCORE = 3

    def initialize
        @player_1 = Player.new("Player 1", SCORE)
        @player_2 = Player.new("Player 2", SCORE)
    end

    def ask_question
        new_question = Question_generator.new
        puts new_question.generate
        return new_question
    end


    def run
         switch = true
         player_1_is_game_over = false
         player_2_is_game_over = false

         until player_1_is_game_over || player_2_is_game_over
           puts "------ NEW TURN ------"

            if switch == true
                print "Player 1: "
                question_generator = ask_question
                answer = @player_1.answer_question
                isCorrect = question_generator.check_answer(answer.to_i)
                @player_1.update_score(isCorrect)
                player_1_is_game_over = @player_1.check_score
                puts "P1: #{@player_1.score} vs P2: #{@player_2.score}"
                switch = false
             else
               print "Player 2: "
               question_generator = ask_question
               answer = @player_2.answer_question
               isCorrect = question_generator.check_answer(answer.to_i)
               @player_2.update_score(isCorrect)
               player_2_is_game_over = @player_2.check_score
               puts "P1: #{@player_1.score} vs P2: #{@player_2.score}"
               switch = true
            end
         end

        puts "Game over"
        if player_2_is_game_over
            puts "player 1 wins with score #{@player_1.score}, the score of player 2 is #{@player_2.score}"
        else
            puts "player 2 wins with score #{@player_2.score}, the score of player 1 is #{@player_1.score}"
        end
    end
end


m = Main.new

m.run