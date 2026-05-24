# FinanceEngine

> A portfolio iOS application showcasing **Clean Architecture**, **UIKit AutoLayout**, and **SwiftUI** side-by-side — demonstrating production-level code organization, testability, and modern iOS development practices.

![Swift](https://img.shields.io/badge/Swift-5.9-orange?logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-16%2B-blue?logo=apple&logoColor=white)
![UIKit](https://img.shields.io/badge/UIKit-AutoLayout-informational?logo=apple&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-%E2%9C%93-brightgreen?logo=swift&logoColor=white)
![Architecture](https://img.shields.io/badge/Architecture-Clean%20%2B%20MVVM-purple)
![Navigation](https://img.shields.io/badge/Navigation-Coordinator-yellow)
![Tests](https://img.shields.io/badge/Tests-Unit%20%2B%20UI-red)

---

## Why This Project Exists

FinanceEngine deliberately uses **both UIKit and SwiftUI** in the same codebase to demonstrate:

- **UIKit + AutoLayout** — programmatic constraints, custom `UICollectionViewLayout`, `UITableView` with diffable data sources (Payments feature)
- **SwiftUI** — declarative views, `@Observable`, `NavigationStack`, custom modifiers (Dashboard, Stocks, Transactions, Profile)
- **Interoperability** — `UIHostingController` and `UIViewRepresentable` bridging where the two frameworks meet
- **Clean Architecture** — both UI frameworks talk to the same Domain layer, proving the architecture is truly UI-agnostic

---

## Tech Stack

| Area | Technology |
|---|---|
| Language | Swift 5.0 |
| UI Frameworks | UIKit (programmatic AutoLayout) + SwiftUI |
| Architecture | Clean Architecture + MVVM |
| Navigation | Coordinator pattern |
| Networking | URLSession + custom `APIClient` |
| Persistence | CoreData |
| Concurrency | Swift Concurrency (`async/await`, `Task`) |
| Reactive | Combine / `@Observable` |
| Testing | XCTest (Unit + UI) |
| Minimum iOS | 16.0 |

---

## Architecture

```
┌──────────────────────────────────────────────┐
│               Presentation                   │
│                                              │
│   UIKit (AutoLayout)   SwiftUI (Declarative) │
│   ───────────────────  ──────────────────── │
│   Payments · UIKit     Dashboard · SwiftUI   │
│                        Stocks · SwiftUI      │
│                        Transactions · SwiftUI│
│                        Profile · SwiftUI     │
│                                              │
│        ViewModels · Coordinators             │
└───────────────────┬──────────────────────────┘
                    │ calls use cases
┌───────────────────▼──────────────────────────┐
│                  Domain                      │
│                                              │
│   Entities · Use Cases · Repo Protocols      │
│                                              │
│   Pure Swift — no UIKit, no SwiftUI,         │
│   no CoreData, no Alamofire. Ever.           │
└───────────────────┬──────────────────────────┘
                    │ implements protocols
┌───────────────────▼──────────────────────────┐
│                   Data                       │
│                                              │
│   APIClient · DTOs · Repositories            │
│   DataSources · CoreData Persistence         │
└──────────────────────────────────────────────┘
```

## Getting Started

### Requirements

- Xcode 26.5+
- iOS 16.0+ deployment target
- Swift 5

### Installation

```bash
git clone https://github.com/your-username/FinanceEngine.git
cd FinanceEngine
open FinanceEngine.xcodeproj
```

Select a simulator or connected device and press `⌘R`. No package resolution step required.

