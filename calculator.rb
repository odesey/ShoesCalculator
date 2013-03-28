Shoes.app :title => "Simple Calculator", :width => 240, :height => 240 do
  stack :margin => 30 do
    @output = edit_line
    background red
    flow do
      %w(1 2 3 * 4 5 6 / 7 8 9 + 0 %).each do |op|      
        button op do         
          append op
        end
      end
      button "C" do
        @output.text = 0
        @input = ""
      end
      button "=" do
        eval_expression
      end
    end
    
  end
  
  # Stick a string on the end of our input
  #
  def append(s)
    if @input.nil?
      @input = ""
    end
    @input += s
    @output.text = @input
  end

  
  # Evaluate the input we've got so far
  #
  def eval_expression
    @input = eval(@input).to_s
    @output.text = @input
  end
  
end
