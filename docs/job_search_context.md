# Contexto para búsqueda de trabajo — Juan Felipe Umaña

Este documento resume quién soy como desarrollador, qué estoy construyendo, por qué, y cómo estoy aprendiendo. Está pensado para que un asistente de IA (Claude Desktop con Google Calendar) me ayude a armar una rutina sostenida de aplicaciones a trabajos y mejora continua.

---

## 1. Perfil profesional

- **Nombre:** Juan Felipe Umaña
- **Email:** soyjuanfe@gmail.com
- **Idioma principal de trabajo:** español (cómodo leyendo/escribiendo inglés técnico)
- **Formación:** bootcamp Le Wagon
- **Stack principal:** Ruby on Rails
- **Foco actual:** integrar Rails con APIs de IA (Claude/Anthropic, OpenAI) — quiero posicionarme como dev Rails con capacidad real de construir features con LLMs.

### Nivel real (auto-evaluación honesta)

**Lo que sé hacer solo:**
- Crear proyectos Rails desde template de Le Wagon
- Modelos, migraciones, seeds (incluyendo seeds que consumen APIs externas con `open-uri` + `JSON.parse`)
- Debuggear en `rails console` y con `raise`
- Flujo completo `form_with` → `params` → controller → vista
- ERB correcto, `f.select` con opciones de DB y fijas, arrays en params (`name: "campo[]"`)
- Stimulus básico: `data-controller`, `data-action`, `data-*` attributes
- Git/GitHub, MVC, REST, migraciones, ERB, params, variables de instancia, Bootstrap — todo esto ya lo tengo internalizado

**Lo que estoy aprendiendo activamente:**
- Métodos más avanzados en Stimulus controllers
- Integrar Rails con API de Claude (Anthropic)
- Armar prompts dinámicos con `params`
- Turbo Streams para respuestas en tiempo real
- Tailwind CSS (migrando desde Bootstrap)

**Errores que cometo seguido (contexto honesto para el asistente):**
- Typos en nombres de archivos
- Confundir sintaxis JS con Ruby (`params.role` en vez de `params[:role]`)
- Usar `new` donde no va
- Duplicar argumentos en helpers
- Confundir `p` de Ruby con `<p>` de HTML

**Cómo aprendo mejor:**
Entiendo los conceptos pero me trabo en la sintaxis. Si alguien me explica el "por qué" primero, llego al "cómo" solo. No quiero que me den el código resuelto — quiero la lógica y espacio para intentarlo.

---

## 2. Proyecto actual — LoL Matchup Advisor

### Qué es
App web en Ruby on Rails que recomienda qué campeón de League of Legends jugar según el matchup enemigo, usando la API de Claude para generar la recomendación en tiempo real.

El flujo: el usuario elige su rol, los 5 campeones enemigos, los 5 aliados y su pool personal de 3 campeones que domina. La app manda ese contexto a Claude y Claude responde con: mejor pick del pool, runas, build, razonamiento, amenazas, win condition y 2do/3er pick.

### Por qué este proyecto
- **Educativo:** aprender a integrar Rails con APIs de IA de punta a punta.
- **Personal:** soluciona un problema real mío (juego LoL, la decisión de pick es difícil).
- **Portfolio:** pieza demostrable de que sé construir features con LLMs, no solo CRUDs.

### Stack técnico
- Ruby 3.3.5 / Rails 7.2.2.1
- PostgreSQL
- Tailwind CSS v4.4 (migrado desde Bootstrap)
- Stimulus + Turbo (Hotwire)
- Gema oficial `anthropic` para Claude API
- Gema `redcarpet` para renderizar markdown
- `dotenv-rails` para manejar `ANTHROPIC_API_KEY`
- Modelo actual: `claude-sonnet-4-20250514`

### Qué decisiones de arquitectura tomé (y por qué)
- **Recommendation NO se persiste en DB** — es una consulta a Claude en tiempo real, `resources :recommendations, only: [:create]`
- **Campeones en DB propia** (167 campeones seedeados desde Riot API con `find_or_create_by` para idempotencia) — performance y para no depender de Riot API cada request
- **Pool personal de 3 campeones** — la recomendación es "de estos 3 que sabés jugar", no genérica
- **`name: "enemies[]"`** — para que Rails agrupe los 5 selects en un array
- **Stimulus en vez de JS suelto** — Rails way, mantenible
- **Turbo Stream para mostrar la respuesta** — sin reload, en `div#recommendation-result`
- **Respuesta JSON estructurada de Claude** (no markdown libre) — parseo en el controller y renderizo con cards tipadas

### Estado actual (2026-04-22)
- ✅ Formulario completo con rol, enemigos, aliados, pool
- ✅ Stimulus controller con `hideAlly` (oculta el ally select del rol elegido) y `updatePortrait` (carga retrato del campeón al seleccionar)
- ✅ Claude API integrada y respondiendo
- ✅ Turbo Stream + markdown rendering funcionando
- ✅ Design system "Mythic Modernist" implementado: dark blues, acentos dorados, 0px border-radius, glassmorphism, tri-font (Epilogue/Manrope/Space Grotesk)
- ✅ Imágenes de runas (Community Dragon CDN) e ítems (Data Dragon) integradas
- ✅ Fondo animado con nebula gradients
- 🟡 Branch `J-claudeApiIntegration` — pendiente merge a master

### Roadmap pendiente
1. **Tom Select** para autocompletado de campeones con imágenes
2. **Loading state** mientras Claude responde (~10-14s por request)
3. **Optimizar velocidad** de Claude (probar system prompt separado con cache)
4. **Responsive / mobile**
5. **Segunda entrega:** runas detalladas, maestrías, **Devise** (autenticación), **historial de recomendaciones**

### Qué me está enseñando este proyecto (skills tangibles para CV)
- Integrar Rails con APIs de LLM (prompt engineering estructurado, manejo de respuestas JSON de IA)
- Hotwire real (Turbo Streams, Stimulus)
- Migración Bootstrap → Tailwind v4
- Design systems (trabajando con un sistema definido, no improvisando)
- Manejo de credenciales (`.env` + `dotenv-rails`)
- Seeds idempotentes desde APIs externas

---

## 3. Cómo quiero que el asistente me ayude en la búsqueda de trabajo

### Objetivo general
Conseguir un trabajo como desarrollador Rails, idealmente en empresas que integren IA en sus productos, manteniendo una rutina sostenible que también me deje seguir aprendiendo.

### Rutina que quiero construir (base para que el asistente la agende en Google Calendar)
Ideas iniciales — el asistente puede ajustar según lo que funcione:

- **Bloque diario de aplicaciones** (fijo, corto, no agotador): revisar ofertas, aplicar a N puestos, personalizar cover letter
- **Bloque diario de coding del proyecto actual:** avanzar roadmap del LoL Matchup Advisor (es mi portfolio vivo)
- **Bloque semanal de estudio:** un tema de lo que estoy aprendiendo (Turbo Streams, prompt engineering, Tailwind, etc.)
- **Bloque semanal de networking:** LinkedIn, comunidades Rails/IA, eventos
- **Retro semanal:** qué apliqué, qué respondieron, qué aprendí, qué ajustar

### Qué necesito del asistente
- **Agendar bloques en Google Calendar** con recordatorios
- **Hacer seguimiento** de aplicaciones enviadas (empresa, fecha, estado)
- **Sugerir ajustes** cuando algo no esté funcionando (demasiadas aplicaciones sin respuesta → revisar CV, pocas ofertas relevantes → ampliar búsqueda)
- **Ayudarme a preparar material**: cover letters adaptadas, refinamiento de CV según el puesto, preparación para entrevistas técnicas de Rails
- **Recordarme el progreso del proyecto** y vincularlo con las aplicaciones (ej: "esta semana terminaste Turbo Streams, agrégalo al CV y menciónalo en las cartas")
- **Mantenerme honesto** con la rutina sin ser agobiante

### Estilo de comunicación que prefiero
- Español
- Directo, sin relleno
- Concepto antes de sintaxis / el "por qué" antes del "cómo"
- Opciones múltiples cuando haya decisiones
- Una pregunta / una tarea a la vez (no listas de 10 cosas de golpe)
- Cuando me equivoque, corregir solo la parte mal — no reescribir todo

---

## 4. Contexto adicional útil

- **Repositorio del proyecto:** `lol-matchup-advisor` (local en `/Users/juanfelipeumana/code/juanfecode/lol-matchup-advisor`)
- **Docs internos del proyecto:**
  - `docs/roadmap.md` — roadmap fase a fase
  - `docs/features.md` — features planeadas
  - `docs/user_stories.csv` — 48 user stories
  - `docs/teaching.md` y `docs/my_level.md` — cómo trabajo con asistentes IA
- **Fecha de este snapshot:** 2026-04-22
