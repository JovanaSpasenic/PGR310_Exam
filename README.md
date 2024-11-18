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

#### Beskrivelse av taggestrategi: Forklar kort hvordan du har valgt å tagge container imagene dine, og gi en begrunnelse for denne strategien:
Jeg har valgt å tagge Docker-imagene med latest, som representerer den nyeste stabile versjonen av applikasjonen. Denne strategien er valgt for å sikre at alle miljøer alltid bruker den nyeste versjonen av imaget uten behov for å spesifisere en konkret tag

Fordeler:
- Enkelhet: Bruken av latest gjør det lettere å administrere imagene, da man alltid refererer til den nyeste versjonen av applikasjonen uten å måtte holde styr på spesifikke SHA-hasher eller versjonsnummer.
- Konsistens på tvers av miljøer: Alle utviklings-, test- og produksjonsmiljøer vil automatisk bruke den nyeste versjonen av applikasjonen når latest-taggen er satt, noe som forenkler distribusjon og vedlikehold.
- Rask distribusjon: Ved å bruke latest kan man raskt rulle ut oppdateringer til alle miljøer uten å måtte oppdatere tags i flere konfigurasjonsfiler eller systemer.



#### Container image + SQS URL:

docker run -e AWS_ACCESS_KEY_ID=xxx -e AWS_SECRET_ACCESS_KEY=xxx -e SQS_QUEUE_URL="https://sqs.eu-west-1.amazonaws.com/244530008913/image-queue_82" jovanaspasenic/java_sqs_client:latest "me on top of a pyramid"



---

### OPPGAVE 4

- E-postadresse for varslinger --> Angi epost i terraform.tfvars
- Terraform koden for oppgaven ligger i under mappen infra/alarm_module ??
- Alarmen er på 1* minutt fordi.......

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