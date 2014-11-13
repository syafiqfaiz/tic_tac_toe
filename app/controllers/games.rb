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
  current_game.player_2 = 1
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
  redirect '/game/play/params[:game_id]'
end


get '/game/play/:current_game.id' do
  current_game = Game.find(params[:current_game_id])
  if session[:id] == current_game.player_1


end