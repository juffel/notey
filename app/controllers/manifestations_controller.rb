class ManifestationsController < ApplicationController
  # if instead of a tag_id a tag_string is passed, this tag will be created
  # if no date is passed (only a tag_id) the current datetime is
  # set for this manifestation
  def create
    # check if tag exists 
    man = params.require(:manifestation).permit(:tag, :date, :till_date)
    tag = Tag.find_by(:name, man[:tag])
    if tag.blank?
      man[:tag_id] = Tag.create(name: man[:tag]).id
    end

    # remove tag-string from hash so man can be used as Manifestation constructor parameter
    man.delete(:tag)

    # set :date parameter to current time if it is not present
    if man[:date].blank?
      man[:date] = Date.current()
    end
    @man = Manifestation.create(man)
  redirect_to controller: "wui", action: "home"
  end

  def destroy
    Manifestation.delete(params.permit(:id)[:id])
    render nothing: true, status:200
  end
end
