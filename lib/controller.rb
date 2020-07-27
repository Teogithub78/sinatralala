require 'bundler'
Bundler.require


class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
  puts "Salut, je suis dans le serveur"
  puts "Ceci est le contenu du hash params : #{params}"
  puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["author"]}"
  puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["content"]}"

  author = params["author"]
  content = params["content"]
  Gossip.new(author,content).save
  #puts all_gossips
  redirect '/'
  end

  get '/gossips/:id' do
      erb :show, locals: {gossip: Gossip.find(params['id']), id: params['id']}
      puts Gossip.find(params['id'])
  end
end

#Gossip.find[2]
