-- Fix RLS policies para permitir INSERT, UPDATE, DELETE al usuario autenticado

drop policy if exists "Admin only" on leads;
drop policy if exists "Admin only" on proyectos;
drop policy if exists "Admin only" on finanzas;

-- LEADS
drop policy if exists "leads_select" on leads;
drop policy if exists "leads_insert" on leads;
drop policy if exists "leads_update" on leads;
drop policy if exists "leads_delete" on leads;
create policy "leads_select" on leads for select using (auth.role() = 'authenticated');
create policy "leads_insert" on leads for insert with check (auth.role() = 'authenticated');
create policy "leads_update" on leads for update using (auth.role() = 'authenticated');
create policy "leads_delete" on leads for delete using (auth.role() = 'authenticated');

-- PROYECTOS
drop policy if exists "proyectos_select" on proyectos;
drop policy if exists "proyectos_insert" on proyectos;
drop policy if exists "proyectos_update" on proyectos;
drop policy if exists "proyectos_delete" on proyectos;
create policy "proyectos_select" on proyectos for select using (auth.role() = 'authenticated');
create policy "proyectos_insert" on proyectos for insert with check (auth.role() = 'authenticated');
create policy "proyectos_update" on proyectos for update using (auth.role() = 'authenticated');
create policy "proyectos_delete" on proyectos for delete using (auth.role() = 'authenticated');

-- FINANZAS
drop policy if exists "finanzas_select" on finanzas;
drop policy if exists "finanzas_insert" on finanzas;
drop policy if exists "finanzas_update" on finanzas;
drop policy if exists "finanzas_delete" on finanzas;
create policy "finanzas_select" on finanzas for select using (auth.role() = 'authenticated');
create policy "finanzas_insert" on finanzas for insert with check (auth.role() = 'authenticated');
create policy "finanzas_update" on finanzas for update using (auth.role() = 'authenticated');
create policy "finanzas_delete" on finanzas for delete using (auth.role() = 'authenticated');
