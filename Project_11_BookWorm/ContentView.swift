//
//  ContentView.swift
//  Project_11_BookWorm
//
//  Created by KARAN  on 19/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title), // we can add reverse here to get the title in reverse order
        SortDescriptor(\.author)
    ]) var books : FetchedResults<Book>
    //we can make sorted books in the order by providng some parameters in sortdescriptors
    
    @State private var showingScreen = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(books){ book in
                    NavigationLink{
                        detailView(book: book)
                    } label: {
                        HStack{
                            emojiRatingView(rating: book.rating)
                                .font(.title)
                            VStack(alignment : .leading){
                                Text(book.title ?? "Unkown title")
                                    .font(.headline)
                                Text(book.author ?? "Unkown author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showingScreen.toggle()
                    } label: {
                        Label("Add Book" , systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingScreen) {
                addBookView()
            }
        }
    }
    
    func deleteBooks(at offsets : IndexSet){
        for offset in offsets{
            let book = books[offset]
            moc.delete(book)
        }
        
        try?moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
