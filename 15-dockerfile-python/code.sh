# Différentes images

docker pull python:alpine3.17  # 18.88MB
docker pull python:3.9.16-slim # 45.71MB
docker pull python:3.9.16-slim-bullseye # 45.71MB
docker pull python:3.9.16-bullseye # 336.93MB

# Trouver les digests par architecture
docker manifest inspect python:3.9.16-slim-bullseye

# Utiliser les digest plutôt que le tag dans vos build (tag = modifiable)
docker pull python@sha256:78740d6c888f2e6cb466760b3373eb35bb3f1059cf1f1b5ab0fbec9a0331a03d

# BP

1. Choisir une image légère && minimalist (multistage plus tard)

2. Définir précisément le tag de image ou le digest

3. Suppression des caches APT, APK... && /var/cache/xxx

4. Grouper les layers (surtout pour les installations et utiliser && \)

5. Utiliser .dockerignore (secrets, fichiers sensibles et inutiles...)

6. Utiliser plutôt COPY à la place de ADD (datas exterieures)

7. Créer un utilisateur par défaut

8. Utiliser cet utilisateur aux bons endroits USER && CMD

9. Supprimer éventuellement des éléments installés (avec précision)

10. Eviter à tout prix le tag latest

11. Vérifier le FROM (registries vérifiées, image maintenue, contrôle des couches)

12. Ou pousser ? registry publique ou privée

13. Eviter le monolith : bases de données + apps + statics...

14. Utiliser un linter

https://hadolint.github.io/hadolint/
https://github.com/hadolint/hadolint
docker run --rm -i hadolint/hadolint < Dockerfile

15. Ne pas pousser des secrets dedans (mot de passe, clefs, certificats...)

16. Variabiliser qunad même...

17. Eviter les outils de debug qui souvent sont néfastes pour la sécu (telnet, tcpdump, netcat...)

18. Définir des règles sur les labels (standardiser: équipes, langage, version...)

19. Vérifier la vulnérabilité (Clair, Falco...)

20. Méfiez vous des COPY vraiment...

21. Définir un WORKDIR

22. Vérifier la possiblité du multistage-build

23. Versionner c bien... et maintenir c mieux !!!

