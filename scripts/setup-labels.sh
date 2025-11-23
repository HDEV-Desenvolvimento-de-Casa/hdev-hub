#!/bin/bash

# Script para criar labels via GitHub CLI
# Requer: gh (GitHub CLI) instalado e autenticado

echo "🏷️  Criando labels para HDEV Hub..."
echo ""

# Array de labels
labels=(
  "entrega:0E8A16:Issue de entrega de desafio"
  "aguardando-validação:FBCA04:Aguardando validação automática"
  "aprovado:0E8A16:Entrega aprovada"
  "reprovado:D93F0B:Entrega reprovada"
  "validado:5319E7:Validação concluída"
  "participante:1D76DB:Novo participante"
  "fork-automático:C2E0C6:Fork registrado automaticamente"
  "relatório:D4C5F9:Relatório semanal"
  "estatísticas:BFD4F2:Dados estatísticos"
  "automático:EDEDED:Criado por automação"
  "sync:FEF2C0:Sincronização de dados"
  "automação:C5DEF5:Processo automatizado"
)

# Verificar se gh está instalado
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) não está instalado."
    echo "📥 Instale em: https://cli.github.com/"
    exit 1
fi

# Verificar autenticação
if ! gh auth status &> /dev/null; then
    echo "❌ GitHub CLI não está autenticado."
    echo "🔐 Execute: gh auth login"
    exit 1
fi

echo "✅ GitHub CLI detectado e autenticado"
echo ""

# Criar cada label
for label_data in "${labels[@]}"; do
  IFS=':' read -r name color description <<< "$label_data"
  
  echo "📌 Criando: $name"
  
  # Tentar criar a label
  if gh label create "$name" --color "$color" --description "$description" 2>/dev/null; then
    echo "   ✅ Criada com sucesso"
  else
    # Se falhou, provavelmente já existe. Tentar atualizar.
    if gh label edit "$name" --color "$color" --description "$description" 2>/dev/null; then
      echo "   🔄 Atualizada (já existia)"
    else
      echo "   ⚠️  Erro ao criar/atualizar"
    fi
  fi
done

echo ""
echo "🎉 Processo concluído!"
echo ""
echo "📋 Para ver todas as labels:"
echo "   gh label list"

