enable :sessions


get '/game/lobby' do
  @games = Game.where(player_2: nil).last(5)
  puts "finish loading game lobby"
  erb :'/game/lobby'
end

get '/game/create' do
  puts "creating new game"
  @current_game = Game.create(player_1: session[:id])
  puts "finish creating new game"
  erb :'/game/wait_player'
end

get '/game/wait_player' do
  current_game = Game.find(params[:game_id])
  if current_game.player_2 != nil
    return "true"
  else
    return "false"
  end
end

get '/game/:game_id/:player_2_id' do
  puts "player 2 join the game"
  current_game = Game.find(params[:game_id])
  current_game.player_2 = params[:player_2_id]
  current_game.save
  @game_mode = 2 #multiplayer mode
  redirect '/game/play/params[:game_id]'
end


# get '/game/play/:current_game.id' do
#   current_game = Game.find(params[:current_game_id])
#   if session[:id] == current_game.player_1

# end

get '/game/play/:game_id/ai' do
  @current_game_id = params[:game_id]

  @game_mode = 1 #mode 1 is for game againts AI
  erb :'/game/play'
end

post '/game/update_game' do

  current_game = Game.find(params[:current_game_id])
  current_game.result = params[:winner]
  current_game.save
end

get '/game/conclude_game' do
  @last_game = Game.where(player_1: session[:id]).last
  erb :'/game/conclusion'
end