| Módulo | Feature | Descripción | Fases Involucradas | Prioridad | Estado |
|--------|---------|-------------|--------------------|-----------|--------|
| Campeones | Base de datos de campeones | 167 campeones cargados desde Riot Data Dragon con name + champion_id + title + image_url | Fase 1 | P0 | Completada |
| Matchup | Formulario de matchup | Selects para rol, 5 enemigos, 5 aliados, 3 pool de campeones | Fase 2 | P0 | Completada |
| Stimulus | Hide ally por rol | Al elegir rol se oculta el select de aliado correspondiente | Fase 3 | P0 | Pendiente |
| Claude API | Recomendación con IA | Prompt dinámico con datos del matchup, llamada a Claude, respuesta personalizada | Fase 4 | P0 | Pendiente |
| Vista | Respuesta en tiempo real | Turbo Stream muestra la recomendación de Claude sin recargar la página | Fase 5 | P0 | Pendiente |
| Tom Select | Selects con autocompletado | Dropdowns inteligentes con búsqueda, filtro e imágenes de campeones | Fase 6 | P1 | Pendiente |
| Diseño | Layout dos columnas | Equipo aliado a la izquierda y equipo enemigo a la derecha con Bootstrap | Fase 6 | P1 | Pendiente |
| Auth | Autenticación con Devise | Registro, login, logout con Devise | Fase 7 | P1 | Pendiente |
| Historial | Historial de consultas | Persistir cada consulta a Claude con campeones elegidos, ver consultas pasadas | Fase 8 | P1 | Pendiente |
| Runas | Runas recomendadas | Base de datos de runas, Claude sugiere runas óptimas para el matchup | Fase 9 | P2 | Pendiente |
| Maestría | Maestría de campeones | Vincular cuenta Riot, importar maestría, Claude pondera experiencia del usuario | Fase 10 | P2 | Pendiente |
