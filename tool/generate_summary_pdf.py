"""Generates a project summary PDF for the schach_app Flutter project."""

from fpdf import FPDF
from datetime import date


class PDF(FPDF):
    def header(self):
        self.set_font("Helvetica", "B", 11)
        self.set_fill_color(10, 58, 103)
        self.set_text_color(255, 255, 255)
        self.cell(0, 10, "  Schach App  -  Projektuebersicht", new_x="LMARGIN", new_y="NEXT", fill=True)
        self.ln(3)
        self.set_text_color(0, 0, 0)

    def footer(self):
        self.set_y(-15)
        self.set_font("Helvetica", "I", 8)
        self.set_text_color(130, 130, 130)
        self.cell(0, 10, f"Generiert am {date.today().strftime('%d.%m.%Y')}  |  Seite {self.page_no()}", align="C")

    def section_title(self, title):
        self.set_font("Helvetica", "B", 13)
        self.set_fill_color(224, 235, 247)
        self.set_text_color(10, 58, 103)
        self.cell(0, 8, f"  {title}", new_x="LMARGIN", new_y="NEXT", fill=True)
        self.ln(2)
        self.set_text_color(0, 0, 0)

    def body_text(self, text, indent=0):
        self.set_font("Helvetica", "", 10)
        self.set_x(self.l_margin + indent)
        self.multi_cell(0, 6, text)
        self.ln(1)

    def bullet(self, text, indent=5):
        self.set_font("Helvetica", "", 10)
        self.set_x(self.l_margin + indent)
        self.multi_cell(0, 6, "-  " + text)

    def kv(self, key, value):
        self.set_font("Helvetica", "B", 10)
        self.set_x(self.l_margin + 5)
        self.cell(45, 6, key + ":")
        self.set_font("Helvetica", "", 10)
        self.multi_cell(0, 6, value)


pdf = PDF()
pdf.add_page()

# Titel
pdf.ln(4)
pdf.set_font("Helvetica", "B", 22)
pdf.set_text_color(10, 58, 103)
pdf.cell(0, 12, "Schach App", align="C", new_x="LMARGIN", new_y="NEXT")
pdf.set_font("Helvetica", "I", 12)
pdf.set_text_color(80, 80, 80)
pdf.cell(0, 8, "Offline-first Flutter-App zum Schachlernen fuer Kinder", align="C", new_x="LMARGIN", new_y="NEXT")
pdf.ln(6)
pdf.set_text_color(0, 0, 0)

# 1. Ueberblick
pdf.section_title("1. Projektuberblick")
pdf.body_text(
    "Die Schach App ist eine Flutter-Applikation, die Kindern das Schachspielen beibringen soll. "
    "Sie funktioniert vollstaendig offline (offline-first), speichert alle Daten lokal und ist "
    "fuer mobile (iOS/Android) sowie Desktop- und Web-Plattformen ausgelegt. "
    "Der Fokus liegt auf einem spielerischen Lernansatz mit strukturierten Lektionen, "
    "taktischen Raetseln und Partien gegen eine KI."
)

# 2. Technologie-Stack
pdf.section_title("2. Technologie-Stack")
technologies = [
    ("Framework",        "Flutter (Dart)"),
    ("State Management", "BLoC (flutter_bloc)"),
    ("Dependency Inj.",  "GetIt"),
    ("Datenbank",        "Drift / SQLite (local-first)"),
    ("Schach-Engine",    "Stockfish (lokale KI, 3 Schwierigkeitsstufen)"),
    ("Regelprüfung",     "dartchess (Zugvalidierung, Schachregeln)"),
    ("Board-Rendering",  "flutter_chess_board"),
    ("Routing",          "go_router"),
    ("Code-Gen",         "freezed + json_serializable + drift_dev"),
    ("Plattformen",      "Android, iOS, macOS, Windows, Linux, Web"),
]
pdf.ln(1)
for k, v in technologies:
    # sanitize latin-1 incompatible chars
    k = k.encode("latin-1", "replace").decode("latin-1")
    v = v.encode("latin-1", "replace").decode("latin-1")
    pdf.kv(k, v)
pdf.ln(2)

# 3. Features / MVP
pdf.section_title("3. Implementierte Features (MVP)")
features = [
    "Lektionen: Lernfluss mit Erklaerung (explanation), gefuehrten Zuegen (guided_move) und freiem Spiel (free_play)",
    "Raetsel: Offline-Raetsel-Katalog aus Lichess-Daten (gen_* Packs) mit linienbasierter Loesung",
    "KI-Spiel: Partie gegen Stockfish mit 3 Schwierigkeitsvoreinstellungen",
    "Persistenz: Lokale Speicherung mit Drift/SQLite (Lernfortschritt, Spielverlauf, Raetsel-Status)",
    "Tages-Raetsel: Hervorhebung eines taeglichen Raetsels auf dem Homescreen",
    "Gespeicherte KI-Partien: Anzeige, Fortsetzung und Loeschung gespeicherter Partien",
    "Datengetriebenes Content-System: Lektionen und Raetsel aus JSON-Assets",
    "Zukunftssicheres User-Modell: local_user_id, remote_user_id, sync_state fuer spaetere Cloud-Sync",
]
for f in features:
    f = f.encode("latin-1", "replace").decode("latin-1")
    pdf.bullet(f)
pdf.ln(2)

# 4. Projektstruktur
pdf.section_title("4. Projektstruktur")
structure = [
    ("lib/core/engine",       "Schach-Engine, Zuglogik, BoardState, MoveResult"),
    ("lib/core/models",       "Datenmodelle: Lesson, Puzzle, GameRecord, UserProfile, SavedAiGame, Progress"),
    ("lib/core/opponent",     "Gegner: KI (Stockfish), Raetsel-Opponent, Online-Platzhalter"),
    ("lib/core/storage",      "Datenbank-Definitionen, Repositories (lokal + Interface)"),
    ("lib/core/content",      "Content-Loader & Manifest-Parser fuer JSON-Assets"),
    ("lib/features/home",     "Homescreen mit Daily-Puzzle-, Lektion- und Schnellspiel-Karten"),
    ("lib/features/lessons",  "Lektions-Liste & Player (BLoC, Screens, Widgets)"),
    ("lib/features/puzzles",  "Raetsel-Menu & Player (BLoC, Screens, Widgets, Hint-Button)"),
    ("lib/features/play",     "Spielmenu, Spielbrett, GameBloc, Zughistorie, Figurkontrolle"),
    ("lib/shared",            "Wiederverwendbare Widgets, App-Theme, Farben, BoardTheme"),
    ("lib/config",            "Routen (go_router), DI-Setup (GetIt), Konstanten, Feature-Flags"),
    ("assets/content",        "manifest.json, Lektions-JSON, Raetsel-JSON (inkl. generierte Packs)"),
    ("docs/",                 "ADRs (Architekturentscheidungen) + Markdown-Docs je Service/BLoC"),
    ("test/",                 "Unit-, Widget-, Golden-Tests (mocktail, flutter_test, golden_toolkit)"),
    ("tool/",                 "Hilfsskripte, z. B. Lichess-Raetsel-Generator"),
]
for path, desc in structure:
    pdf.set_font("Courier", "B", 9)
    pdf.set_x(pdf.l_margin + 5)
    pdf.cell(55, 6, path)
    pdf.set_font("Helvetica", "", 9)
    pdf.multi_cell(0, 6, desc)
pdf.ln(2)

# 5. Architektur
pdf.section_title("5. Architekturprinzipien")
arch = [
    "Offline-First: Alle Daten lokal via SQLite; kein Backend notwendig.",
    "Feature-Slice-Architektur: Jedes Feature (home, lessons, puzzles, play) ist in sich geschlossen.",
    "Repository-Pattern: Abstrakte Interfaces + lokale Implementierungen ermoeglichen kuenftige Remote-Backends.",
    "BLoC-Pattern: Klare Trennung von UI und Businesslogik; Events/States typsicher via freezed.",
    "Codegen: freezed, json_serializable und drift_dev reduzieren Boilerplate erheblich.",
    "Content-as-Data: Lektionen und Raetsel als JSON-Assets - kein hardcodierter Inhalt.",
    "Branch-Policy: Features auf Feature-Branches; nie direkt auf main committed.",
]
for a in arch:
    pdf.bullet(a)
pdf.ln(2)

# 6. Qualitaetssicherung
pdf.section_title("6. Qualitaetssicherung & Entwicklungsworkflow")
qa = [
    "dart format .  - einheitliche Code-Formatierung",
    "flutter analyze  - statische Analyse ohne Warnungen",
    "flutter test  - Unit-, Widget- und Golden-Tests",
    "Checkpoint-Commits nach jeder validierten Einheit (klein, reversibel, fokussiert)",
    "Docs-Maintenance: Bei Aenderungen an Services/BLoCs werden docs/ gleichzeitig aktualisiert",
    "AGENTS.md als verbindliche Leitlinie fuer alle Entwickler und KI-Agents",
]
for q in qa:
    pdf.bullet(q)
pdf.ln(2)

# 7. Abhaengigkeiten
pdf.section_title("7. Wichtige Abhaengigkeiten (pubspec.yaml)")
deps = [
    ("flutter_bloc ^9.1.1",           "State Management"),
    ("get_it ^9.2.1",                 "Dependency Injection"),
    ("go_router ^17.1.0",             "Deklaratives Routing"),
    ("drift ^2.31.0",                 "SQLite ORM"),
    ("dartchess ^0.12.1",             "Schachregeln & Zugvalidierung"),
    ("stockfish ^1.8.1",              "Lokale Schach-KI"),
    ("flutter_chess_board ^1.0.1",    "Schachbrett-Widget"),
    ("freezed_annotation ^3.1.0",     "Immutable Data Classes"),
    ("json_annotation ^4.11.0",       "JSON Serialisierung"),
    ("uuid ^4.5.3",                   "UUID-Generierung"),
    ("mocktail ^1.0.4",               "Mocking in Tests"),
    ("flutter_launcher_icons ^0.14.4","App-Icon-Generierung"),
]
for pkg, desc in deps:
    pdf.set_font("Courier", "", 9)
    pdf.set_x(pdf.l_margin + 5)
    pdf.cell(65, 6, pkg)
    pdf.set_font("Helvetica", "", 9)
    pdf.multi_cell(0, 6, desc)
pdf.ln(2)

# 8. Naechste Schritte
pdf.section_title("8. Moegliche naechste Schritte")
next_steps = [
    "Weitere Lektionen (Turm, Laufer, Springer, Dame, Koenig)",
    "Cloud-Sync: Remote-Backend anbinden (sync_state-Feld ist vorbereitet)",
    "Online-Multiplayer: Online-Opponent-Interface ist als Platzhalter angelegt",
    "Golden Tests aktivieren und Referenzbilder einchecken",
    "Erweiterte Raetsel-Packs (mehr Lichess-Kategorien, Themen-Packs)",
    "Analytics & Lernfortschritts-Dashboard",
    "Accessibility (a11y): Screenreader-Support fuer Schachbrett",
]
for n in next_steps:
    pdf.bullet(n)

# Speichern
output_path = "/Users/paulglaser/Documents/schach_app/schach_app_projektuebersicht.pdf"
pdf.output(output_path)
print(f"PDF gespeichert: {output_path}")
