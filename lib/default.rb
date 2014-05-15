# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo

module PostHelper

  def get_pretty_date(post)
    attribute_to_time(post[:created_at]).strftime('%B %-d, %Y')
  end

  def get_pretty_date_it(post)
   begin
    tmp = attribute_to_time(post[:created_at])
    italianMonths = ["gennaio", "febbraio", "marzo", "aprile", "maggio", "giugno", "luglio", "agosto", "settembre", "ottobre", "novembre", "dicembre"]
    intMon = tmp.mon
    intMon -= 1
    month = italianMonths[intMon]
    ret = tmp.day.to_s + " " + month + " " + tmp.year.to_s
   end
  end
  
  def get_post_day(post)
    attribute_to_time(post[:created_at]).strftime('%e')
  end  
  
  def get_post_month(post)
    attribute_to_time(post[:created_at]).strftime('%^b')
  end  
  
  def get_post_date(post)
    attribute_to_time(post[:created_at]).strftime('%B %-d, %Y')
  end 

end

 def language_code_of(item)
  # "/en/foo/" becomes "en"
  ret = (item.identifier.match(/^\/([a-z]{2})\//) || [])[1] 
  if ret == nil
    ret = 'en'
  end
  return ret
 end

 def extended_lang(lang)
  if lang == 'en' 
    return 'English'
  else 
    return 'Italiano' 
  end
 end

include PostHelper
