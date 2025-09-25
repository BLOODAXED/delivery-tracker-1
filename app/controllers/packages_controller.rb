class PackagesController < ApplicationController
  def index
    if current_user == nil
      redirect_to "/users/sign_in"
    else
      matching_packages = current_user.packages

      @list_of_packages = matching_packages.order({ :created_at => :desc })

      render({ :template => "packages/index" })
    end
  end

  def show
    the_id = params.fetch("path_id")

    matching_packages = Package.where({ :id => the_id })

    @the_package = matching_packages.at(0)

    render({ :template => "packages/show" })
  end

  def create
    the_package = Package.new
    the_package.description = params.fetch("query_description")
    the_package.expected = params.fetch("query_expected")
    the_package.details = params.fetch("query_details")
    the_package.status = params.fetch("query_status", false)
    the_package.user_id = current_user.id

    if the_package.valid?
      the_package.save
      redirect_to("/", { :notice => "Added to list." })
    else
      redirect_to("/", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    the_package.status = params.fetch("status", false)

    if the_package.valid?
      the_package.save
      redirect_to("/", { :notice => "Marked as received" })
    else
      redirect_to("/", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    the_package.destroy

    redirect_to("/packages", { :notice => "Package deleted successfully." })
  end
end
