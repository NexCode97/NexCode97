-- Fix RLS policies para permitir INSERT, UPDATE, DELETE al usuario autenticado

drop policy if exists "Admin only" on leads;
drop policy if exists "Admin only" on proyectos;
drop policy if exists "Admin only" on finanzas;

-- LEADS
create policy "leads_select" on leads for select using (auth.role() = 'authenticated');
create policy "leads_insert" on leads for insert with check (auth.role() = 'authenticated');
create policy "leads_update" on leads for update using (auth.role() = 'authenticated');
create policy "leads_delete" on leads for delete using (auth.role() = 'authenticated');

-- PROYECTOS
create policy "proyectos_select" on proyectos for select using (auth.role() = 'authenticated');
create policy "proyectos_insert" on proyectos for insert with check (auth.role() = 'authenticated');
create policy "proyectos_update" on proyectos for update using (auth.role() = 'authenticated');
create policy "proyectos_delete" on proyectos for delete using (auth.role() = 'authenticated');

-- FINANZAS
create policy "finanzas_select" on finanzas for select using (auth.role() = 'authenticated');
create policy "finanzas_insert" on finanzas for insert with check (auth.role() = 'authenticated');
create policy "finanzas_update" on finanzas for update using (auth.role() = 'authenticated');
create policy "finanzas_delete" on finanzas for delete using (auth.role() = 'authenticated');
