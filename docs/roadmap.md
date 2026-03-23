| Fase | Nombre | Descripción | User Stories | Prioridad | Estado | Dependencias |
|------|--------|-------------|--------------|-----------|--------|--------------|
| Fase 0 | Setup | Rails 7.2 + PostgreSQL + template Le Wagon, primer commit | 1-2 | P0 | Completada | — |
| Fase 1 | Modelo Base | Modelo Champion con campos, seeds desde Riot Data Dragon (167 campeones) | 3-7 | P0 | Completada | Fase 0 |
| Fase 2 | Formulario | Vista principal con form_with: select de rol, 5 enemigos, 5 aliados, 3 pool. Verificar params con raise | 8-14 | P0 | Completada | Fase 1 |
| Fase 3 | Stimulus | Método hideAlly en matchup_controller.js: ocultar ally select del rol elegido | 15-16 | P0 | Pendiente | Fase 2 |
| Fase 4 | Claude API | Instalar gema anthropic, armar prompt dinámico, llamar API de Claude, parsear respuesta | 17-20 | P0 | Pendiente | Fase 3 |
| Fase 5 | Mostrar Respuesta | Renderear respuesta de Claude con Turbo Stream en div#claude-response sin reload | 21-23 | P0 | Pendiente | Fase 4 |
| Fase 6 | UX Mejoras | Tom Select con autocompletado e imágenes, layout Bootstrap dos columnas | 24-27 | P1 | Pendiente | Fase 5 |
| Fase 7 | Auth | Devise: registro, login, logout, modelo User | 28-32 | P1 | Pendiente | Fase 5 |
| Fase 8 | Historial | Modelos Consultation y ConsultationChampion, persistir consultas, vista de historial | 33-39 | P1 | Pendiente | Fase 7 |
| Fase 9 | Runas | Modelo Rune, seeds desde Riot API, RuneRecommendation, Claude recomienda runas | 40-44 | P2 | Pendiente | Fase 8 |
| Fase 10 | Maestría | Modelo UserMastery, integración Riot API para maestría, Claude considera maestría | 45-48 | P2 | Pendiente | Fase 9 |
