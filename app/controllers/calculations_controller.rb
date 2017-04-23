class CalculationsController < ApplicationController
  def welcome
    render("calculations/welcome.html.erb")
  end
  def flexible_square
    #params = {"num" => "6"}
    @the_number = params["num"].to_f
    @the_number_sq = @the_number ** 2
    render("calculations/flexible_square.html.erb")
  end
  def flexible_root
    #params = {"num" => "6"}
    @the_number = params["num"].to_f
    @the_number_rt = Math.sqrt(@the_number)
    render("calculations/flexible_root.html.erb")
  end
  def flexible_payment
    #params = {"num" => "6"}
    @interest = params["interest"].to_f.round(1) / 100
    @years = params["years"].to_f.round(1)
    @loan = params["loan"].to_f
    @monthly_payment = (@loan * @interest / 1200) / ((1 - (1 + @interest /1200) ** (-1 * @years * 12)))
    render("calculations/flexible_payment.html.erb")
  end
  def flexible_random
    #params = {"num" => "6"}
    @first = params["first"].to_f
    @second = params["second"].to_f
    @random = rand(@first .. @second).round(0)
    render("calculations/flexible_random.html.erb")
  end

  def square_form
    render("calculations/square_form.html.erb")
  end

  def square
    # params = {"user_number"=>"6"}
    @the_number = params[:user_number].to_f
    @the_number_sq = @the_number ** 2

    render("calculations/square.html.erb")
  end
  def square_root_form
    render("calculations/square_root_form.html.erb")
  end

  def square_root
    # params = {"user_number"=>"6"}
    @the_number = params[:user_number].to_f
    @the_number_root = Math.sqrt(@the_number)

    render("calculations/square_root.html.erb")
  end
  def payment_form
    render("calculations/payment_form.html.erb")
  end

  def payment
    # params = {"user_number"=>"6"}
    @user_apr = params[:user_apr].to_f.round(1)
    @user_years = params[:user_years].to_f.round(1)
    @user_principal = params[:user_principal].to_f
    @payment = (@user_principal * @user_apr / 1200) / ((1 - (1 + @user_apr /1200) ** (-1 * @user_years * 12)))
    render("calculations/payment.html.erb")
  end

  def random_form
    render("calculations/random_form.html.erb")
  end

  def random
    # params = {"user_number"=>"6"}
    @first = params[:user_first].to_f
    @last = params[:user_last].to_f
    @random = rand(@first .. @last).round(4)
    # Considered making isntance variable with URL to call on page?
    # @refresh = "<a href=/random/results?user_min=#{@first}user_max=#{@last}>"
    render("calculations/random.html.erb")
  end

  def word_count_form
    render("calculations/word_count_form.html.erb")
  end
  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]
    @character_count_with_spaces = @text.gsub("\n"," ").gsub("\r","").length
    @character_count_without_spaces = @text.gsub(" ","").gsub("\n"," ").gsub("\r","").length
    @word_count = @text.gsub("\n"," ").gsub("\r","").split.length
    # def array_dups
    array_dups = 0
    # def array_text
    special_word_fixed = @special_word.gsub("\n"," ").gsub("\r","").downcase
    array_text = @text.gsub("\n"," ").gsub("\r","").downcase.split
    array_text.each do |word|
      if word == special_word_fixed
        array_dups = array_dups + 1
      end
      @occurrences = array_dups
    end
    render("word_count.html.erb")
  end

  def stats_form
    render("calculations/stats_form.html.erb")
  end
  def stats
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)
    @sorted_numbers = @numbers.sort
    @count = @numbers.count
    @minimum = @numbers.sort[0]
    @maximum = @numbers.sort.reverse[0]
    @range = @numbers.sort.reverse[0] - @numbers.sort[0]
    if @numbers.count % 2 == 0
      median_fixed = (@sorted_numbers[@sorted_numbers.count/2 - 1] + @sorted_numbers[@sorted_numbers.count/2]) / 2
    else median_fixed = @sorted_numbers[@sorted_numbers.count/2]
    end
    @median = median_fixed
    @sum = @numbers.sum
    @mean = @numbers.sum/@numbers.count
    mean = @numbers.sum/@numbers.count
    variance = 0
    @numbers.each do |value|
      variance = variance + (value - mean)**2
    end
    variance = variance/@numbers.count
    @variance = variance
    @standard_deviation = variance**(0.5)
    freq = @numbers.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    @mode = @numbers.max_by { |v| freq[v] }
    render("calculations/stats.html.erb")
  end

end
