import SwiftUI
import UIKit

struct GIFView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()

        if let gif = UIImage.gif(name: gifName) {
            imageView.contentMode = .scaleAspectFit
            imageView.image = gif
        }

        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {}
}


extension UIImage {
    public class func gif(name: String) -> UIImage? {
        guard let bundleURL = Bundle.main
                .url(forResource: name, withExtension: "gif"),
              let imageData = try? Data(contentsOf: bundleURL) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}


