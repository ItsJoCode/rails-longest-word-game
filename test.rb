tab1 =  "COCACOLA".split('')
tab2 = "COCZ".split('')

tab2.each do |letter|
  if tab1.include?(letter)
    puts true
  else
    puts false
  end
end
