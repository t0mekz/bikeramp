addresses = [
  "Jagiellończyka 10,	Gorzów Wielkopolski",
  "Słubicka	3,	Krosno Odrzańskie",
  "Rynek 3,	Międzyrzecz",
  "Stanisława Staszica 1,	Nowa Sól",
  "Wojska Polskiego 155,	Słubice",
  "Jana III Sobieskiego 6,	Świebodzin",
  "Dr. Pieniężnego 	24,	Zielona Góra",
  "Dr. Pieniężnego 	24,	Zielona Góra",
  "Skarbowa	26,	Żagań",
  "Osadników Wojskowych 3-4,Żary",
  "Pierwszej Brygady 21,	Drezdenko",
  "Daszyńskiego 47,	Sulęcin",
  "Zielony Rynek 7,	Wschowa",
  "Dr. Pieniężnego 24,	Zielona Góra",
  "Kazimierza Wielkiego 65,	Gorzów Wielkopolski",
  "Kostrzyńska 14,	Zielona Góra",
  "Kostrzyńska 14,	Zielona Góra",
  "Dworcowa 5,	Rzepin",
  "Myśliborska 34,Gorzów Wielkopolski",
  "Świecko 37,	Słubice",
  "aleja Tadeusza Kościuszki 83,	Łódź",
  "Józefa Piłsudskiego 18, Bełchatów",
  "Henryka Sienkiewicza 16,	Brzeziny",
  "Ludwika Norblina 2,	Głowno",
  "Dr. Antoniego Troczewskiego 	12,	Kutno",
  "9 Maja 31,	Łask",
  "Józefa Chełmońskiego 2, Łowicz",
  "Zachodnia 47,	Łódź",
  "Św. Teresy od Dzieciątka Jezus 105,	Łódź",
  "Gen. Walerego Wróblewskiego 10,	Łódź",
  "Gen. Walerego Wróblewskiego 10A,	Łódź",
  "6 Sierpnia 86A,	Łódź",
  "Dowborczyków 9/11,	Łódź",
  "Papiernicza 7,	Łódź",
  "Piotrkowska 14,	Opoczno",
  "Zamkowa 26,	Pabianice",
  "Wronia 65,	Piotrków Trybunalski",
  "Gabriela Narutowicza 12,	Poddębice",
  "Adama Mickiewicza 4, Radomsko",
  "Juliusza Słowackiego 4, Rawa Mazowiecka",
  "Spółdzielcza 3,	Sieradz",
  "Czerwona 22,	Skierniewice",
  "Józefa Montwiłła Mireckiego 37,	Tomaszów Mazowiecki",
  "Krakowskie Przedmieście 34,	Wieluń",
  "Zielona 15, Zduńska Wola",
  "ks. Jerzego Popiełuszki 8, Zgierz",
  "Rynek 12/13, Wieruszów",
  "al. Jana Pawła II 17, Łęczyca"
]

100.times do
  Trip.create(
    start_address: addresses.sample,
    destination_address: addresses.sample,
    price: rand * 100,
    date: rand(10.years).seconds.ago
  )
end
