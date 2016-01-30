Rails.application.routes.draw do
  root 'application#create'
  post '/nltk', to: 'sentiment_analysis#create'
end
