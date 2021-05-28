//
//  HyperlinkedText.swift
//  pager
//
//  Created by Aleksandr Sidorov on 26.05.2021.
//

import SwiftUI

class URLInteractableTextView: UITextView, UITextViewDelegate {
    var didTapUrl: (URL) -> () = { _ in }
    
    func textView(_ textView: UITextView, shouldInteractWith url: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        didTapUrl(url)
        
        return false
    }
}

struct HyperlinkedText: UIViewRepresentable {
    private let text: NSAttributedString
    private let didTapUrl: (URL) -> ()
    
    init(text: String, didTapUrl: @escaping (URL) -> ()) {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        
        self.text = NSAttributedString(
            string: text,
            attributes: [
                .paragraphStyle: style,
                .font: UIFont.smallText,
                .foregroundColor: UIColor(.greyText)
            ])
        self.didTapUrl = didTapUrl
    }
    
    func makeUIView(context: Context) -> URLInteractableTextView {
        let view = URLInteractableTextView()
        
        view.dataDetectorTypes = .link
        view.linkTextAttributes = [.foregroundColor: UIColor(.linkWatcher)]
        view.isEditable = false
        view.isSelectable = true
        view.delegate = view
        
        return view
    }
    
    func updateUIView(_ uiView: URLInteractableTextView, context: Context) {
        uiView.attributedText = text
        uiView.didTapUrl = didTapUrl
    }
}

struct HyperlinkedText_Previews: PreviewProvider {
    static var previews: some View {
        HyperlinkedText(
            text: "Если возникли сложности при работе с Watcher, или есть предложения по улучшению, пишите на watcher_support@redmadrobot.com",
            didTapUrl: { _ in })
    }
}
