//
//  ProspectsView.swift
//  Project16-HotProspects
//
//  Created by macmini on 3/23/25.
//

import SwiftUI
import SwiftData
import CodeScanner

struct ProspectsView: View {
    enum FilterType {
        case none, contacted , uncontacted
    }
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @State private var isShowScanner = false
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            "everyone"
        case .contacted:
            "contacted people"
        case .uncontacted:
            "uncontacted people"
        }
    }
    var body: some View {
        NavigationStack {
            List(prospects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle(title)
            .toolbar {
                Button("Scan", systemImage: "qrcode.viewfinder") {
                    isShowScanner = true
                    
                }
            }
            .sheet(isPresented: $isShowScanner) {
                CodeScannerView(
                    codeTypes: [.qr],
                    simulatedData: "enzo\nenzo@gmail.com",
                    completion: handleScan)
            }
        }
    }
    
    init(filter: FilterType) {
        self.filter = filter
        
        if filter != .none {
            let showContactedOnly = (filter == .contacted)
            
            _prospects = Query(filter: #Predicate {
                $0.isContacted == showContactedOnly
            }, sort: [SortDescriptor(\Prospect.name)])
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowScanner = false
        
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else {
                return
            }
            
            let person = Prospect(name: details[0], emailAddress: details[1], isContacted: false)
            modelContext.insert(person)
        case .failure(let error):
            print("scanning failed \(error.localizedDescription)")
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
