puts "========== Seeding Started =========="


["Afzal Rahman", "Muhammed U K", "Arjun K R", "Jabir Ali"].each_with_index do |name, index|
  converted_name = name.gsub(' ','_').downcase

  puts "creating user"
  user = User.create(
    name: name, 
    email: "#{converted_name}@gmail.com",
    password: converted_name
  )

  puts "creating saving(default) account for the user"
  account = user.accounts.create(
    account_no: "112200#{index}",
    balance: 25000,
  )

  puts "creating a debit transaction with random amount for the user"
  Transaction.create(
    user_id: user.id,
    account_id: account.id,
    amount: rand(5000..10000),
    tr_action: "Debit"
  )
end



user = User.first
puts "creating current account for the first user"
user.accounts.create(
    account_no: "2222000",
    account_type: "Current Account",
    balance: 10000,
  )


puts "creating 5 debit & credit transactions for the above user account"
user.accounts.each do |account|
  5.times do
    Transaction.create(
      user_id: user.id,
      account_id: account.id,
      amount: rand(1000..2000),
      tr_action: "Credit"
    )
  end

  5.times do
    Transaction.create(
      user_id: user.id,
      account_id: account.id,
      amount: rand(500..800),
      tr_action: "Debit"
    )
  end
end


puts "adding last user to the first user's account (many-to-many) and last user creating a transaction"
last_user = User.last
account = Account.first
account.users << last_user
Transaction.create(
      user_id: last_user.id,
      account_id: account.id,
      amount: rand(500..800),
      tr_action: "Credit"
    )

puts "========== Seeding Completed =========="

## Credentials
# We have generated users with email as their names with space replaced by underscore @gmail.com
# and password as just name in the above format.
# Example:- 
# user: Afzal Rahman
# email: afzal_rahman@gmail.com
# password: afzal_rahman
