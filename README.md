# FinanceEngine

> A portfolio iOS application showcasing **Clean Architecture (MVVM + Coordinator)** built entirely in **SwiftUI** — demonstrating production-level code organisation, dependency injection, and modern Swift concurrency.

![Swift](https://img.shields.io/badge/Swift-5.9-orange?logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-16%2B-blue?logo=apple&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-%E2%9C%93-brightgreen?logo=swift&logoColor=white)
![Architecture](https://img.shields.io/badge/Architecture-Clean%20%2B%20MVVM--C-purple)
![Navigation](https://img.shields.io/badge/Navigation-Coordinator-yellow)

---

## Why This Project Exists

FinanceEngine is a self-directed project built to demonstrate Senior iOS engineering practices — not just working code, but code that is testable, scalable, and maintainable.

Key focus areas:
- **Clean Architecture** — strict layer separation so the Domain layer has zero knowledge of UIKit, SwiftUI, or any third-party library
- **Protocol-oriented design** — every dependency is injected through a protocol, making components independently testable
- **Generic networking** — type-safe `Endpoint<Response: Decodable>` eliminates stringly-typed API calls
- **Keychain security** — auth tokens stored securely using a generic, type-safe `KeychainManager`
- **Swift Concurrency** — `async/await` and `async let` for parallel API calls throughout

---

## Tech Stack

| Area | Technology |
|---|---|
| Language | Swift 5.9 |
| UI Framework | SwiftUI + UIKit | 
| Architecture | Clean Architecture + MVVM-C |
| Navigation | Coordinator pattern (`AppCoordinator`) |
| Networking | URLSession + custom generic `APIClient` |
| Persistence | Keychain (`KeychainManager`) |
| Concurrency | Swift Concurrency (`async/await`, `async let`, `@MainActor`) |
| Reactive | Combine (`ObservableObject`, `@Published`) |
| Minimum iOS | 16.0 |

---

## Architecture

```
┌──────────────────────────────────────────────┐
│               Presentation                   │
│                                              │
│            SwiftUI (Declarative)             │
│   ────────────────────────────────────────   │
│   Login · Dashboard · Transactions           │
│                                              │
│        ViewModels · AppCoordinator           │
└───────────────────┬──────────────────────────┘
                    │ calls use cases
┌───────────────────▼──────────────────────────┐
│                  Domain                      │
│                                              │
│   Entities · Use Cases · Repo Protocols      │
│                                              │
│   Pure Swift — no UIKit, no SwiftUI,         │
│   no networking, no persistence. Ever.       │
└───────────────────┬──────────────────────────┘
                    │ implements protocols
┌───────────────────▼──────────────────────────┐
│                   Data                       │
│                                              │
│   APIClient · DTOs · Repositories            │
│   KeychainManager · RequestBuilder           │
└──────────────────────────────────────────────┘
```

### Dependency Rule

Dependencies only point **inward**. The Domain layer knows nothing about the outside world — it defines protocols, Data implements them.

```
Features → Domain ← Data
```

---

## Project Structure

```
FinanceEngine/
├── Application/
│   ├── FinanceEngineApp.swift       # @main entry point
│   ├── AppCoordinator.swift         # Auth navigation state
│   └── AppCompositionRoot.swift     # Dependency wiring
│
├── Core/
│   ├── Network/                     # HTTPClient, Endpoint<T>, AnyEncodable
│   └── Persistence/                 # KeychainManager
│
├── Domain/
│   ├── Entities/                    # Account, Transaction, AuthToken
│   ├── Repositories/                # Repository protocols
│   └── UseCases/                    # Business logic
│
├── Data/
│   ├── DTOs/                        # Decodable API responses
│   └── Repositories/                # Protocol implementations
│
└── Features/
    ├── Login/                       # LoginView + LoginViewModel
    └── Dashboard/                   # DashboardView + DashboardViewModel
```

---

## Key Implementation Details

### Generic Networking

```swift
struct Endpoint<Response: Decodable> {
    let path: String
    let method: HTTPMethod
    let body: AnyEncodable?
    let requiresAuth: Bool
}

extension Endpoint where Response == AuthTokenDTO {
    static func login(email: String, password: String) -> Self { ... }
}
```

Type-safe endpoints — the compiler knows the response type at the call site.

### Keychain (Generic, Type-Safe)

```swift
protocol KeychainManagerProtocol {
    func save<T: Encodable>(_ object: T, for key: KeychainKey) throws
    func read<T: Decodable>(_ type: T.Type, for key: KeychainKey) throws -> T
    func delete(for key: KeychainKey) throws
}
```

Stores any `Codable` type — not just strings.

### Parallel API Calls

```swift
func loadDashboard() async {
    async let account = getAccountUseCase.execute()
    async let transactions = getTransactionsUseCase.execute()
    self.account = try await account
    self.transactions = try await transactions
}
```

Account and transactions fetch simultaneously, not sequentially.

### SwiftUI + Protocol ViewModel

```swift
struct DashboardView<ViewModel: DashboardViewModelProtocol>: View {
    @StateObject var vm: ViewModel
}
```

The view is generic over the protocol — swap real or mock ViewModel without changing the view.

---

## Getting Started

### Requirements

- Xcode 16.0+
- iOS 16.0+ deployment target
- Swift 5.9

### Installation

```bash
git clone https://github.com/your-username/FinanceEngine.git
cd FinanceEngine
open FinanceEngine.xcodeproj
```

Select a simulator or connected device and press `⌘R`. No third-party dependencies — no package resolution required.

---

