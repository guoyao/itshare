module UsersHelper
  def newpass(len)
    result = ""
    1.upto(len) { |i| result << rand(10).to_s }
    result
  end
end