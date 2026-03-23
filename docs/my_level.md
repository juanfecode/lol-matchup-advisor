# Mi nivel real como desarrollador — leé esto antes de empezar

## Quién soy
Me llamo Juan Felipe. Hice Le Wagon. Sé Rails pero estoy oxidado. Quiero aprender a construir aplicaciones que integren Ruby on Rails con APIs de IA (Claude, OpenAI, etc).

---

## Lo que demostré que SÉ hacer sin ayuda

- Crear un proyecto Rails con template de Le Wagon
- Generar modelos y correr migraciones
- Entender y corregir errores de migración (tabla mal nombrada, campos faltantes)
- Escribir seeds que consumen una API externa con `open-uri` y `JSON.parse`
- Crash-testear modelos en `rails console`
- Definir variables de instancia en el controller (`@champions = Champion.all.order(:name)`)
- Escribir loops en ERB correctamente (`<% @items.each do |item| %>`)
- Mostrar atributos de instancias del modelo en la vista (`item.name`, `item.image_url`)
- Entender el flujo completo: `form_with` → `params` → controller
- Acceder a params con `params[:key]`
- Usar `raise` para debuggear
- Escribir `f.select` con opciones fijas y opciones de la base de datos
- Manejar arrays en params con `name: "campo[]"`
- Conectar un Stimulus controller con `data-controller`
- Usar `data-action` con la sintaxis `"evento->controller#método"`

---

## Lo que estoy aprendiendo ahora mismo

- Métodos en Stimulus controllers (`hideAlly`, etc.)
- `data-*` attributes para comunicar HTML con Stimulus
- Conectar Rails con la API de Claude (Anthropic)
- Armar prompts dinámicos con datos de `params`

---

## Errores que cometo seguido — tené paciencia

- **Typos** en nombres de archivos (`controllet` en vez de `controller`)
- **Sintaxis JS en Ruby** (`params.role` en vez de `params[:role]`)
- **`new` donde no va** (`new Champion.all` en vez de `Champion.all`)
- **Duplicar argumentos** en helpers de Rails
- **Separar lo que debería ir en un solo hash** en `f.select`
- **`do |f|` duplicado** en `form_with`
- **`p` de Ruby** confundido con `<p>` de HTML

---

## Cómo pienso

Entiendo los conceptos pero me trabo en la sintaxis exacta. Si me explicás el "por qué" primero, llego al "cómo" solo. No necesito que me des el código — necesito que me des la lógica y me dejés intentarlo.

Cuando me equivoco en algo pequeño lo corrijo rápido. Cuando no entiendo un concepto, lo digo directamente.

---

## Lo que NO necesitás explicarme desde cero

- Qué es MVC
- Qué es una migración
- Qué es ERB
- Qué es `params`
- Qué es una variable de instancia
- Qué es Bootstrap
- Qué es Git / GitHub
- Qué es una API REST

---

## Lo que SÍ necesito que me expliques

- Cualquier cosa relacionada con integrar una API de IA en Rails
- Stimulus más allá del `connect()` básico
- Turbo Streams para respuestas en tiempo real
- Cómo armar un prompt dinámico inteligente