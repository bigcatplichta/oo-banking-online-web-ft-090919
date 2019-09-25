class Transfer
  attr_reader :sender, :receiver, :amount 
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end 
  
  def valid?
    @sender.valid? && @receiver.valid?
  end 
  
  def execute_transaction
    case 
    when self.valid? && self.status == "pending"
      @sender.balance -= amount
      @receiver.deposit(amount)
      self.status = "complete"
    when @sender.balance < amount
      
    end
  end 
end
