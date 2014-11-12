enable :sessions


get '/game/lobby' do
  @games = Game.where(player_2: nil)
  erb :'/game/lobby'
end

get '/game/create' do
  current_game = Game.create(player_1: session[:id])
  erb :'/game/wait_player'
end

get '/game/:game_id/:player_2_id' do
  current_game = Game.find(params[:game_id])
  current_game.player_2 = params[:player_2_id]
  current_game.save
  erb :'/game/play'
end