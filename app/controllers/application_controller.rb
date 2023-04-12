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
  rate = params["number1"].to_f
  years = params["number2"].to_f
  principal = params["number3"].to_f
  payment = ((rate / 1200 * principal) / (1-((1 + rate / 1200) ** (-years * 12))))
  msg1 = "Payment results"
  no_imput = 5
  btn_text = "Calculate another payment"
  lbl_1 = "APR"
  lbl_2 = "Number of years"
  lbl_3 = "Principal"
  plh_1 = "Payment"
  plh_2 = rate.round(1).to_s
  plh_3 = years
  act = "$" + principal.to_s
  type = "$" + payment.round(2).to_s
  opt_url = "payment/new"
  render({ :template => "calculation_templates/payment_results.html.erb"}, :locals => { :msg1 => msg1, :no_imput => no_imput, :btn_text => btn_text, :lbl_1 => lbl_1, :lbl_2 => lbl_2, :lbl_3 => lbl_3, :plh_1 => plh_1, :plh_2 => plh_2, :plh_3 => plh_3, :act => act, :type => type, :opt_url => opt_url})
    end


end
