Skrivefeil: Github repo heter PGR310 istedenfor PGR301

-----

## OPPGAVE 1
### A
HTTP Endepunkt for Lambdafunkskonen som kan testes med Postman:

https://by5lwd6wl8.execute-api.eu-west-1.amazonaws.com/Prod/generate-image




### B 
Lenke til en vellykket kjøring av GitHub Actions
workflow som har deployet SAM-applikasjonen til AWS:

https://github.com/JovanaSpasenic/PGR310_Exam/actions/runs/11802661873/job/32878812690 

---

## OPPGAVE 2 A og B

Lenke til Github Actions Workflow (Main):
https://github.com/JovanaSpasenic/PGR310_Exam/actions/runs/11822931141/job/32941086062

Lenke til Github Actions Workflow (Ikke main):
https://github.com/JovanaSpasenic/PGR310_Exam/actions/runs/11823989179/job/32944508863

Lenke til SQS kø:
sqs_queue_url = "https://sqs.eu-west-1.amazonaws.com/244530008913/image-queue_82"

---

## OPPGAVE 3 A og B

Til meg selv husk:
- må laste ned mvn først før mvn package!
- echo $COMMIT_SHA --> Sjekke om det er commit som er lagt til med SHA hash ????
- export COMMIT_SHA=$(git rev-parse --short HEAD) --> Dette vil bruke den korte SHA-verdien for den nåværende Git-commiten som tag for Docker-bildet.
- 

#### Beskrivelse av taggestrategi: Forklar kort hvordan du har valgt å tagge container imagene dine, og gi en begrunnelse for denne strategien:

Jeg har valgt å tagge Docker-imagene med SHA-hashen fra committen som trigget GitHub Actions workflowen. Dette gir en unik tag for hvert build, knyttet til den spesifikke committen. 
Denne strategien gir teamet bedre kontroll og synlighet over versjoner, og gjør det lettere å samarbeide på tvers av ulike miljøer.

Fordeler:
- Sporbarhet: Hver tag er knyttet til en spesifikk commit, som gjør det enkelt å identifisere hvilken versjon av koden som er bygget.
- Feilsøking: Med SHA-basert tagging kan teammedlemmer enkelt spore tilbake til en spesifikk commit ved problemer.
- Effektivt teamarbeid: Denne tilnærmingen sikrer at alle i teamet jobber med den eksakte versjonen av applikasjonen, og gjør samarbeid og feilsøking mer effektivt.



#### Container image + SQS URL:
docker run -e AWS_ACCESS_KEY_ID=xxx -e AWS_SECRET_ACCESS_KEY=yyy -e SQS_QUEUE_URL="https://sqs.eu-west-1.amazonaws.com/244530008913/image-queue_82" jovanaspasenic/java_sqs_client:47892d7 "me on top of a pyramid"


---

### OPPGAVE 4

- E-postadresse for varslinger --> Angi epost i terraform.tfvars
- Terraform koden for oppgaven ligger i under mappen infra/alarm_module ??

Instruksjoner:
1. Kjør 

# Burde terraform.tfvars ligge i gitignore ?

---

### OPPGAVE 5 

1. 
2. 
3. 


Kilde: 

- https://www.ibm.com/blog/serverless-vs-microservices/#:~:text=Microservices%20architectures%20are%20often%20less,of%20infrastructure%20and%20other%20resources.

----