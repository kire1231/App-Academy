class RPNCalculator

  def initialize
    @stack = []
  end

  def push(num)
    @stack << num
  end

  def value
    @stack.last
  end

  def plus
    perform_operation(:+)
  end

  def minus
    perform_operation(:-)
  end

  def divide
    perform_operation(:/)
  end

  def times
    perform_operation(:*)
  end

  def tokens(string)
    tokens = string.split
    tokens.map { |el| is_operation?(el) ? el.to_sym : el.to_i }
  end

  def evaluate(string)
    tokens = tokens(string)
    tokens.each do |token|
      case token
      when Integer
        push(token)
      else
        perform_operation(token)
      end
    end
    value
  end


  private

  def is_operation?(el)
    [:+, :-, :*, :/].include?(el.to_sym)
  end

  def perform_operation(op_symbol)
    raise "calculator is empty" if @stack.size <2
    second_operand = @stack.pop
    first_operand = @stack.pop

    case op_symbol
    when :+
      @stack << first_operand + second_operand
    when :-
      @stack << first_operand - second_operand
    when :/
      @stack << first_operand.fdiv(second_operand)
    when :*
      @stack << first_operand * second_operand
    else
      @stack << first_operand
      @stack << second_operand
      raise "No such operation: #{op_symbol}"
    end
  end

end
