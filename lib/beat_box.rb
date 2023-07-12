class BeatBox
  attr_reader :list, :initial, :rate, :voice
  
  def initialize(initial = "")
    @list = LinkedList.new
    @initial = initial?(initial)
    @rate = 500
    @voice = "Boing"
  end
    
  def initial?(string)
    if string == ""
      @initial = nil
    else 
      @initial = string
      append(string)
    end
  end
  
  def append(string)
    if string == ""
      return
    elsif string.index(" ") == nil && sort(string) == true
      @list.append(string)
    else 
      separate(string)
    end
  end

  def prepend(string)
    if string == ""
      return
    elsif string.index(" ") == nil && sort(string) == true
      @list.prepend(string)
    else 
      string = string.reverse
      separate(string)
    end
  end

  def separate(string)
    if string.index(" ") == 0
      string.slice!(0) 
      separate(string)
    elsif string == ""
      return
    elsif string.index(" ") != nil
      text = string.slice!(0, string.index(" "))
      string.slice!(0)
      if caller.join.include?("prepend") == true && sort(text) == true
        prepend(text.reverse)
      elsif sort(text) == true
        append(text)
      end
      separate(string)
    elsif string.index(" ") == nil && sort(string) == true
      if caller.join.include?("prepend") == true && sort(string) == true
        prepend(string.reverse)
      elsif sort(string) == true
        append(string)
      end
    end
  end

  def sort(text)
    acceptable = " deep woo shi shu blop dep plop dop suu doo ditt hoo sweep fee mee tee keep holy moly ram blam bam doop oop beep dee bop boop la na "
    if acceptable.include?(" #{text} ") || acceptable.include?(" #{text.reverse} ")
      true
    else 
      false
    end
  end

  def count
    @list.count
  end

  def all
    @list.to_string
  end

  def play
    `say -r #{@rate} -v #{@voice} #{@list.to_string}`
  end

  def rate=(number)
    @rate = number
  end

  def reset_rate
    @rate = 500
  end

  def voice=(name)
    @voice = name
  end

  def reset_voice
    @voice = "Boing"
  end
end