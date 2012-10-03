Order.transaction do
  (1..150).each do |i|
    Order.create(:name => "Customer #{i}" , :address => "#{i} Main Street Washington DC" ,:email => "customer-#{i}@google.com" , :pay_type => "Cash" )
  end
end

