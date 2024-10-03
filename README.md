# README

## 1. TidniNafna
Hér eru tvö skjöl. Bæði skjölin eru unninn í RStudio með tilliti til SQLite-kóðun. Ég ákvað að nota RStudio þar sem það er þæginlegt umhverfi og hægt er að skrifa skýrslu ásamt kóðabútum samfellt í eitt skjal.

Eitt skjalið er þannig RMarkdown sem inniheldur SQL og R kóða hægt er að sjá hvort kóðinn sé SQL eða R með því að skoða bútinn sem hann er inn í s.s. ```{r} daemi ``` eða ```{sql, connection = con}  daemi ```. 

Í RMarkdown til þess að geta tengst við csv filein var nauðsynlegt að nota R-kóðun (mjög basic sem við lærðum áður) til að ná í CSV filein og lesa þau inn svo hægt var að nota SQL fyrirspurnir á þær í gagnasafni. Þannig til að keyra það þurfiði einungis að hafa RStudio á tölvunni ykkar og svo "Knit-a" kóðann alveg eins og hann er. Þannig ENGIN commands eru nauðsynleg í skipanskrá til að keyra. 

ATH: passa að tengjast sqlite-martell github umhverfinu í RStudio þannig csv filein séu í sama umhverfi.

Hinsvegar í hinu skjalinu eru hrein SQL skipanaskrá þ.e. einungis SQL kóði. Þann kóða þarf að keyra í SQL-umhverfi s.s. MySQL eða DB skiptir svosem engu. En þar þarf að framkvæma skipanir í command line.  Skipanirnar má sjá sem comment í SQL skipanaskránni.En hér eru þær einnig til öryggis

- Skrifa í skipana línu: 
```bash
sqlite3 names_freq.db < names.sql
```
- Til að lesa gögn inn í töflu þarftu að fara út fyrir SQL skipanaskrána. Nota t.d. command lineið í SQL
- Til að importa csv-filein ef þau eru á sama directory svæði og þú ert að vinna í gerðu: 
```bash
.mode csv
.import first_names_freq.csv names
.import middle_names_freq.csv names
```
SQL fyrirspurnirnar eru eftirfarandi:
- Hvaða hópmeðlimur á algengasta eiginnafnið?
- Hvenær voru öll nöfnin vinsælust?
- Hvenær komu þau fyrst fram?

Það er hægt að skoða meðfylgjandi PDF sem fylgir með RMarkdown fileinu sem heitir `Lidur1.pdf`og þar er hægt að sjá nákvæmar niðurstöður úr hverri SQL fyrirspurn fyrir hverja spurningu.

## 2. isfolkid

Þetta er gert í Therminal í Visual Studio Code.

`C:\Users\halld\Downloads\Háskóli_Íslands\sqlite3 data\isfolkid.db`
- Frá C til sqlite3 er staðsetning forritið sem er notað til að decode-a skjalið isfolkid.db sem er upplýsingasafn sem inniheldur bókinna *söga ísfólksins*.

**`.output create_isfolkid.sql`**
- Output er notað til að *copy paste* efni úr skjali ístaðin fyrir að skrifa efnið upp á tölvuskjánum.)

**`.schema`**
- Sýnir upplýsingar um allar töflur, vísitölur og meira en inniheldur ekki gögnin sjálf, þetta sýnir beinagrind uppbygginarinnar á gögnunum.

**`.exit`**
- Fer út úr data\isfolkid.db og aftur inn í *files* þarf sem github upplýsingarnar eru staðsetar

**Þetta er skrfað í SQL kóða skjali.**

**`.tables`**
- Birtir lista af gagnagrunnir sem er í notkun sem fljótt yfirlit á töflunum en sýnir ekki gögnin sjálf.

**`.headers on`**
- notað til að skipta um birtingu dálkahausa í fyrirspurnarniðurstöðum (therminal), (gerir lítið sem ekkert).

**`select count(*) as adalpersonur from books;`**
- Telur hversu mörg `id` er í bókinni og skýrir töluna `adalpersonur`.

**`select count(id) as persónur from books;`**
- Telur  hversu margar persónur eru í

**`select count(*) as Þrengill from books where characters like '%Þengill%';`**
- Telur hversu of orðir Þengill kemur fram í bókinni

**`select count(*) as Paladin from books where characters like '%Paladín%';`**
- Telur hversu of orðir `Paladin` kemur fram í bókinni

**`select count(*) as illi from family where chosen_one like '%evil%';`**
- Telur hversu margir í bókinni eru skráðir sem `evil`.

**`select AVG(birth) as fædingartidni from family where gender like '%F%';`**
- Meðal ár sem stelpur fæðast í bókinni)

**`select MAX(pages) as fjoldiBls from books;`**
- Fer í gegnum allar línur og kíkir hvaða hæsta blaðsýðan er, með því finnur kóðin hversu margar blaðsýður eru í bókinni.

**`select AVG(length) as medaltal from storytel_iskisur;`**
- Meðal lengd þáttar hverns þátt í `storytel_iskisur`

Svo er notað `.read isfolkid.db` í Therminal til að lesa SQL kóðan.

## 3. Timataka

Þessi lausn felur í sér að sækja og vinna úr hlaupagögnum af vefsíðunni tímataka.net og vista þau í gagnagrunn. Lausnin samanstendur af nokkrum Python skrám og SQL skrá sem vinna saman til að sækja gögn, vinna úr þeim og geyma þau í SQLite gagnagrunni.


### Keyrsla
Til þess að keyra kóðann þarf einungis að keyra `august_url.py` svona:
```bash
python3 agust_url.py --input_file data/urls.txt --output_dir data --debug
```

og keyra `sql.sql` svona:
```bash
sqlite3 timataka.db < sql.sql
```

Þá höfum við fært öll gögnin úr águst mánuði af `timataka.net` yfir í SQLite gagnagrunn sem við getum annaðhvort skoðað með því að keyra þetta:
```bash
sqlite3 timataka.db
```
```bash
SELECT * FROM hlaup;
SELECT * FROM timataka LIMIT 10;
```

Eða keyra þetta:
```bash
python3 table.py
```
Mögulega þarf að eyða núverandi skrám til þess að byrja upp á nýtt, hægt að gera það með því að gera
```bash
rm data/hlaup_info.csv
rm data/hlaup.csv
rm tiamtaka.db
````

### Nánar

#### `timataka.py`
- **Tilgangur**: Sækir úrslitahlaup af gefinni slóð á tímataka.net, vinnur úr HTML gögnunum og vistar þau í CSV skrám.
- **Vinnuferli**
  - Sækir HTML innihald af gefnu URL.
  - Notar reglulegar segðir til að skrapa gögnin úr HTML töflum.
  - Vinnur úr upplýsingum um hlaupið (t.d. nafn, upphafstími).
  - Vistar gögnin í `hlaup.csv` og `hlaup_info.csv` í data möppunni.

##### Notkun
Keyrðu eftirfarandi skipun í skipanalínu:
```bash
python3 timataka.py --url "SLÓÐ Á ÚRSLITASÍÐU" --output_dir data --debug
```
- `--url`: Slóðin að úrslitasíðunni á tímataka.net (t.d. https://timataka.net/hlaup/urslit/?race=1&cat=overall).
- `--output_dir`: Mappan þar sem gögnin verða vistuð (sjálfgefið `data`).
- `--debug`: (Valfrjálst) Ef þetta flagg er sett, verður HTML skráin vistuð til villuleitar.

##### Dæmi
```bash
python3 timataka.py --url "https://timataka.net/snaefellsjokulshlaupid2014/urslit/?race=1&cat=overall" --output_dir data --debug
```
#### `agust_url.py`
- **Tilgangur**: Les inn lista af URL-slóðum úr textaskrá og keyrir `timataka.py` fyrir hverja slóð til að safna gögnum úr mörgum hlaupum.
- **Vinnuferli**: 
  - Les inn URL-slóðir úr `data/urls.txt` sem að er textaskjal með öllum URl-unum á timataka.net í ágúst mánuði.
  - Keyrir timataka.py fyrir hverja slóð í `data/urls.txt` með for lykkju og safnar saman gögnunum í sömu CSV skrár.

##### Notkun
Keyrðu eftirfarandi skipun: 
```bash
python3 agust_url.py --input_file data/urls.txt --output_dir data --debug
```
- `--input_file`: Slóð að textaskrá sem inniheldur lista af URL-slóðum (einn á hverri línu).
- `--output_dir`: Mappan þar sem gögnin verða vistuð (sömu og í timataka.py).
- `--debug`: (Valfrjálst) Ef þetta flagg er sett, verður HTML skráin vistuð fyrir hvert hlaup.

#### 3. `sql.sql`
- **Tilgangur**: Býr til SQLite gagnagrunn, skilgreinir töflur og les inn gögn úr CSV skránum sem `timataka.py` og `agust_url.py` hafa búið til.
- Vinnuferli:
  - Býr til töflurnar `hlaup` og `timataka` með viðeigandi dálkum.
  - Les inn gögn úr `hlaup_info.csv` og `hlaup.csv` og setur þau inn í gagnagrunninn.
  - Keyrir fyrirspurnir til að sannreyna gögnin (t.d. athugar hvort fjöldi þátttakenda stemmi).

##### Notkun
Keyrðu eftirfarandi skipun til að búa til gagnagrunninn:
```bash
sqlite3 timataka.db < sql.sql
```
- `tímataka.db`: Nafn á SQLite gagnagrunnsskránni sem verður búin til.
- `sql.sql`: SQL skipanaskráin sem inniheldur allar SQL skipanirnar.

Eftir keyrslu geturðu skoðað gagnagrunninn með því að opna hann í SQLite:
```bash
sqlite3 timataka.db
```
Og svo keyra SQL fyrirspurnir til að skoða gögnin:
```bash
SELECT * FROM hlaup;
SELECT * FROM timataka LIMIT 10;
```
Einnig er hægt að keyra `table.py` sem að er python kóði sem ég gerði til þess að sjá töflurnar á skýrari hátt með sqlite3 python pakka. 
```bash
python3 table.py
```
