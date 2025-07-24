# ScradaCadeaubonnen

Projectwerk 1 2024-2025 (semester 2)  
Scrada Cadeaubons  

**Let op!** De business-verantwoordelijke van elk team (zie hieronder) bundelt vragen voor de klant en legt deze voor aan de lector. De lector overlegt vervolgens met de klant en speelt de relevante informatie terug door aan alle teams.

## Video-opdracht  
Jeffrey Baeke stelt de opdracht voor. De video blijft beschikbaar voor de ontwikkelingsteams.

## Doel  
Met de te ontwikkelen applicatie kan een gebruiker cadeaubons bekomen van 25 of 50 EUR of een zelfgekozen bedrag. Elke bon heeft een “thema” en krijgt een unieke code mee die een controlegetal bevat om verkeerde invoer te vermijden (zie hieronder). Een specifiek thema bepaalt de geldigheidsduur van de gekozen bon.

## Opdracht  
- De gebruiker registreert zich via emailadres.  
- De gebruiker kiest een thema uit een in de databank beschikbare set.  
- Thema’s hebben elk een apart icoon en stijlschema (bijvoorbeeld kleur of …).  
- Gebruiker selecteert een waarde of geeft de zelfgekozen waarde in.  
- Vervolgens betaalt de gebruiker via Stripe. De mededeling bevat het bonnummer ter confirmatie.  
- Betaling wordt geconfirmeerd en een email wordt verstuurd naar de gebruiker.  
- Gebruikers- en boninformatie worden bewaard in de databank (inclusief bonbedrag, moment aankoop, …).  
- De gebruiker kan via de applicatie bekijken:  
  - welke bons aangekocht werden  
  - wat het nog beschikbare saldo van elke bon is  
  - hoe lang de bon nog geldig is (default 1 jaar)  
  - waarvoor de bon reeds (deels) werd gebruikt. Consumptie van een (deel van) een bon mag gesimuleerd worden via een apart venster: selecteer bon, geef afnamebedrag en -reden in, keur goed.

## Projectwerk 1

### Technische context  
- De code wordt ontwikkeld met Visual Studio of Rider.  
- Er wordt gebruik gemaakt van C# .NET Core 9.0.  
- Als databank wordt gebruik gemaakt van SQL Server.  
- De code bestaat uit één solution met verschillende projecten.  
- Vanuit de code wordt met de databank gewerkt aan de hand van Dapper, wat de voorkeur wegdraagt, of ADO .NET.  
- De user interface wordt geïmplementeerd in WPF.  
- Configuratieinformatie wordt beschikbaar gesteld via configuratiebestanden.  
- De unit test suite wordt geïmplementeerd met XUnit.  
- De code base wordt beheerd in de git repository van je Azure DevOps project.  
- Sprint opvolging wordt uitgevoerd binnen Azure DevOps en code wordt ingecheckt met aan de hand van taken op het Kanban board.

### Opmerkingen  
- Voorzie een flexibel ontwerp zodanig dat veranderingen geen al te grote impact hebben.  
- Zorg voor een gebruiksvriendelijke interface.  
- Buiten de module voor Stripe worden geen bijkomende nuget packages gebruikt; indien dit toch nodig blijkt, dan moet dit eerst worden besproken met en goedgekeurd door de betrokken lector in samenspraak met het bedrijf.

### Werkwijze  
Het project wordt uitgevoerd door een team van maximaal 4 leden (Azure DevOps heeft een limiet op 5 ontwikkelaars): samenwerken is essentieel en bij de beoordeling van het resultaat van het projectwerk wordt hiermee dan ook in het bijzonder rekening gehouden.  

Naast het schrijven van code zijn er nog een heleboel andere taken die moeten worden uitgevoerd. Het succesvol realiseren van een project betekent niet uitsluitend dat de applicatie op een vooropgestelde datum opgeleverd wordt.  

In de eerste plaats moeten we er zeker van zijn dat wat we opleveren, wel degelijk is wat de klant wenst. Daarom zullen we op een ‘agile’- achtige manier te werk gaan. Dat wil zeggen dat we in stapjes tussentijdse opleveringen doen waarbij we afchecken of aan de verwachtingen van de klant voldaan wordt. Daarnaast moeten we er ook rekening mee houden dat deze applicatie zal moeten worden onderhouden door een ander team en dat er bijgevolg voldoende documentatie beschikbaar moet zijn om dit mogelijk te maken.

We definiëren daarom een aantal rollen en verantwoordelijkheden. Het is toegelaten om in overleg met de lector gaandeweg van rol te verwisselen, mocht blijken dat dit beter werkt (leer jezelf kennen).

### Organisatie  
- Inplannen meetings.  
- Rapporteert over de taakverdeling.  
- Zorgt voor de opvolging van het project, inclusief rapportering.  
- Zorgt voor voldoende documentatie.

### Business  
- Klaart elke onduidelijkheid over de business uit aan het team.  
- Controleert op inhoudelijke correctheid.  
- Stelt (inhoudelijke) scenario’s op die moeten worden getest.  
- Zorgt ervoor dat de business duidelijk wordt geïnformeerd over de vooruitgang.

### Testing  
- Zorgt voor de noodzakelijke unit tests.  
- Zorgt ervoor dat daily builds ook inzake unit tests steeds op “groen” staan.  
- Geeft overzicht van wat er getest is.  
- Zorgt voor integratietesten: de volledige applicatie wordt getest.

### Architectuur  
- Is verantwoordelijk voor het ontwerp: maakt beslissingen over architectuur en databank-layout.  
- Documenteert en motiveert beslissingen.  
- Is verantwoordelijk voor het beheer van de code base (Git).

**Let op:** als er bij verantwoordelijkheden staat “zorgt ervoor dat ...” wil dat niet per se zeggen dat de persoon met deze rol deze taak noodzakelijkerwijze zelf moet uitvoeren. Deze persoon zorgt er in essentie voor dat de taak wordt uitgevoerd.  

Voorbeeld: bij “Organisatie” staat dat voldoende documentatie vereist is. Dit wil niet zeggen dat deze persoon alle documentatie moet schrijven, maar wel dat deze persoon erop moet toezien dat elke klasse gedocumenteerd is op een eenduidige manier, dat overzichtsschema’s beschikbaar zijn, evenals testen en voldoende documentatie.

### Git  
De code moet beheerd worden aan de hand van een source code management systeem: dit is een opdracht voor elk lid van het team. Elk teamlid beschikt met andere woorden over voldoende basiskennis met betrekking tot het gebruik van Git.

### Hoe gaan we te werk?  
- Samenstelling teams.  
- Rolverdeling: wie is verantwoordelijk voor welk aspect van het project?  
- Gezamenlijke analyse en ontwerp:  
  - Databank (de noodzakelijke technieken ken je al bij het begin van het semester).  
  - Domeinlaag.  
  - UI (de eerste versie kan “getekend” worden, op papier of met een tool).  
- Bij elke sprint wordt een stand van zaken voorgelegd en besproken wat aangepakt kan worden tijdens de volgende sprint (demo, planning versus realisaties, Kanban board, obstakels en “risico’s”).  
- Elke student houdt een logboek bij met daarin de taken die zijn uitgevoerd en de tijd die er aan werd gespendeerd: dit is mogelijk binnen Azure DevOps.

## Referentiemateriaal  
- Opdracht: video Jeffrey Baeke (Scrada).  
- Azure DevOps  
- Powerpoint Wim Delvaux.  
- (Video’s Wim Delvaux.)  
- https://stripe.com en https://github.com/stripe/stripe-dotnet?tab=readme-ovfile.  
- Een voorbeeld van het gebruik van een controlegetal: je rekeningnummer. Het controlegetal is de modulo 97 (rest van deling door 97) van de 10 voorgaande cijfers maar indien de rest 0 bedraagt, dan wordt als controlegetal 97 gebruikt.
