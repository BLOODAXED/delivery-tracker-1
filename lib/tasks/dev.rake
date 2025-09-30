desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

  ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end

  User.destroy_all
  Package.destroy_all

  usernames = ["alice", "bob", "carol", "dave", "eve"]

  usernames.each do |username|
    user = User.new
    user.email = "#{username}@example.com"
    user.password = "appdev"
    user.save

    10.times do
      delivery = Package.new
      delivery.user_id = user.id
      delivery.description = Faker::Commerce.product_name
      delivery.details = "#{["FedEx", "UPS", "USPS"].sample} tracking ##{rand(1000000000000)}" if rand < 0.5
      delivery.expected = Faker::Date.between(from: 1.month.ago, to: 2.weeks.from_now)

      if delivery.expected < Time.now
        delivery.status = [true, false].sample
      else
        delivery.status = false
      end

      delivery.save
    end
  end
end
