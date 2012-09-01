course = Course.find_or_create_by_title("Rails") do |c|
  c.title = "Rails school"
  c.description = "The school of Ruby-on-Rails"
  c.text = "The school of Ruby-on-Rails. The school of Ruby-on-Rails. The school of Ruby-on-Rails. The school of Ruby-on-Rails. The school of Ruby-on-Rails. The school of Ruby-on-Rails. The school of Ruby-on-Rails. The school of Ruby-on-Rails. The school of Ruby-on-Rails. The school of Ruby-on-Rails. The school of Ruby-on-Rails. The school of Ruby-on-Rails. "
  c.save!
end
