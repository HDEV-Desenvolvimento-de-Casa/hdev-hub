# Script PowerShell para criar labels via GitHub CLI
# Requer: gh (GitHub CLI) instalado e autenticado

Write-Host "🏷️  Criando labels para HDEV Hub..." -ForegroundColor Cyan
Write-Host ""

# Array de labels (name, color, description)
$labels = @(
    @{name="entrega"; color="0E8A16"; description="Issue de entrega de desafio"},
    @{name="aguardando-validação"; color="FBCA04"; description="Aguardando validação automática"},
    @{name="aprovado"; color="0E8A16"; description="Entrega aprovada"},
    @{name="reprovado"; color="D93F0B"; description="Entrega reprovada"},
    @{name="validado"; color="5319E7"; description="Validação concluída"},
    @{name="participante"; color="1D76DB"; description="Novo participante"},
    @{name="fork-automático"; color="C2E0C6"; description="Fork registrado automaticamente"},
    @{name="relatório"; color="D4C5F9"; description="Relatório semanal"},
    @{name="estatísticas"; color="BFD4F2"; description="Dados estatísticos"},
    @{name="automático"; color="EDEDED"; description="Criado por automação"},
    @{name="sync"; color="FEF2C0"; description="Sincronização de dados"},
    @{name="automação"; color="C5DEF5"; description="Processo automatizado"}
)

# Verificar se gh está instalado
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "❌ GitHub CLI (gh) não está instalado." -ForegroundColor Red
    Write-Host "📥 Instale em: https://cli.github.com/" -ForegroundColor Yellow
    exit 1
}

# Verificar autenticação
try {
    $null = gh auth status 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw
    }
} catch {
    Write-Host "❌ GitHub CLI não está autenticado." -ForegroundColor Red
    Write-Host "🔐 Execute: gh auth login" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ GitHub CLI detectado e autenticado" -ForegroundColor Green
Write-Host ""

# Criar cada label
foreach ($label in $labels) {
    Write-Host "📌 Criando: $($label.name)" -ForegroundColor Cyan
    
    # Tentar criar a label
    $result = gh label create $label.name --color $label.color --description $label.description 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ✅ Criada com sucesso" -ForegroundColor Green
    } else {
        # Se falhou, provavelmente já existe. Tentar atualizar.
        $result = gh label edit $label.name --color $label.color --description $label.description 2>&1
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "   🔄 Atualizada (já existia)" -ForegroundColor Yellow
        } else {
            Write-Host "   ⚠️  Erro ao criar/atualizar" -ForegroundColor Red
        }
    }
}

Write-Host ""
Write-Host "🎉 Processo concluído!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Para ver todas as labels:" -ForegroundColor Cyan
Write-Host "   gh label list" -ForegroundColor White

