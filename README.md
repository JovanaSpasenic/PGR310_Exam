Github repo heter PGR310 istedenfor PGR301

# OPPGAVE 1
# 1A :
HTTP Endepunkt for Lambdafunkskonen som sensor kan teste med Postman:

https://by5lwd6wl8.execute-api.eu-west-1.amazonaws.com/Prod/generate-image



# 1B: 
Lenke til kjørt GitHub Actions workflow: Lever en lenke til en vellykket kjøring av GitHub Actions
workflow som har deployet SAM-applikasjonen til AWS:

https://github.com/JovanaSpasenic/PGR310_Exam/actions/runs/11802661873/job/32878812690 



# OPPGAVE 2 A og B

Lenke til Github Actions Workflow (Main):
https://github.com/JovanaSpasenic/PGR310_Exam/actions/runs/11822931141/job/32941086062

Lenke til Github Actions Workflow (Ikke main)
https://github.com/JovanaSpasenic/PGR310_Exam/actions/runs/11823989179/job/32944508863

Lenke til SQS kø
sqs_queue_url = "https://sqs.eu-west-1.amazonaws.com/244530008913/image-queue_82"


# OPPGAVE 3 A og B

Til meg selv husk:
- må laste ned mvn først!

# Beskrivelse av taggestrategi: Forklar kort hvordan du har valgt å tagge container imagene dine, og
gi en begrunnelse for denne strategien:

Jeg har valgt å tagge Docker-imagene med SHA-hashen fra committen som trigget GitHub Actions workflowen. Dette gir en unik tag for hvert build, knyttet til den spesifikke committen. 
Denne strategien gir teamet bedre kontroll og synlighet over versjoner, og gjør det lettere å samarbeide på tvers av ulike miljøer.

Fordeler:
- Sporbarhet: Hver tag er knyttet til en spesifikk commit, som gjør det enkelt å identifisere hvilken versjon av koden som er bygget.
- Feilsøking: Med SHA-basert tagging kan teammedlemmer enkelt spore tilbake til en spesifikk commit ved problemer.
- Effektivt teamarbeid: Denne tilnærmingen sikrer at alle i teamet jobber med den eksakte versjonen av applikasjonen, og gjør samarbeid og feilsøking mer effektivt.

