puts "========== Starting Seed =========="


["Afzal Rahman", "Muhammed U K", "Arjun K R", "Jabir Ali"].each_with_index do |name, index|
  converted_name = name.gsub(' ','_').downcase
  user = User.create(
    name: name, 
    email: "#{converted_name}@gmail.com",
    password: converted_name
  )

  account = Account.create(
    account_no: "112200#{index}",
    account_type: "Savings",
    balance: 25000,
    user_id: user.id
  )

  Transaction.create(
    account_id: account.id,
    amount: rand(5000..10000),
    tr_action: "Debit"
  )
end

user = User.first
Account.create(
    account_no: "2222000",
    account_type: "Current",
    balance: 10000,
    user_id: user.id
  )

user.accounts.each do |account|
  5.times do
    Transaction.create(
      account_id: account.id,
      amount: rand(1000..2000),
      tr_action: "Credit"
    )
  end

  5.times do
    Transaction.create(
      account_id: account.id,
      amount: rand(500..800),
      tr_action: "Debit"
    )
  end
end

puts "***** Seeding Completed *****"

## Credentials
# We have generated users with email as their names with space replaced by underscore @gmail.com
# and password as just name in the above format.
# Example:- 
# user: Afzal Rahman
# email: afzal_rahman@gmail.com
# password: afzal_rahman
