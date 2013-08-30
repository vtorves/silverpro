class LegacyProject < ActiveRecord::Base
  include LegacyBase
  establish_connection "legacy"

  image_accessor :cover

  self.table_name = "projects"
  # self.primary_key = "old_id"

  # To use autogenerated ids uncomment below
  def dont_migrate_ids
    false
  end

  def migrate_where
    {id: self.id}
  end

  def map
    {
      state: get_state,
      name: self.name,
      user_id: self.user_id,
      category_id: self.category_id,
      goal: self.goal,
      about: self.about,
      headline: self.headline,
      video_url: self.video_url,
      short_url: self.short_url,
      created_at: self.created_at,
      updated_at: self.updated_at,
      about_html: self.about_html,
      recommended: self.recommended,
      home_page_comment: self.home_page_comment,
      permalink: self.permalink.gsub!(/\s+/, ''),
      online_days: get_online_days,
      online_date: get_online_date,
      #how_know: text,
      #more_links: text,
      #first_backers: text,
      remote_uploaded_image_url: get_image_url,
      budget: self.budget,
      budget_html: self.budget_html,
      terms: self.terms,
      terms_html: self.terms_html,
      site: self.site,
      hash_tag: self.hash_tag,
      address_city: self.address_city,
      address_state: self.address_state,
      address_zip_code: self.address_zip_code,
      address_neighborhood: self.address_neighborhood,
      foundation_widget: self.foundation_widget,
      campaign_type: self.project_type,
      featured: self.home_page
    }
  end

  def get_online_date
    self.created_at if self.visible?
  end

  def get_online_days
    ((self.expires_at - self.created_at).abs/60/60/24).round
  end

  def get_image_url
    if self.cover.present?
      return self.cover.remote_url(expires: 1.day.from_now)
    elsif self.image_url.present?
      return self.image_url
    end
  end


  def get_state
    state = 'draft'
    if self.finished

      # Successful
      state = 'successful' if self.successful? and expired?

    elsif self.visible?
      state = 'online'
    end

    state = 'rejected' if self.rejected == true
    state = 'soon' if self.soon == true and self.visible?
    state
  end

  def associate
    {
      # association: records.to.associate
    }
  end


  protected


  def expired?
    return true if self.finished
    self.expires_at < Time.now
  end


end
