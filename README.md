Fyrir lið 1 eru 2 skjöl. Bæði skjölin eru unninn í RStudio með tilliti til SQLite-kóðun. 
Eitt skjalið er þannig RMarkdown sem inniheldur SQL og R kóða hægt er að sjá hvort kóðinn sé SQL eða R með því að skoða bútinn sem hann er inn í s.s. {r} daemi  eða {sql, connection = con}  daemi . Í RMarkdown til þess að geta tengst við csv filein var nauðsynlegt að nota R-kóðun (mjög basic sem við lærðum áður) til að ná í CSV filein og lesa þau inn svo hægt var að nota SQL fyrirspurnir á þær í gagnasafni. Þannig til að keyra það þurfiði einungis að hafa RStudio á tölvunni ykkar og svo "Knit-a" kóðann alveg eins og hann er. Þannig ENGIN commands eru nauðsynleg í skipanskrá til að keyra. ATH: passa að tengjast sqlite-martell github umhverfinu í RStudio þannig csv filein séu í sama umhverfi.

Hinsvegar í hinu skjalinu eru hrein SQL skipanaskrá þ.e. einungis SQL kóði. Þann kóða þarf að keyra í SQL-umhverfi s.s. MySQL eða DB skiptir svosem engu. En þar þarf að framkvæma skipanir í command line. Skipanirnar má sjá sem comment í SQL skipanaskránni. En hér eru þær einnig til öryggis
--Skrifa í skipana línu: sqlite3 names_freq.db < names.sql
-- Til að lesa gögn inn í töflu skaltu þarftu að fara út fyrir SQL skipanaskrána. Nota t.d. command lineið í SQL
-- Til að importa csv-filein ef þau eru á sama directory svæði og þú ert að vinna í gerðu:
--.mode csv
--.import first_names_freq.csv names
--.import middle_names_freq.csv names

Það er hægt að skoða meðfylgjandi PDF sem fylgir með RMarkdown fileinu á branchinu "JakobLidur1" og þar er hægt að sjá nákvæmar niðurstöður úr hverri SQL fyrirspurn fyrir hverja spurningu. Þannig getiði borið saman niðurstöður ykkar og mínar.
