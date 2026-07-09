# EU-/DE-gehostete LLM-Inferenz-Anbieter

Stand Juli 2026. Recherche-Grundlage für die „Ökosystem"-Passage im Vortrag
und für die Wahl des Aufbereitungs-Modells (siehe [03-demo-fragen.md](03-demo-fragen.md)).

---

## Kern-Erkenntnis

Es gibt zwei Kategorien, die man **nicht vermischen darf**:

- **Rein deutsche Managed-LLM-Anbieter** (Stackit, IONOS, T-Systems, PhariaAI) — souverän, aber ohne eigenes Frontier-Modell. Sie hosten Open-Weight-Modelle (Llama, Mistral, Qwen, DeepSeek).
- **EU-Anbieter mit eigener Frontier-Kapazität** — praktisch nur **Mistral la Plateforme** (Paris). Seit Q2 2026 eigenes RZ, End-to-End-EU-Residency, echte Frontier-Klasse.

**Konsequenz für den Vortrag:** Wer Frontier-Qualität *und* EU-Jurisdiktion will, kommt an Paris nicht vorbei. Das ist eine ehrliche und wichtige Aussage — nicht "in DE gibt's alles".

---

## Deutsche Anbieter (Hauptbeispiele für den Vortrag)

**Stackit** (Schwarz-Gruppe, Heilbronn)
- RZ in DE/AT, ISO 27001, BSI-C5, Zero-Data-Retention
- OpenAI-kompatible API mit Llama 3.3, Mistral-Familie, Qwen, DeepSeek
- Seit 2026 zusätzlich PhariaAI (Aleph Alpha) als Service
- Reifster voll deutscher Managed-Stack, aber **kein eigenes Frontier-Modell**

**IONOS AI Model Hub** (Karlsruhe)
- IONOS-eigene DE/EU-RZ, DSGVO, kein Training auf Kundendaten
- OpenAI-kompatible API, Open-Source-Modelle (Llama, Mistral, Mixtral), Vector-DB + RAG
- Nur mittelgroße Open-Weight-Modelle, kein Frontier-Tier

**T-Systems / Open Telekom Cloud** (Frankfurt)
- BSI-C5, DSGVO, EU-Jurisdiktion. Marketplace mit Llama 3.3, Mistral Small 3, DeepSeek R
- **SOOFI-Projekt**: eigenes ~100B-EU-LLM auf 1.000+ B200-GPUs im Aufbau — noch nicht produktiv
- Aktuell solide, aber weniger frisch als Stackit/IONOS

**Aleph Alpha / PhariaAI** (Heidelberg)
- Positioniert sich als Souveränitäts-Stack, nicht als Modellhaus
- Deployment on-prem, air-gapped oder via Stackit
- Story glaubwürdig (Bundeswehr, Verwaltung), Modellqualität unter Frontier

## EU-Anbieter (nicht DE, aber EU-Jurisdiktion)

**Mistral la Plateforme** (Paris)
- Eigenes RZ Bruyères-le-Châtel, 13.800 GB300, 44 MW (seit Q2 2026)
- **Einziger Frontier-fähiger Provider mit End-to-End-EU-Residency**
- Mistral Large 3, Codestral, Pixtral, Magistral, Ministral. Fine-Tuning EU-resident

**OVHcloud AI Endpoints** (Roubaix)
- Serverless, 40+ Open-Source-Modelle, französisches Recht, SecNumCloud-Kontext
- Solide, günstig, kein PR-Blase-Anbieter

## Vorsicht (Souveränitäts-Washing-Grauzonen)

- **Nebius** — Nasdaq-notiert, RZ auch US/UK/IS. CLOUD-Act-Freiheit nicht sauber.
- **AWS European Sovereign Cloud Brandenburg** und **Microsoft Sovereign Public Cloud** — juristische Trennung, aber Mutterkonzerne bleiben US-Entitäten. Ehrlich als Grauzone benennen.
- Diverse "deutsche KI-Plattformen", die im Kleingedruckten auf Azure OpenAI Frankfurt oder Bedrock Frankfurt umleiten. **Immer nach Inferenz-Backend-Region und Vertragspartner fragen.**

## Symbolisch erwähnenswert

- **Teuken-7B / OpenGPT-X** (Fraunhofer IAIS) — öffentlich gefördertes Open-Weight-Modell in 24 EU-Sprachen. Kein Hoster, aber symbolisch wichtig.

---

## Empfehlung für die „Ökosystem"-Folie im Vortrag

Drei Anbieter zeigen, damit klar wird: es ist ein Ökosystem, nicht Ein-Anbieter-Bindung:

1. **Stackit** — Hauptbeispiel, reifster voll deutscher Managed-Stack
2. **IONOS AI Model Hub** — zweiter ernstzunehmender deutscher Player, andere Konzernphilosophie
3. **Mistral la Plateforme** — die ehrliche Frontier-Wahrheit: Paris, nicht Deutschland

Optional als Ausblick: **T-Systems SOOFI** — eigenes europäisches Frontier-Modell im Aufbau.

Der Aufhänger dazu: **„Wenn Frontier-Qualität nötig ist, gibt es in DE aktuell keinen 1:1-Ersatz für die US-Frontier-Modelle. In der EU schon — nur nicht in Deutschland."** Das ist ehrlich und macht die Debatte politisch relevant.

---

## Konsequenz für die Aufbereitungs-Frage

Für das FITKO-Kondensat (siehe [03-demo-fragen.md](03-demo-fragen.md)) brauchen wir Frontier-Qualität und EU-Residency.

**Meine klare Empfehlung: Mistral la Plateforme.**
- Frontier-Klasse, echte Trade-off- und Widerspruchserkennung
- EU-Jurisdiktion, sauber
- Kontextlänge ausreichend
- Meta-schön: Aufbereitung mit dem einzigen echten EU-Frontier-Anbieter, Demo mit lokalem Mistral kleinerer Klasse (Kontinuität in der Modell-Familie, unterschiedliche Größenordnungen — das ist eine gute Erzählung)

Zweite Wahl: **Stackit mit Llama 3.3 70B** — bleibt näher am Hauptbeispiel, verzichtet aber auf Frontier-Klasse. Realistisch: für ein 49-Dateien-Kondensat wahrscheinlich zu schwach.
