# Read data
raw_data <- read.csv('data/201804111738.csv')

# Create output directory
dir.create('output', TRUE)

# Start with real data from id 36 on
raw_data <- subset(raw_data, id > 36)

# Mark row as completed
raw_data$completed <- raw_data$pan20 > 0

# Calculate the speed in minutes
raw_data$duration <- as.numeric(difftime(as.POSIXct(strptime(raw_data$updated_at, "%Y-%m-%d %H:%M")), as.POSIXct(strptime(raw_data$started_at, "%Y-%m-%d %H:%M"))))

# Questionary is completed when pan is filled out
completed <- subset(raw_data, completed == TRUE)


# Export data for panel provider
tic_list <- raw_data[,c('tic','group','completed','created_at', 'updated_at')]
write.csv(tic_list, file = 'output/tic_list.csv', row.names = F)

# Recode group to group number
completed$groupNumber <- NA

completed$groupNumber[completed$group == 'gj'] <- 1
completed$groupNumber[completed$group == 'ms'] <- 2
completed$groupNumber[completed$group == 'sb1'] <- 3
completed$groupNumber[completed$group == 'sb2'] <- 4

# Recode Emojis
completed$VA1_lo__VA1_hi <- 100 - completed$VA1_hi__VA1_lo
completed$PA1_lo__PA1_hi <- 100 - completed$PA1_hi__PA1_lo
completed$PA4_lo__PA4_hi <- 100 - completed$PA4_hi__PA4_lo3
completed$NA1_lo__NA1_hi <- 100 - completed$NA1_hi__NA1_lo
completed$NA4_lo__NA4_hi <- 100 - completed$NA4_hi__NA4_lo

# Recode MRS
# According Handbuch Fragebogen zur Erfassung der Persönlichkeit (MRS-30-R1) November 2017
#   6: sehr
#   5: ziemlich
#   4: eher
#   3: eher
#   2: ziemlich
#   1: sehr
# R mrs1: gesprächig | schweigsam
# mrs2: reizbar | gutmütig
# R mrs3: gründlich | unsorgfältig
# R mrs4: verletzlich | robust
# R mrs5: künstlerisch | unkünstlerisch
# mrs6: zurückhaltend | kontaktfreudig
# R mrs7: nachsichtig | barsch
# mrs8: ungeordnet | geordnet
# mrs9: selbstzufrieden | selbstmitleidig
# mrs10: unkreativ | kreativ
# mrs11: anschlussbedürftig | einzelgängerisch # Nicht in MRS-30 enthalten!
# mrs12: selbstsüchtig | selbstlos
# mrs13: übergenau | ungenau # Nicht in MRS-30 enthalten!
# R mrs14: überempfindlich | entspannt
# mrs15: originell | konventionell # Nicht in MRS-30 enthalten!
# mrs16: zurückgezogen | gesellig
# R mrs17: friedfertig | streitsüchtig
# mrs18: nachlässig | gewissenhaft
# mrs19: gefühlsstabil | labil
# mrs20: phantasielos | phantasievoll
completed$mrs1r <- 7 - completed$mrs1 # e1
completed$mrs3r <- 7 - completed$mrs3 # g1
completed$mrs4r <- 7 - completed$mrs4 # n1
completed$mrs5r <- 7 - completed$mrs5 # k1
completed$mrs7r <- 7 - completed$mrs7 # v2
completed$mrs14r <- 7 - completed$mrs14 # n3
completed$mrs17r <- 7 - completed$mrs17 # v4

# Recode PANAVA
# According Kurzskalen zur Erfassung der Positiven Aktivierung, NegativenAktivierung und Valenz in Experience Sampling Studien (PANAVA-KS) Schallberger 2005
#   1: sehr
#   2: ziemlich
#   3: etwas
#   4: unentschieden
#   5: etwas
#   6: ziemlich
#   7: sehr
# R pnv1: zufrieden | unzufrieden
# R pnv2: energiegeladen | energielos
# Rpnv3: gestresst | entspannt
# pnv4: müde | hellwach
# pnv5: friedlich | verärgert
# pnv6: unglücklich | glücklich
# pnv7: lustlos | hoch motiviert
# pnv8: ruhig | nervös
# R pnv9: begeistert | gelangweilt
# R pnv10: besorgt | sorgenfrei
completed$pnv1r <- 8 - completed$pnv1
completed$pnv2r <- 8 - completed$pnv2
completed$pnv3r <- 8 - completed$pnv3
completed$pnv9r <- 8 - completed$pnv9
completed$pnv10r <- 8 - completed$pnv10

## Other Items
# who:
#   5: Die ganze Zeit
#   4: Meistens
#   3: Etwas mehr als die Hälfte der Zeit
#   2: Etwas weniger als die Hälfte der Zeit
#   1: Ab und zu
#   0: Zu keinem Zeitpunkt
# who1: In den letzten Tagen war ich froh und guter Laune
# who2: In den letzten Tagen habe ich mich ruhig und entspannt gefühlt
# who3: In den letzten Tagen habe ich mich energisch und aktiv gefühlt
# who4: In den letzten Tagen habe ich mich beim Aufwachen frisch und ausgeruht gefühlt
# who5: In den letzten Tagen war mein Alltag voller Dinge, die mich interessieren

# swl:
#   1: trifft überhaupt nicht zu
#   2: trifft nicht zu
#   3: trifft eher nicht zu
#   4: teils / teils
#   5: trifft eher zu
#   6: trifft zu
#   7: trifft vollständig zu
# swl1: In den meisten Bereichen entspricht mein Leben meinen Idealvorstellungen.
# swl2: Meine Lebensbedingungen sind ausgezeichnet.
# swl3: Ich bin mit meinem Leben zufrieden.
# swl4: Bisher habe ich die wesentlichen Dinge erreicht, die ich mir für mein Leben wünsche.
# swl5: Wenn ich mein Leben noch einmal leben könnte, würde ich kaum etwas ändern.

# pan:
#   1: gar nicht
#   2: ein bisschen
#   3: einigermassen
#   4: erheblich
#   5: äusserst
# pan1: aktiv
# pan2: bekümmert
# pan3: interessiert
# pan4: freudig erregt
# pan5: verärgert
# pan6: stark
# pan7: schuldig
# pan8: erschrocken
# pan9: feindselig
# pan10: angeregt
# pan11: stolz
# pan12: gereizt
# pan13: begeistert
# pan14: beschämt
# pan15: wach
# pan16: nervös
# pan17: entschlossen
# pan18: aufmerksam
# pan19: durcheinander
# pan20: ängstlich

# Export data
write.csv(completed, file = 'output/201804111738_recoded.csv', row.names = F)
library('foreign')
write.dta(completed, file = 'output/201804111738_recoded.dta')


