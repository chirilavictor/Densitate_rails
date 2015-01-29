Rails.application.routes.draw do

  root               'densitate#preluare_text'
  get 'rezultate' => 'densitate#afisare_rezultate'

end
