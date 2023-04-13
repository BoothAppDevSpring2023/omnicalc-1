class ApplicationController < ActionController::Base

def blank_square_form
render({ :template => "calculation_templates/square_form.html.erb"})
  end 

def calculate_square
  @num = params.fetch("elephant").to_f
  @square_of_num = @num ** 2
  render({ :template => "calculation_templates/square_results.html.erb"})
    end 

def blank_random_form
  render({ :template => "calculation_templates/random_form.html.erb"})
    end 

def calculate_random
  @lower = params.fetch("user_min").to_f
  @upper = params.fetch("user_max").to_f
  @result = rand(@lower..@upper)
  render({ :template => "calculation_templates/rand_results.html.erb"})
    end 

def blank_square_root_form
  render({ :template => "calculation_templates/square_root_form.html.erb"})
    end 
    
def calculate_square_root
  @nume = params.fetch("user_number").to_f
  @square_root_of_num = @nume ** 0.5
  render({ :template => "calculation_templates/square_root_results.html.erb"})
    end

def blank_payment_form
  render({ :template => "calculation_templates/payment_form.html.erb"})
    end 
        
def calculate_payment
  @rate = params["user_apr"].to_f
  @years = params["user_years"].to_f
  @principal = params["user_pv"].to_f
  @payment = ((@rate / 1200 * @principal) / (1-((1 + @rate / 1200) ** (-@years * 12)))).round(2)
  @opt_url = "/payment/new"

  render({ :template => "calculation_templates/payment_results.html.erb"})
  end
   

end
