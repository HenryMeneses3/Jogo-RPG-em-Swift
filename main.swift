import Foundation

struct Missao {
    let nome: String
    let intNec: Int
    let vigNec: Int
    let mobNec: Int
    let atqNec: Int
    let dificuldade: Int 
    let xpGanho: Int
}


struct Item {
    let nome: String
    let bonusInt: Int
    let bonusVig: Int
    let bonusMob: Int
    let bonusAtq: Int
}


class Heroi {
    let nome: String
    var inteligencia: Int
    var vigor: Int
    var mobilidade: Int
    var ataque: Int

    var nivel: Int = 1
    var xp: Int = 0

    
    var penalidadeInt = 0
    var penalidadeVig = 0
    var penalidadeMob = 0
    var penalidadeAtq = 0

    
    var scoreRanking = 0

    init(nome: String, inteligencia: Int, vigor: Int, mobilidade: Int, ataque: Int) {
        self.nome = nome
        self.inteligencia = inteligencia
        self.vigor = vigor
        self.mobilidade = mobilidade
        self.ataque = ataque
    }

    
    func statusAtual(_ item: Item?) -> (Int, Int, Int, Int) {
        var i = inteligencia - penalidadeInt
        var v = vigor - penalidadeVig
        var m = mobilidade - penalidadeMob
        var a = ataque - penalidadeAtq

        if let item = item {
            i += item.bonusInt
            v += item.bonusVig
            m += item.bonusMob
            a += item.bonusAtq
        }

       
        func lim(_ x: Int) -> Int {
            if x < 1 { return 1 }
            if x > 100 { return 100 }
            return x
        }

        return (lim(i), lim(v), lim(m), lim(a))
    }

    
    func ganharXP(_ valor: Int) {
        xp += valor
        while xp >= nivel * 100 {
            xp -= nivel * 100
            nivel += 1
            inteligencia = min(100, inteligencia + 5)
            vigor = min(100, vigor + 5)
            mobilidade = min(100, mobilidade + 5)
            ataque = min(100, ataque + 5)
            print("\n⭐ \(nome) subiu para o nível \(nivel)!")
        }
    }

    
    func aplicarPenalidadeFracasso() {
        penalidadeInt += 3
        penalidadeVig += 3
        penalidadeMob += 3
        penalidadeAtq += 3
        print("\(nome) recebeu penalidade por fracassar (-3 em cada status).")
    }

    func resetarPenalidades() {
        penalidadeInt = 0
        penalidadeVig = 0
        penalidadeMob = 0
        penalidadeAtq = 0
    }


    func adicionarScore(dificuldade: Int) {
        if dificuldade == 1 { scoreRanking += 10 }
        else if dificuldade == 2 { scoreRanking += 20 }
        else if dificuldade == 3 { scoreRanking += 35 }
    }
}


let itensDisponiveis = [
    Item(nome: "Poção de Inteligência", bonusInt: 10, bonusVig: 0, bonusMob: 0, bonusAtq: 0),
    Item(nome: "Armadura Leve", bonusInt: 0, bonusVig: 12, bonusMob: -2, bonusAtq: 0),
    Item(nome: "Botas Rápidas", bonusInt: 0, bonusVig: 0, bonusMob: 12, bonusAtq: 0),
    Item(nome: "Espada Afiada", bonusInt: 0, bonusVig: 0, bonusMob: 0, bonusAtq: 15)
]


var missoes: [Missao] = [
    Missao(nome: "Explorar Ruínas Antigas", intNec: 40, vigNec: 20, mobNec: 30, atqNec: 20, dificuldade: 1, xpGanho: 40),
    Missao(nome: "Derrotar Bandidos", intNec: 20, vigNec: 40, mobNec: 20, atqNec: 50, dificuldade: 2, xpGanho: 60),
    Missao(nome: "Investigar Assombração", intNec: 60, vigNec: 20, mobNec: 35, atqNec: 10, dificuldade: 3, xpGanho: 90),
    Missao(nome: "Salvar Aldeões", intNec: 30, vigNec: 40, mobNec: 40, atqNec: 20, dificuldade: 2, xpGanho: 70),
    Missao(nome: "Recuperar Artefato", intNec: 50, vigNec: 25, mobNec: 30, atqNec: 15, dificuldade: 2, xpGanho: 75),
    Missao(nome: "Derrotar Monstro da Caverna", intNec: 10, vigNec: 60, mobNec: 20, atqNec: 60, dificuldade: 3, xpGanho: 100),
    Missao(nome: "Exploração da Floresta Mística", intNec: 55, vigNec: 30, mobNec: 45, atqNec: 20, dificuldade: 2, xpGanho: 80),
    Missao(nome: "Patrulhar Estrada Real", intNec: 20, vigNec: 30, mobNec: 25, atqNec: 25, dificuldade: 1, xpGanho: 35),
    Missao(nome: "Limpar Catacumbas", intNec: 40, vigNec: 50, mobNec: 15, atqNec: 55, dificuldade: 3, xpGanho: 110),
    Missao(nome: "Ajudar Ferreiro", intNec: 10, vigNec: 50, mobNec: 10, atqNec: 40, dificuldade: 1, xpGanho: 25),
    Missao(nome: "Pesquisar Magia Proibida", intNec: 70, vigNec: 10, mobNec: 20, atqNec: 10, dificuldade: 3, xpGanho: 120),
    Missao(nome: "Caçar Feras Selvagens", intNec: 15, vigNec: 45, mobNec: 40, atqNec: 50, dificuldade: 2, xpGanho: 85),
    Missao(nome: "Ronda Noturna", intNec: 25, vigNec: 30, mobNec: 35, atqNec: 20, dificuldade: 1, xpGanho: 30),
    Missao(nome: "Proteger Caravana", intNec: 20, vigNec: 50, mobNec: 25, atqNec: 50, dificuldade: 2, xpGanho: 65),
    Missao(nome: "Eliminar Cultistas", intNec: 45, vigNec: 45, mobNec: 30, atqNec: 55, dificuldade: 3, xpGanho: 95)
]


var herois: [Heroi] = [
    Heroi(nome: "Ariel - O Sábio", inteligencia: 80, vigor: 20, mobilidade: 25, ataque: 15),
    Heroi(nome: "Brutus - O Guerreiro", inteligencia: 15, vigor: 70, mobilidade: 25, ataque: 20),
    Heroi(nome: "Lya - A Veloz", inteligencia: 20, vigor: 25, mobilidade: 65, ataque: 20),
    Heroi(nome: "Geralt - A lâmina", inteligencia: 20, vigor: 30, mobilidade: 20, ataque: 60)
]


var missoesFeitasNoDia = 0
var diaAtual = 1


func lerInteiro(prompt: String) -> Int {
    print(prompt, terminator: " ")
    if let s = readLine(), let n = Int(s) { return n }
    return -1
}


func sortearMissoes() -> [Missao] {
    return Array(missoes.shuffled().prefix(4))
}


func chanceSucesso(heroi: Heroi, missao: Missao, item: Item?) -> Int {
    let (i, v, m, a) = heroi.statusAtual(item)
    let totalHeroi = i + v + m + a
    let totalMissao = missao.intNec + missao.vigNec + missao.mobNec + missao.atqNec
    var chance = (Double(totalHeroi) / Double(totalMissao)) * 100.0

    if missao.dificuldade == 2 { chance -= 10 }
    if missao.dificuldade == 3 { chance -= 25 }

    if chance < 5 { chance = 5 }
    if chance > 95 { chance = 95 }

    return Int(chance)
}


func enviarHeroiParaMissao(_ h: Heroi, _ missao: Missao, item: Item?) {
    let chance = chanceSucesso(heroi: h, missao: missao, item: item)
    print("\n🔍 Chance de sucesso: \(chance)%")
    let rolagem = Int.random(in: 1...100)

    if rolagem <= chance {
        print("\n🎉 SUCESSO! \(h.nome) completou '\(missao.nome)' e ganhou \(missao.xpGanho) XP.")
        h.ganharXP(missao.xpGanho)
        h.adicionarScore(dificuldade: missao.dificuldade)
    } else {
        print("\n💀 FRACASSO! \(h.nome) falhou em '\(missao.nome)'.")
        h.aplicarPenalidadeFracasso()
    }

    missoesFeitasNoDia += 1
    if missoesFeitasNoDia >= 3 {
        passarDia()
    }
}


func passarDia() {
    diaAtual += 1
    missoesFeitasNoDia = 0
    print("\n🌅 Um novo dia amanheceu! Dia \(diaAtual).")
    for h in herois {
        h.resetarPenalidades()
    }
    print("Todas as penalidades foram removidas.\n")

    if diaAtual % 5 == 0 {
        batalhaChefeFinal()
    }
}


func listarHerois() {
    print("\n--- Heróis Disponíveis ---")
    for (i, h) in herois.enumerated() {
        let (iStat, vStat, mStat, aStat) = h.statusAtual(nil)
        print("\n\(i+1)) \(h.nome)")
        print("------------ Status do Herói -------------")
        print("INT: \(iStat)")
        print("VIG: \(vStat)")
        print("MOB: \(mStat)")
        print("ATQ: \(aStat)")
        print("Nível: \(h.nivel)")
        print("XP: \(h.xp)/\(100 * h.nivel)")
        print("Score: \(h.scoreRanking)")
        print("-------------------------------------------")
    }
}


func listarMissoes(_ lista: [Missao]) {
    print("\n--- Missões Sorteadas ---")
    for (i, m) in lista.enumerated() {
        print("\n\(i+1)) \(m.nome)")
        print("Dificuldade: \(m.dificuldade) | XP: \(m.xpGanho)")
        print("Requisitos: INT \(m.intNec) | VIG \(m.vigNec) | MOB \(m.mobNec) | ATQ \(m.atqNec)")
    }
}


func mostrarRanking() {
    print("\n===== 🏆 RANKING DOS HERÓIS =====")
    let ordenado = herois.sorted { a, b in
        if a.scoreRanking == b.scoreRanking { return a.nivel > b.nivel }
        return a.scoreRanking > b.scoreRanking
    }
    for (i, h) in ordenado.enumerated() {
        print("\n\(i+1)) \(h.nome)")
        print("Score: \(h.scoreRanking) | Nível: \(h.nivel) | XP: \(h.xp)/\(100 * h.nivel)")
    }
    print("=================================\n")
}


func batalhaChefeFinal() {
    print("\n🔥🔥🔥 CHEFE FINAL APARECEU NO DIA \(diaAtual)! 🔥🔥🔥")
    let multiplier = diaAtual / 5
    let intNec = 80 + multiplier * 5
    let vigNec = 80 + multiplier * 5
    let mobNec = 80 + multiplier * 5
    let atqNec = 80 + multiplier * 5
    let xpGanho = 200 + multiplier * 20

    let chefe = Missao(nome: "CHEFE FINAL – Besta Ancestral", intNec: intNec, vigNec: vigNec, mobNec: mobNec, atqNec: atqNec, dificuldade: 3, xpGanho: xpGanho)

    print("\nEscolha um herói para enfrentar o chefe:")
    listarHerois()
    guard let escolha = Int(readLine() ?? ""), escolha >= 1, escolha <= herois.count else {
        print("Nenhum herói escolhido. O chefe desapareceu por enquanto.")
        return
    }

    let heroi = herois[escolha - 1]
    print("\nO combate vai começar...")
    sleep(1)

    let chance = chanceSucesso(heroi: heroi, missao: chefe, item: nil)
    let rolagem = Int.random(in: 1...100)

    print("\nChance de vitória: \(chance)% (Rolagem: \(rolagem))")

    if rolagem <= chance {
        print("\n🎉 VITÓRIA CONTRA O CHEFE FINAL!!!")
        heroi.ganharXP(chefe.xpGanho)
        heroi.adicionarScore(dificuldade: chefe.dificuldade)
        heroi.scoreRanking += 100 
        heroi.resetarPenalidades()
        print("\(heroi.nome) recebeu +100 score e teve todas as penalidades removidas.")
    } else {
        print("\n💀 DERROTA PARA O CHEFE FINAL...")
        heroi.penalidadeInt += 6
        heroi.penalidadeVig += 6
        heroi.penalidadeMob += 6
        heroi.penalidadeAtq += 6
        print("\(heroi.nome) sofreu penalidade severa (-6 em cada status).")
    }
}


while true {
    print("""
    
📅 DIA \(diaAtual)

--- MENU ---
1) Listar Heróis
2) Sortear Missões (aparecem 4; você escolhe 1)
3) Ranking
4) Sair

Escolha:
""")

    if let s = readLine(), let op = Int(s) {
        switch op {
        case 1:
            listarHerois()
        case 2:
            let sorteadas = sortearMissoes()
            listarMissoes(sorteadas)

            print("\nEscolha uma missão (1-4) ou 0 para cancelar:")
            guard let idMissao = Int(readLine() ?? ""), idMissao >= 0, idMissao <= 4, idMissao != 0 else { continue }
            let missao = sorteadas[idMissao - 1]

            listarHerois()
            print("\nEscolha um herói (número) ou 0 para cancelar:")
            guard let idHeroi = Int(readLine() ?? ""), idHeroi >= 1, idHeroi <= herois.count else { continue }
            let heroi = herois[idHeroi - 1]

            print("\nEscolha um item (0 para nenhum):")
            for (i, item) in itensDisponiveis.enumerated() {
                print("\(i+1)) \(item.nome)")
            }
            let escolhaItem = Int(readLine() ?? "") ?? 0
            let itemSel: Item? = (escolhaItem >= 1 && escolhaItem <= itensDisponiveis.count) ? itensDisponiveis[escolhaItem - 1] : nil

            enviarHeroiParaMissao(heroi, missao, item: itemSel)

        case 3:
            mostrarRanking()
        case 4:
            print("Saindo... Obrigado por jogar!")
            exit(0)
        default:
            print("Opção inválida.")
        }
    }
}
