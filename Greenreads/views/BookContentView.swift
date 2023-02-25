//
//  BookContentView.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-02-05.
//

import SwiftUI

struct BookContentViewInternals: View {
    // Argdefs
    let bookDescription: String;
    let rating: CGFloat;

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button (action: {}) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .light))
                        .padding(.horizontal, 15);
                }

                Spacer();

                StarRatingComponent(rating: rating, maxRating: 5)
                    .padding(.trailing, 15);
            }

            ScrollView {
                Text("\"\(bookDescription)\"")
                    .foregroundColor(.white)
                    .padding(30)
                    .font(.system(size: 18))
                    .italic();
            }

            Spacer()

            VStack {
                HStack {
                    Spacer()

                    Button(action: {}) {
                        Text("Add to library");
                        Image(systemName: "chevron.right");
                    }
                        .cornerRadius(20)
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 0.48, green: 0.51, blue: 0.42))
                        .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 15));
                }
            }
        }
    }
}

// Wrapper struct to allow background images to easily be applied
// Via a single BookContentView item
struct BookContentView: View {
    // Argdefs
    let bookDescription: String;
    let backgroundImageUrl: String;
    let rating: CGFloat;

    var body: some View {
        ZStack {
            BookContentViewInternals(
                bookDescription: bookDescription,
                rating: rating
            )
                .background(
                    AsyncImage(url: URL(string: backgroundImageUrl))
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .colorMultiply(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.3))
                        .blur(radius: 4)
                )
        }
    }
}

struct BookContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookContentView(
            bookDescription: "Set on the desert planet Arrakis, Dune is the story of boy Paul Atreides, heir to a noble family tasked with ruling an inhospitable world where the only thing of value is the \"spice\" melange, a drug capable of extending life and enhancing consciousness. Coveted across the known universe, melange is a prize worth killing for...\n\nWhen House Atreides is betrayed, the destruction of Paul's family will set the boy on a journey toward a destiny greater than he could ever have imagined. And as he evolves into the mysterious man known as Muad'Dib, he will bring to fruition, humankind's most ancient and unattainable dream.",
            backgroundImageUrl: "https://media.discordapp.net/attachments/640994428214837249/1075104620050919444/b.png.png",
            rating: 4.27
        ).background(.black);
    }
}
