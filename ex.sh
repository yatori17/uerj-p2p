#  "Init nodes"

rm -rf /tmp/myhost
rm -rf /tmp/othost
rm -rf /tmp/anotherhost
rm -rf /tmp/otanhost
rm -rf /tmp/host001
rm -rf /tmp/host002
rm -rf /tmp/host003
rm -rf /tmp/host004
rm -rf /tmp/host005
rm -rf /tmp/host006


gnome-terminal -- freechains-host start /tmp/myhost
gnome-terminal -- freechains-host --port=8331 start /tmp/othost
gnome-terminal -- freechains-host --port=8332 start /tmp/anotherhost
gnome-terminal -- freechains-host --port=8333 start /tmp/otanhost
gnome-terminal -- freechains-host --port=8334 start /tmp/host001
gnome-terminal -- freechains-host --port=8335 start /tmp/host002
gnome-terminal -- freechains-host --port=8336 start /tmp/host003
gnome-terminal -- freechains-host --port=8337 start /tmp/host004
gnome-terminal -- freechains-host --port=8338 start /tmp/host005
gnome-terminal -- freechains-host --port=8339 start /tmp/host006

sleep 10s

# Creating keys pioneer
## DAY 1
echo "Setting a new date for port 8330"
freechains-host now 1663533576000
echo "Setting a new date or port 8331"
freechains-host --port=8331 now 1663533576000

# sleep 1m

echo "Create keys pioneer"
freechains keys pubpvt 'pioneer-password'

# Creating chat

echo "Joining forum"
freechains chains join '#forum' ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8

##check reputation to see if the reputation is 30

echo "Reputation of ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8"
freechains chain '#forum' reps ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8

# Creating the first publication

echo "First Post from Pioneer"
freechains chain '#forum' post inline "Hello guys! This is our public forum! Welcome!" --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8

echo "Joining the forum in another node"
freechains --host=localhost:8331 chains join '#forum' ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8

echo "syncronizing the nodes "

freechains --host=localhost:8330 peer localhost:8331 send '#forum'

freechains --host=localhost:8331 peer localhost:8330 send '#forum'

echo "Create newbie pub/priv key from port 8331"

freechains --host=localhost:8331 keys pubpvt 'newbie-pass'

echo "newbie posts"

POST1=$(freechains --host=localhost:8331 chain '#forum' post inline "Hello! I'm new in this forum!" --sign=8D6299C43FE27B576D71A31B002B78A7E0A1D6A92359587D635A046A712FD850147636140DC440CA1DE2AA702A8E31BD001C084B3EA473DA68939E936AD66716)

echo "Create persans01 pub/priv key from port 8331"

freechains --host=localhost:8331 keys pubpvt 'persans01'

echo "persans posts"

POST2=$(freechains --host=localhost:8331 chain '#forum' post inline "Hello! We can stablish some rules for this forum? 1 - Don’t challenge or attack others. The discussions on the forum are meant to stimulate conversation, not to create contention. Let others have their say, just as you may.\n 2 -Don’t post commercial messages. Contact people directly with product and service information if you believe it would help them.\n 3 - All defamatory, abusive, profane, threatening, offensive, or illegal materials are strictly prohibited. Do not post anything in a post message that you would not want the world to see or that you would not want anyone to know came from you. " --sign=527580847A888AF824B51FE4CF75C010FAD309EE2E522F89097816E1D58169592DD584C5A3B713F6811E87D763E9390561E6F55A9DB97F2664F240C5DA378EFD)

echo "syncronizing the nodes" 

freechains --host=localhost:8330 peer localhost:8331 send '#forum'

freechains --host=localhost:8331 peer localhost:8330 send '#forum'


echo "Likes the post 1 from newbie"
freechains --host=localhost:8330 chain '#forum' like $POST1 --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8

echo "likes the post 1 from Persans"

freechains --host=localhost:8330 chain '#forum' like $POST2 --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8

echo "Reps of Persans01 in the day of the post"
freechains chain '#forum' reps 2DD584C5A3B713F6811E87D763E9390561E6F55A9DB97F2664F240C5DA378EFD

## DAY 2

freechains-host now 1663633576000

freechains-host now 1663633576000 --port:8331

echo "Reps of Persans01 after the time"
freechains chain '#forum' reps 2DD584C5A3B713F6811E87D763E9390561E6F55A9DB97F2664F240C5DA378EFD

echo "New post from newbie user"
POST3NEWBIE=`freechains --host=localhost:8330 chain '#forum' post inline "Hey everyone! Can we talk about our favourite musics? My favourite music is Sting by Fletcher" --sign=527580847A888AF824B51FE4CF75C010FAD309EE2E522F89097816E1D58169592DD584C5A3B713F6811E87D763E9390561E6F55A9DB97F2664F240C5DA378EFD`

echo $POST3NEWBIE

freechains --host=localhost:8330 peer localhost:8331 send '#forum'

freechains --host=localhost:8331 peer localhost:8330 send '#forum'

## DAY 3

freechains-host now 1663733576000

freechains-host now 1663733576000 --port:8331

freechains-host now 1663733576000 --port=8332

freechains --host:localhost:8332 keys pubpvt 'sabrina123'

freechains --host:localhost:8332 keys pubpvt 'samara'
#9825D2C02C1C2DEBC8788A497DC105E7EF1CBD8447981181DF3D7F01ECC47F85
#3CAD363E6472C9ED3F046C2F3F7DC616D6034358F7BF79E8F5F2C0C17974EE8B9825D2C02C1C2DEBC8788A497DC105E7EF1CBD8447981181DF3D7F01ECC47F85

freechains --host=localhost:8332 chains join '#forum' ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8


#C49C01E46CB11E4156B745B42FAD39039B04C784A7539CC95AC35520DA470B0B 
#64B090B4FB2305752364E2A01E242B4AC2AE174A49AE15838F48FBBB14DD826BC49C01E46CB11E4156B745B42FAD39039B04C784A7539CC95AC35520DA470B0B

POST1SABRINA=`freechains --host=localhost:8332 chain '#forum' post inline "Hello! I'm Sabrina and I'm addicted in Should I by Phoebe Ryan. Do you know this one?" --sign=64B090B4FB2305752364E2A01E242B4AC2AE174A49AE15838F48FBBB14DD826BC49C01E46CB11E4156B745B42FAD39039B04C784A7539CC95AC35520DA470B0B`
POST1SAMARA=`freechains --host=localhost:8332 chain '#forum' post inline "Hello! Sabrina... I heard Phoebe Ryan is coming with a new album. By the way my favourite artist is Maggie Roggers" --sign=3CAD363E6472C9ED3F046C2F3F7DC616D6034358F7BF79E8F5F2C0C17974EE8B9825D2C02C1C2DEBC8788A497DC105E7EF1CBD8447981181DF3D7F01ECC47F85`


#echo "sabrina posts $POST1SABRINA"
freechains --host=localhost:8330 peer localhost:8332 send '#forum'
freechains --host=localhost:8332 peer localhost:8330 send '#forum'


# sleep 10s

# echo "likes the post 1 from sabrina"
freechains chain '#forum' like $POST1SABRINA --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains chain '#forum' like $POST1SAMARA --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
echo "THe pionner decided to give more reputation to Persans encourage him"
freechains chain '#forum' like $POST2 --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains chain '#forum' like $POST2 --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains chain '#forum' like $POST2 --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8

freechains keys pubpvt 'leticia123'

# 5183BF43B30A72B5D4E38DB7421EE573BD0C86482A3545AE40AD546DC8BBF0A3
# 3ECF3FE282B4F06ED4EA3F33CC095689CE84CA7B69612F58E17EA935FF0FB52B5183BF43B30A72B5D4E38DB7421EE573BD0C86482A3545AE40AD546DC8BBF0A3

freechains keys pubpvt 'pedro123'

## 5D1BD590ADBB3D3E6224EA3AA34CAD9B29E90061CB90847E363F291E8B4502C0
## 6C53D9AD01E5B0635B420E100F7F0DF19AC008CF0C0D91EFA336B824662A29B15D1BD590ADBB3D3E6224EA3AA34CAD9B29E90061CB90847E363F291E8B4502C0
POST_PEDRO=`freechains chain '#forum' post inline "Hey! My name is Pedro! I really enjoy music and this stuff. I'm too trendy for my own good, so I'm a King Princess big fan" --sign=6C53D9AD01E5B0635B420E100F7F0DF19AC008CF0C0D91EFA336B824662A29B15D1BD590ADBB3D3E6224EA3AA34CAD9B29E90061CB90847E363F291E8B4502C0`
POST1Leticia=`freechains chain '#forum' post inline "Hey! I'm Leticia and I like Taylor Swift :(" --sign=3ECF3FE282B4F06ED4EA3F33CC095689CE84CA7B69612F58E17EA935FF0FB52B5183BF43B30A72B5D4E38DB7421EE573BD0C86482A3545AE40AD546DC8BBF0A3`
freechains chain '#forum' like $POST1Leticia --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains chain '#forum' like $POST_PEDRO --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8

## DAY 4

freechains-host now 1663833576000

freechains-host now 1663833576000 --port=8331

freechains-host now 1663833576000 --port=8332


echo "Reps sabrina"
freechains chain '#forum' reps C49C01E46CB11E4156B745B42FAD39039B04C784A7539CC95AC35520DA470B0B
echo "Reps samara"
freechains chain '#forum' reps 9825D2C02C1C2DEBC8788A497DC105E7EF1CBD8447981181DF3D7F01ECC47F85
echo "Reps persans"
freechains chain '#forum' reps 2DD584C5A3B713F6811E87D763E9390561E6F55A9DB97F2664F240C5DA378EFD
echo "Reps Leticia123"
freechains chain '#forum' reps 5183BF43B30A72B5D4E38DB7421EE573BD0C86482A3545AE40AD546DC8BBF0A3
echo "Reps Pedro"
freechains chain '#forum' reps 5D1BD590ADBB3D3E6224EA3AA34CAD9B29E90061CB90847E363F291E8B4502C0


POST2Leticia=`freechains chain '#forum' post inline "Hey, Pedro! I like King Princess too! What are your favourite songs?" --sign=3ECF3FE282B4F06ED4EA3F33CC095689CE84CA7B69612F58E17EA935FF0FB52B5183BF43B30A72B5D4E38DB7421EE573BD0C86482A3545AE40AD546DC8BBF0A3`
POST_PERSANS=`freechains chain '#forum' post inline "Hey everyone, just to let you know: Feel free to invite a friend to this channel!" --sign=527580847A888AF824B51FE4CF75C010FAD309EE2E522F89097816E1D58169592DD584C5A3B713F6811E87D763E9390561E6F55A9DB97F2664F240C5DA378EFD`


## DAY 5

freechains-host now 1663933576000

freechains-host now 1663933576000 --port=8331

freechains-host now 1663933576000 --port=8332

freechains --host=localhost:8330 peer localhost:8332 send '#forum'
freechains --host=localhost:8332 peer localhost:8330 send '#forum'
freechains --host=localhost:8330 peer localhost:8331 send '#forum'
freechains --host=localhost:8331 peer localhost:8330 send '#forum'

echo "A malicious user try to send a message to this forum in node 8331"
freechains keys pubpvt 'troll1'
#7F198E772C2A688F884C4266FA5EF95CFC81C1667BB9BDA5EE5775DBCBAA5E27 
#DA1673C933D1E823B6628CB2D373A9261EB0850D8238709892B86859A52392D67F198E772C2A688F884C4266FA5EF95CFC81C1667BB9BDA5EE5775DBCBAA5E27
POST1Troll=`freechains chain '#forum' post inline "Hey everyone! You can click in this link to do some money" --sign=DA1673C933D1E823B6628CB2D373A9261EB0850D8238709892B86859A52392D67F198E772C2A688F884C4266FA5EF95CFC81C1667BB9BDA5EE5775DBCBAA5E27`
POST1Troll=`freechains chain --host:localhost:8331 '#forum' post inline "Hey everyone! You can click in this link to do some money" --sign=DA1673C933D1E823B6628CB2D373A9261EB0850D8238709892B86859A52392D67F198E772C2A688F884C4266FA5EF95CFC81C1667BB9BDA5EE5775DBCBAA5E27`
POST1Troll=`freechains chain --host:localhost:8331 '#forum' post inline "Hey everyone! You can click in this link to do some money" --sign=DA1673C933D1E823B6628CB2D373A9261EB0850D8238709892B86859A52392D67F198E772C2A688F884C4266FA5EF95CFC81C1667BB9BDA5EE5775DBCBAA5E27`


freechains --host=localhost:8330 peer localhost:8332 send '#forum'
freechains --host=localhost:8332 peer localhost:8330 send '#forum'
freechains --host=localhost:8330 peer localhost:8331 send '#forum'
freechains --host=localhost:8331 peer localhost:8330 send '#forum'


## DAY 6

freechains-host now 1664033576000

freechains-host now 1664033576000 --port=8331

freechains-host now 1664033576000 --port=8332

freechains-host now 1664033576000 --port=8333

freechains --host=localhost:8333 chains join '#forum' ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8

freechains keys pubpvt 'agustinho_carrara' --port=8333

#F16DF08657DD3E122DBF9529EA37E9F30D2670180F464A2A92F1CF632C0402D3 
#26087531900D7591F29DAA9C22CECD744C0BCDC3F2A3C0751B3833F3C5F4B1A9F16DF08657DD3E122DBF9529EA37E9F30D2670180F464A2A92F1CF632C0402D3

POST_AGUSTINHO=`freechains chain --host:8333 '#forum' post inline "Good night guys! My favourite artist is Zeca Pagodinho" --sign=26087531900D7591F29DAA9C22CECD744C0BCDC3F2A3C0751B3833F3C5F4B1A9F16DF08657DD3E122DBF9529EA37E9F30D2670180F464A2A92F1CF632C0402D3`
POST_PEDRO2=`freechains chain '#forum' post inline "My favourite song is Cursed" --sign=6C53D9AD01E5B0635B420E100F7F0DF19AC008CF0C0D91EFA336B824662A29B15D1BD590ADBB3D3E6224EA3AA34CAD9B29E90061CB90847E363F291E8B4502C0`

freechains --host=localhost:8330 peer localhost:8333 send '#forum'
freechains --host=localhost:8333 peer localhost:8330 send '#forum'

freechains chain '#forum' like $POST_AGUSTINHO --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8

freechains --host=localhost:8330 peer localhost:8332 send '#forum'
freechains --host=localhost:8332 peer localhost:8330 send '#forum'
freechains --host=localhost:8330 peer localhost:8331 send '#forum'
freechains --host=localhost:8331 peer localhost:8330 send '#forum'
freechains --host=localhost:8331 peer localhost:8333 send '#forum'
freechains --host=localhost:8333 peer localhost:8330 send '#forum'


## DAY 8

freechains-host now 1664233576000
freechains-host now 1664233576000 --port=8331
freechains-host now 1664233576000 --port=8332
freechains-host now 1664233576000 --port=8333

echo "Augustinho reps:"
freechains chain '#forum' reps F16DF08657DD3E122DBF9529EA37E9F30D2670180F464A2A92F1CF632C0402D3 --host:localhost:8332
freechains chain '#forum' reps F16DF08657DD3E122DBF9529EA37E9F30D2670180F464A2A92F1CF632C0402D3 --host:localhost:8333
echo "AGUSTINHO TRY TO MAKE A DOUBLE SPEND"

POST_AGUSTINHO1=`freechains chain --port:8332 '#forum' post inline "I heard that Maggie Rogers might come to Brazil next year" --sign=26087531900D7591F29DAA9C22CECD744C0BCDC3F2A3C0751B3833F3C5F4B1A9F16DF08657DD3E122DBF9529EA37E9F30D2670180F464A2A92F1CF632C0402D3`
POST_AGUSTINHO2=`freechains chain --port:8332 '#forum' post inline "This will be her first show in Brazil" --sign=26087531900D7591F29DAA9C22CECD744C0BCDC3F2A3C0751B3833F3C5F4B1A9F16DF08657DD3E122DBF9529EA37E9F30D2670180F464A2A92F1CF632C0402D3`
POST_AGUSTINHO3=`freechains chain --port:8333 '#forum' post inline "Hey guys! Do you want to know about some new musics? I have a list that i could share with you guys" --sign=26087531900D7591F29DAA9C22CECD744C0BCDC3F2A3C0751B3833F3C5F4B1A9F16DF08657DD3E122DBF9529EA37E9F30D2670180F464A2A92F1CF632C0402D3`
POST_AGUSTINHO4=`freechains chain --port:8333 '#forum' post inline "I heard that Cage the elephant might come too" --sign=26087531900D7591F29DAA9C22CECD744C0BCDC3F2A3C0751B3833F3C5F4B1A9F16DF08657DD3E122DBF9529EA37E9F30D2670180F464A2A92F1CF632C0402D3`
POST_AGUSTINHO5=`freechains chain --port:8333 '#forum' post inline "I heard that Cage the elephant might come too" --sign=26087531900D7591F29DAA9C22CECD744C0BCDC3F2A3C0751B3833F3C5F4B1A9F16DF08657DD3E122DBF9529EA37E9F30D2670180F464A2A92F1CF632C0402D3`

POST_SABRINA=`freechains chain --port:8332 '#forum' post inline "Yearh! I heard that too! I'm so anxious with the timeline" --sign=64B090B4FB2305752364E2A01E242B4AC2AE174A49AE15838F48FBBB14DD826BC49C01E46CB11E4156B745B42FAD39039B04C784A7539CC95AC35520DA470B0B`


freechains --host=localhost:8332 peer localhost:8333 send '#forum'
freechains --host=localhost:8333 peer localhost:8332 send '#forum'
freechains --host=localhost:8332 peer localhost:8330 send '#forum'

freechains chain '#forum' reps F16DF08657DD3E122DBF9529EA37E9F30D2670180F464A2A92F1CF632C0402D3


# ## DAY 10 Augustinho reps

freechains-host now 1664333576000
freechains-host now 1664333576000 --port=8331
freechains-host now 1664333576000 --port=8332
freechains-host now 1664333576000 --port=8333
freechains-host now 1664333576000 --port=8334
freechains-host now 1664333576000 --port=8335
freechains-host now 1664333576000 --port=8336
freechains-host now 1664333576000 --port=8337
freechains-host now 1664333576000 --port=8338
freechains-host now 1664333576000 --port=8339


freechains --host=localhost:8334 chains join '#forum' ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains --host=localhost:8335 chains join '#forum' ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains --host=localhost:8336 chains join '#forum' ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains --host=localhost:8337 chains join '#forum' ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains --host=localhost:8338 chains join '#forum' ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains --host=localhost:8339 chains join '#forum' ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8


echo "Augustinho reps:"
freechains chain '#forum' reps F16DF08657DD3E122DBF9529EA37E9F30D2670180F464A2A92F1CF632C0402D3

freechains keys pubpvt 'maria-jose'
#3DC5FE9083888D572C4C76D53C79EBD0D36AAED8B7B44631247BF43B9D5078CF 
#C26B20C96368FF1667B3A128D1C3CA8635F545B09A4F61BE1FFF669E6E81BBB23DC5FE9083888D572C4C76D53C79EBD0D36AAED8B7B44631247BF43B9D5078CF
freechains keys pubpvt 'anthonio'
#7ED75E2BD701B4D24BF19A179CCC1F7E81BB49B64D7780FEFC31F85C50FE0F25 
#18D042315E7136FE38DF1B742A4B25CE7BE86E5549C44E83236651887856CB4C7ED75E2BD701B4D24BF19A179CCC1F7E81BB49B64D7780FEFC31F85C50FE0F25
freechains keys pubpvt 'anamariabraga'
#2790F7DCF8F2C6275F2A9F93C1B0C1F07F4FFA5CBE5829A0B84B63F104B8B342 
#05E1AC175874FAABA739BBE47AB41F0FDF233FCC2000FFE3BC9A210DCAABFF7B2790F7DCF8F2C6275F2A9F93C1B0C1F07F4FFA5CBE5829A0B84B63F104B8B342
freechains keys pubpvt 'eduardo'
#BD070687E0DC91DA69606F77091275D0964D320844C5588CF3999F602A47A9A9 
#3BDAF5F99B366E03DAAA296032F56AF8D522159FE4DAE53A64BE7FF30AA36AD5BD070687E0DC91DA69606F77091275D0964D320844C5588CF3999F602A47A9A9
freechains keys pubpvt 'jose'
#FAD948912CF2542F9BC9FBE4C980B8D7837AE42C12935A5AC894E22B291E6A30 
#AEAE882F0EF6DE9F1DF0E7B62375025EC245536633CACB92518D033A5C6B3C2EFAD948912CF2542F9BC9FBE4C980B8D7837AE42C12935A5AC894E22B291E6A30
freechains keys pubpvt 'francisco'
#674E035B41D43F37077BC29E7175250C117C4767FDB9F0C86560695EC66CD764 
#6E1A3195C0BBB726DA2E74550F98E1FD00C0A11C820ECDDF2E84FD20C8A45AFC674E035B41D43F37077BC29E7175250C117C4767FDB9F0C86560695EC66CD764
freechains keys pubpvt 'luiz'
#85F181AD6D1B21DA78E1C681A847BBD6E3349CFA290CAF24D69E9C865E434461 
#B28F08733B726B38D8ADC48286D05C90E5443E5DCF65679494D7327C91F5668B85F181AD6D1B21DA78E1C681A847BBD6E3349CFA290CAF24D69E9C865E434461
freechains keys pubpvt 'guilherme'
#C53CF0445446DF7BFD41E6A285109A1EE1938A4C95FF94EEF7EDBE0A613B0310 
#BD2D19C11F244E04B95474F084DD37886BA1E31100AE1A238C8CDEAE34EB4F97C53CF0445446DF7BFD41E6A285109A1EE1938A4C95FF94EEF7EDBE0A613B0310
freechains keys pubpvt 'pamela'
#0992F847CA31C2F129FBD2A73487F277CE9C88D0310E9B7847F903F550370C28 
#51D439F8448E843B540412CC8EFFD4F436E1FEA8A04CDF17502DC3912C6857D20992F847CA31C2F129FBD2A73487F277CE9C88D0310E9B7847F903F550370C28
freechains keys pubpvt 'tuane'
#7B5C667BC666DE24041792B4038683F8DF45EC53D9A2A1997E7CAAA09D42FD06 
#BC5BE67B916BCE7A3BA76038251E90DDCB44BB072A86DB65593E8AD6C99493187B5C667BC666DE24041792B4038683F8DF45EC53D9A2A1997E7CAAA09D42FD06

freechains keys pubpvt 'fa-da-maria-jose'
#0BAF3C4C0B80AAD33A1C6BF1B7AB62ABAD827A0EE8E2AB21CCB5C2708728ACD9 
#ED28C66DA06EEEF32967668F8E210BEDB53283C6C17E9AADBF14300A3BA3657E0BAF3C4C0B80AAD33A1C6BF1B7AB62ABAD827A0EE8E2AB21CCB5C2708728ACD9


MARIAJOSE=`freechains --host=localhost:8334 chain '#forum' post inline "Hey, I'm new Here :)" --sign=C26B20C96368FF1667B3A128D1C3CA8635F545B09A4F61BE1FFF669E6E81BBB23DC5FE9083888D572C4C76D53C79EBD0D36AAED8B7B44631247BF43B9D5078CF`
ANTONIO=`freechains --host=localhost:8334 chain '#forum' post inline "Hey, I'm new Here :)" --sign=18D042315E7136FE38DF1B742A4B25CE7BE86E5549C44E83236651887856CB4C7ED75E2BD701B4D24BF19A179CCC1F7E81BB49B64D7780FEFC31F85C50FE0F25`
ANAMARIABRAGA=`freechains --host=localhost:8335 chain '#forum' post inline "Hey, I'm new Here :)" --sign=05E1AC175874FAABA739BBE47AB41F0FDF233FCC2000FFE3BC9A210DCAABFF7B2790F7DCF8F2C6275F2A9F93C1B0C1F07F4FFA5CBE5829A0B84B63F104B8B342`
EDUARDO=`freechains --host=localhost:8336 chain '#forum' post inline "Hey, I'm new Here :)" --sign=3BDAF5F99B366E03DAAA296032F56AF8D522159FE4DAE53A64BE7FF30AA36AD5BD070687E0DC91DA69606F77091275D0964D320844C5588CF3999F602A47A9A9`
JOSE=`freechains --host=localhost:8337 chain '#forum' post inline "Hey, I'm new Here :)" --sign=AEAE882F0EF6DE9F1DF0E7B62375025EC245536633CACB92518D033A5C6B3C2EFAD948912CF2542F9BC9FBE4C980B8D7837AE42C12935A5AC894E22B291E6A30`
FRANCISCO=`freechains --host=localhost:8338 chain '#forum' post inline "Hey, I'm new Here :)" --sign=6E1A3195C0BBB726DA2E74550F98E1FD00C0A11C820ECDDF2E84FD20C8A45AFC674E035B41D43F37077BC29E7175250C117C4767FDB9F0C86560695EC66CD764`
LUIZ=`freechains --host=localhost:8338 chain '#forum' post inline "Hey, I'm new Here :)" --sign=B28F08733B726B38D8ADC48286D05C90E5443E5DCF65679494D7327C91F5668B85F181AD6D1B21DA78E1C681A847BBD6E3349CFA290CAF24D69E9C865E434461`
GUILHERME=`freechains --host=localhost:8339 chain '#forum' post inline "Hey, I'm new Here :)" --sign=BD2D19C11F244E04B95474F084DD37886BA1E31100AE1A238C8CDEAE34EB4F97C53CF0445446DF7BFD41E6A285109A1EE1938A4C95FF94EEF7EDBE0A613B0310`
PAMELA=`freechains --host=localhost:8335 chain '#forum' post inline "Hey, I'm new Here :)" --sign=51D439F8448E843B540412CC8EFFD4F436E1FEA8A04CDF17502DC3912C6857D20992F847CA31C2F129FBD2A73487F277CE9C88D0310E9B7847F903F550370C28`
TUANE=`freechains --host=localhost:8337 chain '#forum' post inline "Hey, I'm new Here :)" --sign=BC5BE67B916BCE7A3BA76038251E90DDCB44BB072A86DB65593E8AD6C99493187B5C667BC666DE24041792B4038683F8DF45EC53D9A2A1997E7CAAA09D42FD06`
FA_DA_MARIA_JOSE=`freechains --host=localhost:8333 chain '#forum' post inline "Hey, I'm new Here :)" --sign=ED28C66DA06EEEF32967668F8E210BEDB53283C6C17E9AADBF14300A3BA3657E0BAF3C4C0B80AAD33A1C6BF1B7AB62ABAD827A0EE8E2AB21CCB5C2708728ACD9`

update_node_in_two_direction() {
    freechains --host=$1 peer localhost:8330 recv '#forum'
    freechains --host=localhost:8330 peer $1 recv '#forum'
    freechains --host=$1 peer localhost:8331 recv '#forum'
    freechains --host=localhost:8331 peer $1 recv '#forum'
    freechains --host=$1 peer localhost:8332 recv '#forum'
    freechains --host=localhost:8332 peer $1 recv '#forum'
    freechains --host=$1 peer localhost:8333 recv '#forum'
    freechains --host=localhost:8333 peer $1 recv '#forum'
    freechains --host=$1 peer localhost:8334 recv '#forum'
    freechains --host=localhost:8334 peer $1 recv '#forum'
    freechains --host=$1 peer localhost:8335 recv '#forum'
    freechains --host=localhost:8335 peer $1 recv '#forum'
    freechains --host=$1 peer localhost:8336 recv '#forum'
    freechains --host=localhost:8336 peer $1 recv '#forum'
    freechains --host=$1 peer localhost:8337 recv '#forum'
    freechains --host=localhost:8337 peer $1 recv '#forum'
    freechains --host=$1 peer localhost:8338 recv '#forum'
    freechains --host=localhost:8338 peer $1 recv '#forum'
    freechains --host=$1 peer localhost:8339 recv '#forum'
    freechains --host=localhost:8339 peer $1 recv '#forum'
}

syncronize_nodes()
{
    echo "Syncronizing nodes...."
    update_node_in_two_direction localhost:8330
    update_node_in_two_direction localhost:8331
    update_node_in_two_direction localhost:8332
    update_node_in_two_direction localhost:8333
    update_node_in_two_direction localhost:8334
    update_node_in_two_direction localhost:8335
    update_node_in_two_direction localhost:8336
    update_node_in_two_direction localhost:8337
    update_node_in_two_direction localhost:8338
    update_node_in_two_direction localhost:8339
    # update_node_in_two_direction localhost:8330 localhost:8331
    # update_node_in_two_direction localhost:8330 localhost:8332
    # update_node_in_two_direction localhost:8330 localhost:8333
    # update_node_in_two_direction localhost:8330 localhost:8334
    # update_node_in_two_direction localhost:8330 localhost:8335
    # update_node_in_two_direction localhost:8330 localhost:8336
    # update_node_in_two_direction localhost:8330 localhost:8337
    # update_node_in_two_direction localhost:8330 localhost:8338
    # update_node_in_two_direction localhost:8330 localhost:8339
    # update_node_in_two_direction localhost:8331 localhost:8332
    # update_node_in_two_direction localhost:8331 localhost:8333
    # update_node_in_two_direction localhost:8331 localhost:8334
    # update_node_in_two_direction localhost:8331 localhost:8335
    # update_node_in_two_direction localhost:8331 localhost:8336
    # update_node_in_two_direction localhost:8331 localhost:8337
    # update_node_in_two_direction localhost:8331 localhost:8338
    # update_node_in_two_direction localhost:8331 localhost:8339
    # update_node_in_two_direction localhost:8332 localhost:8333
    # update_node_in_two_direction localhost:8332 localhost:8334
    # update_node_in_two_direction localhost:8332 localhost:8335
    # update_node_in_two_direction localhost:8332 localhost:8336
    # update_node_in_two_direction localhost:8332 localhost:8337
    # update_node_in_two_direction localhost:8332 localhost:8338
    # update_node_in_two_direction localhost:8332 localhost:8339
    # update_node_in_two_direction localhost:8333 localhost:8334
    # update_node_in_two_direction localhost:8333 localhost:8335
    # update_node_in_two_direction localhost:8333 localhost:8336
    # update_node_in_two_direction localhost:8333 localhost:8337
    # update_node_in_two_direction localhost:8333 localhost:8338
    # update_node_in_two_direction localhost:8333 localhost:8339
    # update_node_in_two_direction localhost:8334 localhost:8335
    # update_node_in_two_direction localhost:8334 localhost:8336
    # update_node_in_two_direction localhost:8334 localhost:8337
    # update_node_in_two_direction localhost:8334 localhost:8338
    # update_node_in_two_direction localhost:8334 localhost:8339
    # update_node_in_two_direction localhost:8335 localhost:8336
    # update_node_in_two_direction localhost:8335 localhost:8337
    # update_node_in_two_direction localhost:8335 localhost:8338
    # update_node_in_two_direction localhost:8335 localhost:8339
    # update_node_in_two_direction localhost:8336 localhost:8337
    # update_node_in_two_direction localhost:8336 localhost:8338
    # update_node_in_two_direction localhost:8336 localhost:8339
    # update_node_in_two_direction localhost:8337 localhost:8338
    # update_node_in_two_direction localhost:8337 localhost:8339
    # update_node_in_two_direction localhost:8338 localhost:8339
}


syncronize_nodes 


freechains chain '#forum' like $MARIAJOSE --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains chain '#forum' like $ANTONIO --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains chain '#forum' like $ANAMARIABRAGA --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains chain '#forum' like $JOSE --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains chain '#forum' like $FRANCISCO --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains chain '#forum' like $LUIZ --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains chain '#forum' like $GUILHERME --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains chain '#forum' like $PAMELA --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains chain '#forum' like $TUANE --sign=CBBA777B93E03459033D97E249C65DB43547A644D52885C727E42A5B386B4212ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
freechains chain '#forum' like $FA_DA_MARIA_JOSE --sign=527580847A888AF824B51FE4CF75C010FAD309EE2E522F89097816E1D58169592DD584C5A3B713F6811E87D763E9390561E6F55A9DB97F2664F240C5DA378EFD

change_time() 
{
    echo "Updating time in nodes..."
    freechains-host now $TIME
    freechains-host now $TIME --port=8331
    freechains-host now $TIME --port=8332
    freechains-host now $TIME --port=8333
    freechains-host now $TIME --port=8334
    freechains-host now $TIME --port=8335
    freechains-host now $TIME --port=8336
    freechains-host now $TIME --port=8337
    freechains-host now $TIME --port=8338
    freechains-host now $TIME --port=8339
}

change_time 1664433576000

TIME=1664433576000
num=300000000
TIME=$((TIME+num))
echo $TIME
m=2
result=0
#11_C70C38174877FF92DFB9181726C29F08E03FC300647CF3AD58335F4E3990D7DC
#        freechains chain '#forum' --port:8334 dislike 11_08485344AE284F25AE9121534EB2BB67039CFD0F773C89F6528D2149754F0A48 --sign=C26B20C96368FF1667B3A128D1C3CA8635F545B09A4F61BE1FFF669E6E81BBB23DC5FE9083888D572C4C76D53C79EBD0D36AAED8B7B44631247BF43B9D5078CF
init=1
#For the period of fifty days, sabrina, samantha and pedro will be posting
for i in {1..80..3}; do
    echo "ITeration $i"
    if [ `expr $i % 2` == 0 ];
    then
        freechains chain '#forum' --port=8331 like $MSG_SABRINA --sign=6C53D9AD01E5B0635B420E100F7F0DF19AC008CF0C0D91EFA336B824662A29B15D1BD590ADBB3D3E6224EA3AA34CAD9B29E90061CB90847E363F291E8B4502C0
        freechains chain '#forum' --port=8333 like $MSG_MARIAJOSE --sign=BC5BE67B916BCE7A3BA76038251E90DDCB44BB072A86DB65593E8AD6C99493187B5C667BC666DE24041792B4038683F8DF45EC53D9A2A1997E7CAAA09D42FD06
        freechains chain '#forum' --port=8336 like $MSG_MARIAJOSE --sign=51D439F8448E843B540412CC8EFFD4F436E1FEA8A04CDF17502DC3912C6857D20992F847CA31C2F129FBD2A73487F277CE9C88D0310E9B7847F903F550370C28
        freechains chain '#forum' --port=8335 like $MSG_MARIAJOSE --sign=BD2D19C11F244E04B95474F084DD37886BA1E31100AE1A238C8CDEAE34EB4F97C53CF0445446DF7BFD41E6A285109A1EE1938A4C95FF94EEF7EDBE0A613B0310
        freechains chain '#forum' --port=8337 dislike $MSG_FA_DA_MARIA_JOSE --sign=C26B20C96368FF1667B3A128D1C3CA8635F545B09A4F61BE1FFF669E6E81BBB23DC5FE9083888D572C4C76D53C79EBD0D36AAED8B7B44631247BF43B9D5078CF
        freechains chain '#forum' --port=8339 like $MSG_PAMELA --sign=527580847A888AF824B51FE4CF75C010FAD309EE2E522F89097816E1D58169592DD584C5A3B713F6811E87D763E9390561E6F55A9DB97F2664F240C5DA378EFD
        freechains chain '#forum' --port=8338 like $MSG_GUILHERME --sign=6E1A3195C0BBB726DA2E74550F98E1FD00C0A11C820ECDDF2E84FD20C8A45AFC674E035B41D43F37077BC29E7175250C117C4767FDB9F0C86560695EC66CD764
        freechains chain '#forum' --port=8337 dislike $MSG_FA_DA_MARIA_JOSE --sign=527580847A888AF824B51FE4CF75C010FAD309EE2E522F89097816E1D58169592DD584C5A3B713F6811E87D763E9390561E6F55A9DB97F2664F240C5DA378EFD
        freechains chain '#forum' --port=8336 like $MSG_LUIZ --sign=AEAE882F0EF6DE9F1DF0E7B62375025EC245536633CACB92518D033A5C6B3C2EFAD948912CF2542F9BC9FBE4C980B8D7837AE42C12935A5AC894E22B291E6A30
    elif [ $i != 1 ];
    then
        freechains chain '#forum' --port=8332 like $MSG_PEDRO --sign=64B090B4FB2305752364E2A01E242B4AC2AE174A49AE15838F48FBBB14DD826BC49C01E46CB11E4156B745B42FAD39039B04C784A7539CC95AC35520DA470B0B
        freechains chain '#forum' --port=8334 like $MSG_ANAMARIABRAGA --sign=18D042315E7136FE38DF1B742A4B25CE7BE86E5549C44E83236651887856CB4C7ED75E2BD701B4D24BF19A179CCC1F7E81BB49B64D7780FEFC31F85C50FE0F25
    fi
    MSG_SABRINA=`freechains chain --host=localhost:8332 '#forum' post inline "yes a second message $i" --sign=64B090B4FB2305752364E2A01E242B4AC2AE174A49AE15838F48FBBB14DD826BC49C01E46CB11E4156B745B42FAD39039B04C784A7539CC95AC35520DA470B0B`
    MSG_LETICIA=`freechains chain '#forum' --host=localhost:8330 post inline "msg leticia $i" --sign=3ECF3FE282B4F06ED4EA3F33CC095689CE84CA7B69612F58E17EA935FF0FB52B5183BF43B30A72B5D4E38DB7421EE573BD0C86482A3545AE40AD546DC8BBF0A3`
    MSG_PEDRO=`freechains chain '#forum' --host=localhost:8331 post inline "msg pedro $i" --sign=6C53D9AD01E5B0635B420E100F7F0DF19AC008CF0C0D91EFA336B824662A29B15D1BD590ADBB3D3E6224EA3AA34CAD9B29E90061CB90847E363F291E8B4502C0`
    MSG_MARIAJOSE=`freechains --host=localhost:8332 chain '#forum' post inline "msg de cada autor $i :)" --sign=C26B20C96368FF1667B3A128D1C3CA8635F545B09A4F61BE1FFF669E6E81BBB23DC5FE9083888D572C4C76D53C79EBD0D36AAED8B7B44631247BF43B9D5078CF`
    MSG_ANTONIO=`freechains --host=localhost:8333 chain '#forum' post inline "msg de cada autor $i :)" --sign=18D042315E7136FE38DF1B742A4B25CE7BE86E5549C44E83236651887856CB4C7ED75E2BD701B4D24BF19A179CCC1F7E81BB49B64D7780FEFC31F85C50FE0F25`
    MSG_ANAMARIABRAGA=`freechains --host=localhost:8334 chain '#forum' post inline "msg de cada autor $i :)" --sign=05E1AC175874FAABA739BBE47AB41F0FDF233FCC2000FFE3BC9A210DCAABFF7B2790F7DCF8F2C6275F2A9F93C1B0C1F07F4FFA5CBE5829A0B84B63F104B8B342`
    MSG_EDUARDO=`freechains --host=localhost:8335 chain '#forum' post inline "msg de cada autor $i :)" --sign=3BDAF5F99B366E03DAAA296032F56AF8D522159FE4DAE53A64BE7FF30AA36AD5BD070687E0DC91DA69606F77091275D0964D320844C5588CF3999F602A47A9A9`
    MSG_LUIZ=`freechains --host=localhost:8335 chain '#forum' post inline "msg de cada autor $i :)" --sign=B28F08733B726B38D8ADC48286D05C90E5443E5DCF65679494D7327C91F5668B85F181AD6D1B21DA78E1C681A847BBD6E3349CFA290CAF24D69E9C865E434461`
    MSG_JOSE=`freechains --host=localhost:8336 chain '#forum' post inline "msg de cada autor $i :)" --sign=AEAE882F0EF6DE9F1DF0E7B62375025EC245536633CACB92518D033A5C6B3C2EFAD948912CF2542F9BC9FBE4C980B8D7837AE42C12935A5AC894E22B291E6A30`
    MSG_FRANCISCO=`freechains --host=localhost:8337 chain '#forum' post inline "msg de cada autor $i :)" --sign=6E1A3195C0BBB726DA2E74550F98E1FD00C0A11C820ECDDF2E84FD20C8A45AFC674E035B41D43F37077BC29E7175250C117C4767FDB9F0C86560695EC66CD764`
    MSG_GUILHERME=`freechains --host=localhost:8338 chain '#forum' post inline "msg de cada autor $i :)" --sign=BD2D19C11F244E04B95474F084DD37886BA1E31100AE1A238C8CDEAE34EB4F97C53CF0445446DF7BFD41E6A285109A1EE1938A4C95FF94EEF7EDBE0A613B0310`
    MSG_PAMELA=`freechains --host=localhost:8339 chain '#forum' post inline "msg de cada autor $i :)" --sign=51D439F8448E843B540412CC8EFFD4F436E1FEA8A04CDF17502DC3912C6857D20992F847CA31C2F129FBD2A73487F277CE9C88D0310E9B7847F903F550370C28`
    MSG_TUANE=`freechains --host=localhost:8335 chain '#forum' post inline "msg de cada autor $i :)" --sign=BC5BE67B916BCE7A3BA76038251E90DDCB44BB072A86DB65593E8AD6C99493187B5C667BC666DE24041792B4038683F8DF45EC53D9A2A1997E7CAAA09D42FD06`
    MSG_FA_DA_MARIA_JOSE=`freechains --host=localhost:8337 chain '#forum' post inline "msg de cada autor $i :)" --sign=ED28C66DA06EEEF32967668F8E210BEDB53283C6C17E9AADBF14300A3BA3657E0BAF3C4C0B80AAD33A1C6BF1B7AB62ABAD827A0EE8E2AB21CCB5C2708728ACD9`
    MSG_PERSANS=$(freechains --host=localhost:8331 chain '#forum' post inline "msg 0001 $i" --sign=527580847A888AF824B51FE4CF75C010FAD309EE2E522F89097816E1D58169592DD584C5A3B713F6811E87D763E9390561E6F55A9DB97F2664F240C5DA378EFD)

    echo "Troll Messages"
    freechains chain '#forum' post inline "Hey everyone! You can click in this link to do some money" --sign=DA1673C933D1E823B6628CB2D373A9261EB0850D8238709892B86859A52392D67F198E772C2A688F884C4266FA5EF95CFC81C1667BB9BDA5EE5775DBCBAA5E27
    freechains chain --host:localhost:8331 '#forum' post inline "Hey everyone! You can click in this link to do some money" --sign=DA1673C933D1E823B6628CB2D373A9261EB0850D8238709892B86859A52392D67F198E772C2A688F884C4266FA5EF95CFC81C1667BB9BDA5EE5775DBCBAA5E27
    freechains chain --host:localhost:8332 '#forum' post inline "Hey everyone! You can click in this link to do some money" --sign=DA1673C933D1E823B6628CB2D373A9261EB0850D8238709892B86859A52392D67F198E772C2A688F884C4266FA5EF95CFC81C1667BB9BDA5EE5775DBCBAA5E27
    freechains chain --host:localhost:8337 '#forum' post inline "Hey everyone! You can click in this link to do some money" --sign=DA1673C933D1E823B6628CB2D373A9261EB0850D8238709892B86859A52392D67F198E772C2A688F884C4266FA5EF95CFC81C1667BB9BDA5EE5775DBCBAA5E27
    freechains chain --host:localhost:8336 '#forum' post inline "Hey everyone! You can click in this link to do some money" --sign=DA1673C933D1E823B6628CB2D373A9261EB0850D8238709892B86859A52392D67F198E772C2A688F884C4266FA5EF95CFC81C1667BB9BDA5EE5775DBCBAA5E27
    freechains chain --host:localhost:8338 '#forum' post inline "Hey everyone! You can click in this link to do some money" --sign=DA1673C933D1E823B6628CB2D373A9261EB0850D8238709892B86859A52392D67F198E772C2A688F884C4266FA5EF95CFC81C1667BB9BDA5EE5775DBCBAA5E27
    syncronize_nodes
    TIME=$((TIME+num))
    change_time $TIME
    syncronize_nodes
done

echo "FORUM FINISHED RUNNING AFTER THREE MONTHS --> Reputations"




show_reps() 
{
    echo "Maria José REPS"
    freechains chain '#forum' reps 3DC5FE9083888D572C4C76D53C79EBD0D36AAED8B7B44631247BF43B9D5078CF 
    echo "anthonio reps:"
    freechains chain '#forum' reps  7ED75E2BD701B4D24BF19A179CCC1F7E81BB49B64D7780FEFC31F85C50FE0F25
    echo "anamariabraga reps'"
    freechains chain '#forum' reps  2790F7DCF8F2C6275F2A9F93C1B0C1F07F4FFA5CBE5829A0B84B63F104B8B342 
    echo " reps eduardo"
    freechains chain '#forum' reps  BD070687E0DC91DA69606F77091275D0964D320844C5588CF3999F602A47A9A9 
    echo " reps jose "
    freechains chain '#forum' reps FAD948912CF2542F9BC9FBE4C980B8D7837AE42C12935A5AC894E22B291E6A30 
    echo " reps francisco "
    freechains chain '#forum' reps  674E035B41D43F37077BC29E7175250C117C4767FDB9F0C86560695EC66CD764 
    echo " reps luiz "
    freechains chain '#forum' reps  85F181AD6D1B21DA78E1C681A847BBD6E3349CFA290CAF24D69E9C865E434461 
    echo " reps guilherme "
    freechains chain '#forum' reps  C53CF0445446DF7BFD41E6A285109A1EE1938A4C95FF94EEF7EDBE0A613B0310 
    echo " reps pamela "
    freechains chain '#forum' reps  0992F847CA31C2F129FBD2A73487F277CE9C88D0310E9B7847F903F550370C28 
    echo " reps tuane "
    freechains chain '#forum' reps  7B5C667BC666DE24041792B4038683F8DF45EC53D9A2A1997E7CAAA09D42FD06 
    echo " reps fa-da-maria-jose"
    freechains chain '#forum' reps  0BAF3C4C0B80AAD33A1C6BF1B7AB62ABAD827A0EE8E2AB21CCB5C2708728ACD9 
    echo "Reps sabrina"
    freechains chain '#forum' reps C49C01E46CB11E4156B745B42FAD39039B04C784A7539CC95AC35520DA470B0B
    echo "Reps samara"
    freechains chain '#forum' reps 9825D2C02C1C2DEBC8788A497DC105E7EF1CBD8447981181DF3D7F01ECC47F85
    echo "Reps persans"
    freechains chain '#forum' reps 2DD584C5A3B713F6811E87D763E9390561E6F55A9DB97F2664F240C5DA378EFD
    echo "Reps Leticia123"
    freechains chain '#forum' reps 5183BF43B30A72B5D4E38DB7421EE573BD0C86482A3545AE40AD546DC8BBF0A3
    echo "Reps Pedro"
    freechains chain '#forum' reps 5D1BD590ADBB3D3E6224EA3AA34CAD9B29E90061CB90847E363F291E8B4502C0
    echo "REPS pioneer"
    freechains chain '#forum' reps ADB56B48005452626DA84219DF000A2F92F63DC533D76BE0B806C4CF84A422F8
}

show_reps
