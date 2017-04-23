Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get("/",{:controller => "calculations", :action => "welcome"})
  get("flexible/square/:num",{:controller => "calculations", :action => "flexible_square"})
  get("flexible/root/:num",{:controller => "calculations", :action => "flexible_root"})
  get("flexible/payment/:interest/:years/:loan/",{:controller => "calculations", :action => "flexible_payment"})
  get("flexible/random/:first/:second",{:controller => "calculations", :action => "flexible_random"})
  get("/square/new",{:controller => "calculations", :action => "square_form"})
  get("/square/results",{:controller => "calculations", :action => "square"})
  get("/square_root/new",{:controller => "calculations", :action => "square_root_form"})
  get("/square_root/results",{:controller => "calculations", :action => "square_root"})
  get("/payment/new",{:controller => "calculations", :action => "payment_form"})
  get("/payment/results",{:controller => "calculations", :action => "payment"})
  get("/random/new",{:controller => "calculations", :action => "random_form"})
  get("/random/results",{:controller => "calculations", :action => "random"})
  get("/word_count/new",{:controller => "calculations", :action => "word_count_form"})
  get("/word_count/results",{:controller => "calculations", :action => "word_count"})
  get("/stats/new",{:controller => "calculations", :action => "stats_form"})
  get("/stats/results",{:controller => "calculations", :action => "stats"})
end
