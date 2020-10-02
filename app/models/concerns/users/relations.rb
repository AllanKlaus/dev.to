module Users
  module Relations
    extend ActiveSupport::Concern

    included do
      has_many :organization_memberships, dependent: :destroy
      has_many :organizations, through: :organization_memberships
      has_many :api_secrets, dependent: :destroy
      has_many :articles, dependent: :destroy
      has_many :badge_achievements, dependent: :destroy
      has_many :badges, through: :badge_achievements
      has_many :collections, dependent: :destroy
      has_many :comments, dependent: :destroy
      has_many :email_messages, class_name: "Ahoy::Message"
      has_many :github_repos, dependent: :destroy
      has_many :identities, dependent: :destroy
      has_many :mentions, dependent: :destroy
      has_many :messages, dependent: :destroy
      has_many :notes, as: :noteable, inverse_of: :noteable
      has_many :profile_pins, as: :profile, inverse_of: :profile
      has_many :authored_notes, as: :author, inverse_of: :author, class_name: "Note"
      has_many :notifications, dependent: :destroy
      has_many :reactions, dependent: :destroy
      has_many :tweets, dependent: :destroy
      has_many :chat_channel_memberships, dependent: :destroy
      has_many :chat_channels, through: :chat_channel_memberships
      has_many :notification_subscriptions, dependent: :destroy
      has_many :push_notification_subscriptions, dependent: :destroy
      has_many :feedback_messages
      has_many :rating_votes
      has_many :html_variants, dependent: :destroy
      has_many :page_views
      has_many :credits
      has_many :classified_listings
      has_many :poll_votes
      has_many :poll_skips
      has_many :backup_data, class_name: "BackupData",
                             foreign_key: "instance_user_id",
                             inverse_of: :instance_user
      has_many :display_ad_events
      has_many :access_grants, class_name: "Doorkeeper::AccessGrant",
                               foreign_key: :resource_owner_id,
                               inverse_of: :resource_owner,
                               dependent: :delete_all
      has_many :access_tokens, class_name: "Doorkeeper::AccessToken",
                               foreign_key: :resource_owner_id,
                               inverse_of: :resource_owner,
                               dependent: :delete_all
      has_many :webhook_endpoints, class_name: "Webhook::Endpoint",
                                   foreign_key: :user_id,
                                   inverse_of: :user,
                                   dependent: :delete_all
      has_one :pro_membership, dependent: :destroy
    end
  end
end
