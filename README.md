# READ ME Liður 3

Þessi lausn felur í sér að sækja og vinna úr hlaupagögnum af vefsíðunni tímataka.net og vista þau í gagnagrunn. Lausnin samanstendur af nokkrum Python skrám og SQL skrá sem vinna saman til að sækja gögn, vinna úr þeim og geyma þau í SQLite gagnagrunni.


## Keyrsla
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
## Nánar

### `timataka.py`
- **Tilgangur**: Sækir úrslitahlaup af gefinni slóð á tímataka.net, vinnur úr HTML gögnunum og vistar þau í CSV skrám.
- **Vinnuferli**
  - Sækir HTML innihald af gefnu URL.
  - Notar reglulegar segðir til að skrapa gögnin úr HTML töflum.
  - Vinnur úr upplýsingum um hlaupið (t.d. nafn, upphafstími).
  - Vistar gögnin í `hlaup.csv` og `hlaup_info.csv` í data möppunni.

#### Notkun
Keyrðu eftirfarandi skipun í skipanalínu:
```bash
python3 timataka.py --url "SLÓÐ Á ÚRSLITASÍÐU" --output_dir data --debug
```
- `--url`: Slóðin að úrslitasíðunni á tímataka.net (t.d. https://timataka.net/hlaup/urslit/?race=1&cat=overall).
- `--output_dir`: Mappan þar sem gögnin verða vistuð (sjálfgefið `data`).
- `--debug`: (Valfrjálst) Ef þetta flagg er sett, verður HTML skráin vistuð til villuleitar.

#### Dæmi
```bash
python3 timataka.py --url "https://timataka.net/snaefellsjokulshlaupid2014/urslit/?race=1&cat=overall" --output_dir data --debug
```
### `agust_url.py`
- **Tilgangur**: Les inn lista af URL-slóðum úr textaskrá og keyrir `timataka.py` fyrir hverja slóð til að safna gögnum úr mörgum hlaupum.
- **Vinnuferli**: 
  - Les inn URL-slóðir úr `data/urls.txt` sem að er textaskjal með öllum URl-unum á timataka.net í ágúst mánuði.
  - Keyrir timataka.py fyrir hverja slóð í `data/urls.txt` með for lykkju og safnar saman gögnunum í sömu CSV skrár.

#### Notkun
Keyrðu eftirfarandi skipun: 
```bash
python3 agust_url.py --input_file data/urls.txt --output_dir data --debug
```
- `--input_file`: Slóð að textaskrá sem inniheldur lista af URL-slóðum (einn á hverri línu).
- `--output_dir`: Mappan þar sem gögnin verða vistuð (sömu og í timataka.py).
- `--debug`: (Valfrjálst) Ef þetta flagg er sett, verður HTML skráin vistuð fyrir hvert hlaup.

### 3. `sql.sql`
- **Tilgangur**: Býr til SQLite gagnagrunn, skilgreinir töflur og les inn gögn úr CSV skránum sem `timataka.py` og `agust_url.py` hafa búið til.
- Vinnuferli:
  - Býr til töflurnar `hlaup` og `timataka` með viðeigandi dálkum.
  - Les inn gögn úr `hlaup_info.csv` og `hlaup.csv` og setur þau inn í gagnagrunninn.
  - Keyrir fyrirspurnir til að sannreyna gögnin (t.d. athugar hvort fjöldi þátttakenda stemmi).

#### Notkun
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
