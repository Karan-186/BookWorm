//
//  addBookView.swift
//  Project_11_BookWorm
//
//  Created by KARAN  on 19/06/22.
//

import SwiftUI

struct addBookView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss ) var dismiss
    
    
    @State private var title : String = ""
    @State private var author : String = ""
    @State private var rating = 3
    @State private var genre : String = ""
    @State private var review : String = ""
    
    let genres = ["Fantasy","Horror","Kids","Mystery","Poetry","Romance","Thriller"]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name of the book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    
                    Picker("Genre",selection: $genre){
                        ForEach(genres , id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                    
                }
                 header : {
                Text("Writ a review")
            }
        
            
            Section{
                Button("Save"){
                    let newBook = Book(context: moc)
                    newBook.id = UUID()
                    newBook.title = title 
                    newBook.author = author
                    newBook.rating = Int16(rating)
                    newBook.genre = genre
                    newBook.review = review
                    
                    try? moc.save()
                    dismiss()
                }
            }
        }
        .navigationTitle("Add Book")

        }
        
    }  
}


struct addBookView_Previews: PreviewProvider {
    static var previews: some View {
        addBookView()
    }
}
