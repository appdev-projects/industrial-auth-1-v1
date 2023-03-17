# == Schema Information
#
# Table name: subscriptions
#
#  id           :bigint           not null, primary key
#  bio          :string           default("pending")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :integer
#  recipient_id :bigint           not null
#  sender_id    :bigint           not null
#
# Indexes
#
#  index_subscriptions_on_recipient_id  (recipient_id)
#  index_subscriptions_on_sender_id     (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipient_id => users.id)
#  fk_rails_...  (sender_id => users.id)
#
require "test_helper"

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
