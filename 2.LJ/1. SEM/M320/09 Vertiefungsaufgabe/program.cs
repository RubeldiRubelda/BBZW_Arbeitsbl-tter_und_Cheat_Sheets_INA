using System;
using System.Collections.Generic;

namespace SecretAgentGame
{
    public class Agent
    {
        public string Name { get; init; }
        public string IsIncapacitated => _hitpoints <= 0 ? "Ja" : "Nein";
        
        protected int _damage = 3;
        protected int _hitpoints = 20;

        public Agent(string name)
        {
            Name = name;
        }

        public void GetHit(int damage)
        {
            _hitpoints -= damage;
            if (_hitpoints < 0) _hitpoints = 0;
            Console.WriteLine($"[Agent] {Name} erleidet {damage} Schaden! Verbleibende HP: {_hitpoints}");
        }

        public int Attack()
        {
            Console.WriteLine($"[Agent] {Name} schlägt zurück und verursacht {_damage} Schaden.");
            return _damage;
        }

        public void ReduceDamage(int reduction)
        {
            _damage -= reduction;
            if (_damage < 0) _damage = 0;
            Console.WriteLine($"[Agent] {Name}s Schaden wurde durch einen Hackerangriff auf {_damage} reduziert!");
        }

        public bool IsAlive()
        {
            return _hitpoints > 0;
        }
    }

    public abstract class Henchman
    {
        public string Name { get; init; }
        protected int _damage;
        protected int _hitpoints;

        protected Henchman(string name)
        {
            Name = name;
        }

        public virtual void Attack(Agent agent)
        {
            // Standard-Angriffslogik für Henchmen
            agent.GetHit(_damage);
            int agentDamage = agent.Attack();
            _hitpoints -= agentDamage;
            if (_hitpoints < 0) _hitpoints = 0;
            Console.WriteLine($"[Henchman] {Name} erleidet {agentDamage} Gegenschaden! Verbleibende HP: {_hitpoints}");
        }

        public bool IsAlive()
        {
            return _hitpoints > 0;
        }
    }

    public class Thug : Henchman
    {
        public Thug(string name) : base(name)
        {
            _damage = 1;
            _hitpoints = 5;
        }

        public override void Attack(Agent agent)
        {
            Console.WriteLine($"[Thug] {Name} (Schläger) stürmt unermüdlich auf {agent.Name} ein!");
            // Ein Thug greift so lange an, bis er keine Hitpoints mehr hat oder der Agent besiegt ist
            while (_hitpoints > 0 && agent.IsAlive())
            {
                base.Attack(agent);
            }
        }
    }

    public class Killer : Henchman
    {
        public Killer(string name) : base(name)
        {
            _damage = 10;
            _hitpoints = 5;
        }
    }

    public class Hacker : Henchman
    {
        public Hacker(string name) : base(name)
        {
            _damage = 0;
            _hitpoints = 2;
        }

        public override void Attack(Agent agent)
        {
            Console.WriteLine($"[Hacker] {Name} manipuliert die Systeme von {agent.Name}!");
            agent.ReduceDamage(1);
            
            // Nimmt trotzdem normalen Gegenschaden vom Agenten
            int agentDamage = agent.Attack();
            _hitpoints -= agentDamage;
            if (_hitpoints < 0) _hitpoints = 0;
            Console.WriteLine($"[Hacker] {Name} erleidet {agentDamage} Gegenschaden! Verbleibende HP: {_hitpoints}");
        }
    }

    public class Villain
    {
        public string Name { get; init; }
        public Agent Archenemy { get; set; }
        private readonly List<Henchman> _henchmen = new List<Henchman>();

        public Villain(string name)
        {
            Name = name;
        }

        public void AddHenchman(Henchman henchman)
        {
            _henchmen.Add(henchman);
            Console.WriteLine($"[Villain] {Name} rekrutiert Scherge: {henchman.Name} ({henchman.GetType().Name})");
        }

        public void SendHenchmenOnAgent()
        {
            Console.WriteLine($"\n--- {Name} schickt seine Schergen auf {Archenemy.Name}! ---\n");

            foreach (var henchman in _henchmen)
            {
                if (!Archenemy.IsAlive()) break;

                Console.WriteLine($"\n> {henchman.Name} greift an:");
                henchman.Attack(Archenemy);
            }

            Console.WriteLine("\n-------------------------------------------");
            if (Archenemy.IsIncapacitated == "Ja")
            {
                Console.WriteLine($"Sieg! Der Geheimagent {Archenemy.Name} wurde ausser Gefecht gesetzt. {Name} triumphiert!");
            }
            else
            {
                Console.WriteLine($"Niederlage! {Name} muss sich geschlagen geben, da {Archenemy.Name} noch steht.");
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Villain blofeld = new Villain("Blofeld");
            Agent bond = new Agent("James Bond");
            
            blofeld.Archenemy = bond;
            blofeld.AddHenchman(new Thug("Beisser"));
            blofeld.AddHenchman(new Killer("Xenia"));
            blofeld.AddHenchman(new Hacker("Boris"));

            blofeld.SendHenchmenOnAgent();
        }
    }
}