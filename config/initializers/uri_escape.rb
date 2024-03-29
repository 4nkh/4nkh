require 'uri'

module URI
  def self.escape(url)
    encode_www_form_component(url)
  end
end

module URI
    class << self
        def escape(str)
            alpha = "a-zA-Z"
            alnum = "#{alpha}\\d"
            unreserved = "\\-_.!~*'()#{alnum}"
            reserved = ";/?:@&=+$,\\[\\]"
            unsafe = Regexp.new("[^#{unreserved}#{reserved}]")
            str.gsub(unsafe) do
                us = $&
                tmp = ''
                us.each_byte do |uc|
                    tmp << sprintf('%%%02X', uc)
                end
                tmp
            end.force_encoding(Encoding::US_ASCII)
        end
    end
end