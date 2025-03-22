//
//  ContentView.swift
//  Project14-BucketList
//
//  Created by macmini on 3/23/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed...")
    }
}

struct ContentView: View {
    enum LoadingState {
        case loading, success , failed
    }

    @State private var loadingState = LoadingState.loading
    var body: some View {
//        if loadingState == .loading {
//            LoadingView()
//        } else if loadingState == .success {
//            SuccessView()
//        } else if loadingState == .failed {
//            FailedView()
//        }
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
    

}

#Preview {
    ContentView()
}
