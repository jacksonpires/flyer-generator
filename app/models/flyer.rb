class Flyer < ApplicationRecord
  include Magick
  
  def generate_sci_flyer
    event_date_field = self.event_date
    event_time_field = self.event_time
    address1_field = self.address1
    address2_field = self.address2
    
    img = ImageList.new(Rails.root.join('public', 'images', 'convite_branco.png'))
    
    event_date = Draw.new
        img.annotate(event_date, 0,0,270,418, I18n.l(event_date_field)){
        event_date.font_family = 'arial'
        event_date.font_weight = Magick::BoldWeight
        event_date.pointsize = 70
    }
    
    event_time = Draw.new
        img.annotate(event_time, 0,0,955,418, event_time_field.strftime("%H:%M")){
        event_time.font_family = 'arial'
        event_time.font_weight = Magick::BoldWeight
        event_time.pointsize = 70
    }
    
    address1 = Draw.new
        img.annotate(address1, 0,0,283,486, address1_field){
        address1.font_family = 'arial'
        address1.font_weight = Magick::BoldWeight
        address1.pointsize = 70
    }
    
    address2 = Draw.new
        img.annotate(address2, 0,0,283,555, address2_field){
        address2.font_family = 'arial'
        address2.font_weight = Magick::BoldWeight
        address2.pointsize = 70
    }
    
    img.format = 'jpeg'
    img_name = "#{self.id}_#{self.updated_at.strftime("%Y%m%d%H%M%S")}_sci.jpg"
    
    dir_name = Rails.root.join('public', 'generated', self.id.to_s)
    %x(rm -rf #{dir_name})
    FileUtils.mkdir_p dir_name
    
    img.write(Rails.root.join("#{dir_name}/#{img_name}"))
  end

end
