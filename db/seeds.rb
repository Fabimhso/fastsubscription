

# Criar planos de exemplo
plans_data = [
  {
    name: 'Gratuito',
    description: 'Plano básico para começar',
    price: 0.00,
    features: ['1 projeto', '100 requisições/mês', 'Suporte por email'],
    active: true
  },
  {
    name: 'Starter',
    description: 'Ideal para pequenas empresas',
    price: 29.90,
    features: ['5 projetos', '1.000 requisições/mês', 'Suporte prioritário', 'Relatórios básicos'],
    active: true
  },
  {
    name: 'Professional',
    description: 'Para empresas em crescimento',
    price: 99.90,
    features: ['Projetos ilimitados', '10.000 requisições/mês', 'Suporte 24/7', 'Relatórios avançados', 'API personalizada'],
    active: true
  },
  {
    name: 'Enterprise',
    description: 'Solução completa para grandes empresas',
    price: 299.90,
    features: ['Tudo do Professional', 'Requisições ilimitadas', 'Suporte dedicado', 'SLA garantido', 'Integração personalizada'],
    active: true
  }
]

plans_data.each do |plan_data|
  features_json = plan_data[:features].to_json
  Plan.find_or_create_by!(name: plan_data[:name]) do |plan|
    plan.description = plan_data[:description]
    plan.price = plan_data[:price]
    plan.features = features_json
    plan.active = plan_data[:active]
  end
end

puts "Planos criados com sucesso!"
