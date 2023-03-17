class SubscriptionsController < ApplicationController
  def index
    matching_subscriptions = Subscription.all

    @list_of_subscriptions = matching_subscriptions.order({ :created_at => :desc })

    render({ :template => "subscriptions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_subscriptions = Subscription.where({ :id => the_id })

    @the_subscription = matching_subscriptions.at(0)

    render({ :template => "subscriptions/show.html.erb" })
  end

  def create
    the_subscription = Subscription.new
    the_subscription.bio = params.fetch("query_bio")
    the_subscription.owner_id = params.fetch("query_owner_id")

    if the_subscription.valid?
      the_subscription.save
      redirect_to("/subscriptions", { :notice => "You have subscribed to this plan." })
    else
      redirect_to("/subscriptions", { :alert => the_subscription.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_subscription = Subscription.where({ :id => the_id }).at(0)

    the_subscription.bio = params.fetch("query_bio")
    the_subscription.owner_id = params.fetch("query_owner_id")

    if the_subscription.valid?
      the_subscription.save
      redirect_to("/subscriptions/#{the_subscription.id}", { :notice => "You have successfully updated you subscription."} )
    else
      redirect_to("/subscriptions/#{the_subscription.id}", { :alert => the_subscription.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_subscription = Subscription.where({ :id => the_id }).at(0)

    the_subscription.destroy

    redirect_to("/subscriptions", { :notice => "You have successfully unsubscribed from this plan"} )
  end
end
