#encoding: utf-8
#encoding: US-ASCII
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "admin", admin: true, password: "qw",password_confirmation: "qw");

Size.create(name: "Стандарт",short_name: "стандарт 28 см");
Size.create(name: "Большая",short_name: "большая 38 см");
Size.create(name: "Мега",short_name: "мега 45 см");
Size.create(name: "Безразмерная",short_name: "нет размера");

Dough.create(name: "Тонкая",short_name: "Тонкая");
Dough.create(name: "Пышная",short_name: "Пышная");

Sauce.create(name: "Нет",short_name: "Нет");
Sauce.create(name: "Чесночно-сливочный",short_name: "Чесночно-сливочный");
Sauce.create(name: "Томатный",short_name: "Томатный");
Sauce.create(name: "Болоньезе",short_name: "Болоньезе");
Sauce.create(name: "Сливочный",short_name: "Сливочный");
Sauce.create(name: "Цезарь",short_name: "Цезарь");
Sauce.create(name: "Пикантный с шафраном",short_name: "Пикантный с шафраном");

Pizzeria.create(name: "Красногвардейский", work:true, email:"test@1.ru");
Pizzeria.create(name: "Колпинский", work:true, email:"test@2.ru");
Pizzeria.create(name: "Пушкинский", work:true, email:"test@3.ru");
Pizzeria.create(name: "Павловский", work:true, email:"test@4.ru");

Coordinate.create(pizzeria_id:1,longitude:"30.4960615051269",latitude:"59.8545438826671");
Coordinate.create(pizzeria_id:1,longitude:"30.5063611877441",latitude:"59.8545438826671");
Coordinate.create(pizzeria_id:1,longitude:"30.5297071350097",latitude:"59.867300194203");
Coordinate.create(pizzeria_id:1,longitude:"30.5303937805176",latitude:"59.8783287355327");
Coordinate.create(pizzeria_id:1,longitude:"30.5276471984863",latitude:"59.9213739330178");
Coordinate.create(pizzeria_id:1,longitude:"30.4988080871582",latitude:"59.9719237402823");
Coordinate.create(pizzeria_id:1,longitude:"30.4047376525879",latitude:"59.9574888029789");
Coordinate.create(pizzeria_id:1,longitude:"30.4067975891113",latitude:"59.9502689753515");
Coordinate.create(pizzeria_id:1,longitude:"30.3992444885254",latitude:"59.9289441155682");
Coordinate.create(pizzeria_id:1,longitude:"30.4170972717285",latitude:"59.9134578043728");
Coordinate.create(pizzeria_id:1,longitude:"30.4397565734863",latitude:"59.9031295814469");
Coordinate.create(pizzeria_id:1,longitude:"30.4514295471191",latitude:"59.8845306826108");
Coordinate.create(pizzeria_id:1,longitude:"30.4596692932129",latitude:"59.8741934612088");
Coordinate.create(pizzeria_id:1,longitude:"30.4782087219238",latitude:"59.8707470063294");
Coordinate.create(pizzeria_id:1,longitude:"30.4933149230957",latitude:"59.8635082882144");
Coordinate.create(pizzeria_id:1,longitude:"30.4933149230957",latitude:"59.8635082882144");

Coordinate.create(pizzeria_id:2,longitude:"30.6004316223144",latitude:"59.7123429600778");
Coordinate.create(pizzeria_id:2,longitude:"30.6162244689941",latitude:"59.7116503451019");
Coordinate.create(pizzeria_id:2,longitude:"30.6409437072754",latitude:"59.726538408332");
Coordinate.create(pizzeria_id:2,longitude:"30.6258375061035",latitude:"59.7306920343012");
Coordinate.create(pizzeria_id:2,longitude:"30.6258375061035",latitude:"59.7351912136282");
Coordinate.create(pizzeria_id:2,longitude:"30.6629163635254",latitude:"59.7421118459072");
Coordinate.create(pizzeria_id:2,longitude:"30.6684095275879",latitude:"59.7545653738892");
Coordinate.create(pizzeria_id:2,longitude:"30.6409437072754",latitude:"59.7663227781315");
Coordinate.create(pizzeria_id:2,longitude:"30.6581098449707",latitude:"59.7742739696211");
Coordinate.create(pizzeria_id:2,longitude:"30.6100446594238",latitude:"59.7932800113129");
Coordinate.create(pizzeria_id:2,longitude:"30.5939514053345",latitude:"59.808692868805");
Coordinate.create(pizzeria_id:2,longitude:"30.5612928283691",latitude:"59.821941366288");
Coordinate.create(pizzeria_id:2,longitude:"30.5579025161743",latitude:"59.835357113197");
Coordinate.create(pizzeria_id:2,longitude:"30.533526600647",latitude:"59.8315615657622");
Coordinate.create(pizzeria_id:2,longitude:"30.5167037857055",latitude:"59.8377722363383");
Coordinate.create(pizzeria_id:2,longitude:"30.5050308120727",latitude:"59.8426019571311");
Coordinate.create(pizzeria_id:2,longitude:"30.4888946426391",latitude:"59.8455339457991");
Coordinate.create(pizzeria_id:2,longitude:"30.4906112564087",latitude:"59.8538111081245");
Coordinate.create(pizzeria_id:2,longitude:"30.4809982192993",latitude:"59.8539835271163");
Coordinate.create(pizzeria_id:2,longitude:"30.4610425842285",latitude:"59.8488536800186");
Coordinate.create(pizzeria_id:2,longitude:"30.4528028381347",latitude:"59.8395403404218");
Coordinate.create(pizzeria_id:2,longitude:"30.4431898010254",latitude:"59.8284989337601");
Coordinate.create(pizzeria_id:2,longitude:"30.4438764465332",latitude:"59.8181442898372");
Coordinate.create(pizzeria_id:2,longitude:"30.4782087219238",latitude:"59.8001886155043");
Coordinate.create(pizzeria_id:2,longitude:"30.4912549865722",latitude:"59.7956981855678");
Coordinate.create(pizzeria_id:2,longitude:"30.5173475158691",latitude:"59.7683971845605");
Coordinate.create(pizzeria_id:2,longitude:"30.5152875793457",latitude:"59.7625193649551");
Coordinate.create(pizzeria_id:2,longitude:"30.5310804260254",latitude:"59.7517983243072");
Coordinate.create(pizzeria_id:2,longitude:"30.5571729553222",latitude:"59.7483391900459");
Coordinate.create(pizzeria_id:2,longitude:"30.5564863098144",latitude:"59.7379596384691");
Coordinate.create(pizzeria_id:2,longitude:"30.5709058654785",latitude:"59.7220380646754");
Coordinate.create(pizzeria_id:2,longitude:"30.5709058654785",latitude:"59.7220380646754");

Coordinate.create(pizzeria_id:3,longitude:"30.4145652664184",latitude:"59.6815510443225");
Coordinate.create(pizzeria_id:3,longitude:"30.4224616897583",latitude:"59.6876163890457");
Coordinate.create(pizzeria_id:3,longitude:"30.4331046951294",latitude:"59.6947201106289");
Coordinate.create(pizzeria_id:3,longitude:"30.4379112136841",latitude:"59.6999170011865");
Coordinate.create(pizzeria_id:3,longitude:"30.4365379226684",latitude:"59.7070181139601");
Coordinate.create(pizzeria_id:3,longitude:"30.434477986145",latitude:"59.7128191245599");
Coordinate.create(pizzeria_id:3,longitude:"30.4533607376098",latitude:"59.7122996720633");
Coordinate.create(pizzeria_id:3,longitude:"30.456278981018",latitude:"59.7258460871825");
Coordinate.create(pizzeria_id:3,longitude:"30.4950744522095",latitude:"59.7480797405421");
Coordinate.create(pizzeria_id:3,longitude:"30.4887229812622",latitude:"59.752446872117");
Coordinate.create(pizzeria_id:3,longitude:"30.4341346633911",latitude:"59.7353209886653");
Coordinate.create(pizzeria_id:3,longitude:"30.4296714675903",latitude:"59.7431065690214");
Coordinate.create(pizzeria_id:3,longitude:"30.419715107727",latitude:"59.7415495980108");
Coordinate.create(pizzeria_id:3,longitude:"30.4152519119263",latitude:"59.7492472474546");
Coordinate.create(pizzeria_id:3,longitude:"30.3493339431763",latitude:"59.7404250738417");
Coordinate.create(pizzeria_id:3,longitude:"30.3153449905395",latitude:"59.7362726568677");
Coordinate.create(pizzeria_id:3,longitude:"30.3143150222778",latitude:"59.7238123109195");
Coordinate.create(pizzeria_id:3,longitude:"30.3417808425903",latitude:"59.694893353309");
Coordinate.create(pizzeria_id:3,longitude:"30.3520805252075",latitude:"59.694893353309");
Coordinate.create(pizzeria_id:3,longitude:"30.3586036575317",latitude:"59.6912550688108");
Coordinate.create(pizzeria_id:3,longitude:"30.3781730545044",latitude:"59.6917748479387");
Coordinate.create(pizzeria_id:3,longitude:"30.3805763137817",latitude:"59.6903237777002");
Coordinate.create(pizzeria_id:3,longitude:"30.3858119857788",latitude:"59.6890675765768");
Coordinate.create(pizzeria_id:3,longitude:"30.3960258377075",latitude:"59.6891758716327");
Coordinate.create(pizzeria_id:3,longitude:"30.3984290969848",latitude:"59.6983580187085");
Coordinate.create(pizzeria_id:3,longitude:"30.4042655838013",latitude:"59.7006098589878");
Coordinate.create(pizzeria_id:3,longitude:"30.4155952346802",latitude:"59.6884827772246");
Coordinate.create(pizzeria_id:3,longitude:"30.4111320388794",latitude:"59.6860568338536");
Coordinate.create(pizzeria_id:3,longitude:"30.4104453933716",latitude:"59.682244282155");
Coordinate.create(pizzeria_id:3,longitude:"30.4104453933716",latitude:"59.682244282155");
Coordinate.create(pizzeria_id:3,longitude:"30.4145652664184",latitude:"59.6815510443225");

Coordinate.create(pizzeria_id:4,longitude:"30.4349929702759",latitude:"59.7126459746243");
Coordinate.create(pizzeria_id:4,longitude:"30.4531890762329",latitude:"59.7117802115039");
Coordinate.create(pizzeria_id:4,longitude:"30.4607421768188",latitude:"59.7143774336714");
Coordinate.create(pizzeria_id:4,longitude:"30.4665786636352",latitude:"59.7126459746243");
Coordinate.create(pizzeria_id:4,longitude:"30.4628021133423",latitude:"59.7071047036002");
Coordinate.create(pizzeria_id:4,longitude:"30.478251637268",latitude:"59.7069315240969");
Coordinate.create(pizzeria_id:4,longitude:"30.489581288147",latitude:"59.6980981812389");
Coordinate.create(pizzeria_id:4,longitude:"30.489581288147",latitude:"59.6908219133764");
Coordinate.create(pizzeria_id:4,longitude:"30.4847747695923",latitude:"59.6838906645233");
Coordinate.create(pizzeria_id:4,longitude:"30.4744750869751",latitude:"59.6800778663036");
Coordinate.create(pizzeria_id:4,longitude:"30.4796249282837",latitude:"59.6781713044821");
Coordinate.create(pizzeria_id:4,longitude:"30.4888946426391",latitude:"59.6799045469841");
Coordinate.create(pizzeria_id:4,longitude:"30.4899246109009",latitude:"59.6736644543943");
Coordinate.create(pizzeria_id:4,longitude:"30.4854614151001",latitude:"59.6738378059895");
Coordinate.create(pizzeria_id:4,longitude:"30.4854614151001",latitude:"59.670370603726");
Coordinate.create(pizzeria_id:4,longitude:"30.4641754043579",latitude:"59.662221266565");
Coordinate.create(pizzeria_id:4,longitude:"30.4507858169555",latitude:"59.6707173400919");
Coordinate.create(pizzeria_id:4,longitude:"30.4229766738891",latitude:"59.6701972341981");
Coordinate.create(pizzeria_id:4,longitude:"30.4322463882446",latitude:"59.6458299008975");
Coordinate.create(pizzeria_id:4,longitude:"30.4322463882446",latitude:"59.6232678408525");
Coordinate.create(pizzeria_id:4,longitude:"30.3924209487915",latitude:"59.6072916797163");
Coordinate.create(pizzeria_id:4,longitude:"30.3670150650024",latitude:"59.6204899237881");
Coordinate.create(pizzeria_id:4,longitude:"30.3924209487915",latitude:"59.6476515593218");
Coordinate.create(pizzeria_id:4,longitude:"30.3776580703735",latitude:"59.6506007013692");
Coordinate.create(pizzeria_id:4,longitude:"30.3529388320923",latitude:"59.662221266565");
Coordinate.create(pizzeria_id:4,longitude:"30.3580886734009",latitude:"59.6748778967323");
Coordinate.create(pizzeria_id:4,longitude:"30.3886443984985",latitude:"59.6802511847265");
Coordinate.create(pizzeria_id:4,longitude:"30.401690663147",latitude:"59.6767846459306");
Coordinate.create(pizzeria_id:4,longitude:"30.416110218811",latitude:"59.6811177633939");
Coordinate.create(pizzeria_id:4,longitude:"30.4339630020141",latitude:"59.6939405074775");
Coordinate.create(pizzeria_id:4,longitude:"30.4391128433227",latitude:"59.7000036091964");
Coordinate.create(pizzeria_id:4,longitude:"30.4391128433227",latitude:"59.7000036091964");

