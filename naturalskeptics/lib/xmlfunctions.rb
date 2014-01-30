module TGD

  def self.builder (my_username,
                    my_id,
                    my_created_at,
                    my_updated_at,
                    my_sign_in_count,
                    my_curr_signed_in_at,
                    my_last_signed_in_at,
                    my_curr_sign_in_ip,
                    my_last_sign_in_ip
   )
    Nokogiri::XML::Builder.new do |xml|
      xml.myUsers do |xml|
        xml.email my_username;
        xml.userID my_id;
        xml.createdAT my_created_at;
        xml.updatedAT my_updated_at;
        xml.signInCount my_sign_in_count;
        xml.currSignInAt my_curr_signed_in_at;
        xml.lastSignInAt my_last_signed_in_at;
        xml.currSignInIP  my_curr_sign_in_ip;
        xml.lastSignInIP  my_last_sign_in_ip;
      end
    end
  end

  def self.myadd(email,
                  my2id,
                  my_create_at,
                  my_update_at,
                  my_sign_in_count,
                  my_curr_sign_in_at,
                  my_last_sign_in_at,
                  my_curr_sign_in_ip,
                  my_last_sign_in_ip,
                  filename
  )
#xml file must have a root-directory called root
    f = File.open(filename, "r+")
    f.seek(-8, IO::SEEK_END)
    f << builder(email,
                 my2id,
                 my_create_at,
                 my_update_at,
                 my_sign_in_count,
                 my_curr_sign_in_at,
                 my_last_sign_in_at,
                 my_curr_sign_in_ip,
                 my_last_sign_in_ip).to_xml(:save_with => Nokogiri::XML::Node::SaveOptions::NO_DECLARATION)
    f<< "</root>"
    f.close
    f = File.open(filename)
    doc = Nokogiri::XML(f) do |config|
      config.options = Nokogiri::XML::ParseOptions::NOBLANKS
    end
    node1 = doc.at_xpath('//root')
    sorted = node1.children.sort_by{ |n| n.text }
    sorted.each{ |n| node1 << n }
    file = File.open(filename,'w')
    file.puts doc.to_xml
    file.close
  end

  #This function not used. May be used to write xml from def/index
  def  self.write_xml myvar, myfile
    xml_string = myvar.to_xml
    File.open(myfile, 'w+') { |f| f.write(xml_string) }
    File.open(myfile, 'w') { |f| f.write(xml_string) }
  end

  def self.write_users_to_json
    File.open(File.join(Rails.root,

                        'public', 'skepticsUsers.json'), "w+") { |f| f.write(User.all.to_json) }
  end

  def self.write_commodities_to_json
    File.open(File.join(Rails.root,
                        'public', 'skepticsCommodities.json'), "w+") { |f| f.write(Commodity.all.to_json) }
    end
end
