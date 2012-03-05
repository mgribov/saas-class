class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end


def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2

    valid_strategy = [ 'p', 'r', 's' ];

    game.each do|i|
        raise NoSuchStrategyError unless valid_strategy.include? i[1].downcase
    end

    if game[0][1].downcase == game[1][1].downcase
        return game[0]
    end

    if game[0][1].downcase == 'p' and game[1][1].downcase == 'r'
        return game[0]
    end

    if game[0][1].downcase == 'p' and game[1][1].downcase == 's'
        return game[1]
    end

    if game[0][1].downcase == 'r' and game[1][1].downcase == 's'
        return game[0]
    end

    if game[0][1].downcase == 'r' and game[1][1].downcase == 'p'
        return game[1]
    end

    if game[0][1].downcase == 's' and game[1][1].downcase == 'p'
        return game[0]
    end

    if game[0][1].downcase == 's' and game[1][1].downcase == 'r'
        return game[1]
    end


end

def rps_tournament_winner(games) 

    winner = Hash.new(0)
    c = 0

    games.each do |i|
        i.each do |j|
            winner[c] = rps_game_winner(j)
            c = c + 1
        end
    end

    if winner.length == 1
        return winner[0]
    end

    return rps_game_winner( [ winner[0], winner[1] ])

end

#p rps_game_winner( [ [ "Armando", "s" ], [ "Dave", "p" ] ] )

# tour = [ 
#         [ 
#             [ ["Armando", "P"], ["Dave", "S"] ],
#             [ ["Richard", "p"], ["Michael", "S"] ],
#             [ ["bob", "s"], ["joe", "r"] ],
#             [ ["bob", "s"], ["joe", "p"] ]
#         ],
#         [
#             [ ["Allen", "S"], ["Omer", "P"] ],
#             [ ["David E.", "R"], ["Richard X.", "P"] ],
#             [ ["bob", "p"], ["joe", "r"] ],
#             [ ["bob", "s"], ["joe", "r"] ]
#         ]
#     ]
# 

# tour = [ 
#         [ 
#             [ ["Armando", "P"], ["Dave", "S"] ],
#         ]
#     ]
# 

#p rps_tournament_winner(tour)
