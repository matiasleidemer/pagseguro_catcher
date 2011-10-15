class String
  def utf8
    Iconv.conv(PagseguroCatcher::XML_CHARSET, "UTF-8", self)
  end
end