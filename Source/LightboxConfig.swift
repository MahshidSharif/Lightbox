import UIKit
import AVKit
import AVFoundation
import ImageManager
import StyleKit

public class LightboxConfig {
    /// Whether to show status bar while Lightbox is presented
    public static var hideStatusBar = true
    
    /// Provide a closure to handle selected video
    public static var handleVideo: (_ from: UIViewController, _ videoURL: URL) -> Void = { from, videoURL in
        let videoController = AVPlayerViewController()
        videoController.player = AVPlayer(url: videoURL)
        
        from.present(videoController, animated: true) {
            videoController.player?.play()
        }
    }
    
    /// Indicator is used to show while image is being fetched
    public static var makeLoadingIndicator: () -> UIView = {
        return LoadingIndicator()
    }
    
    /// Number of images to preload.
    ///
    /// 0 - Preload all images (default).
    public static var preload = 0
    
    public struct PageIndicator {
        public static var enabled = true
        public static var separatorColor = UIColor(hex: "3D4757")
        
        public static var textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor(hex: "899AB8"),
            .paragraphStyle: {
                var style = NSMutableParagraphStyle()
                style.alignment = .center
                return style
            }()
        ]
    }
    
    public struct CloseButton {
        public static var enabled = true
        public static var size: CGSize? = CGSize(width: 24, height: 24)
        public static var text: String?
        public static var image: UIImage?
        
        public static var textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 16),
            .foregroundColor: UIColor.white,
            .paragraphStyle: {
                var style = NSMutableParagraphStyle()
                style.alignment = .center
                return style
            }()
        ]
    }
    
    public struct DeleteButton {
        public static var enabled = false
        public static var size: CGSize?
        public static var text = NSLocalizedString("حذف", comment: "")
        public static var image: UIImage?
        
        public static var textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 16),
            .foregroundColor: UIColor(hex: "FA2F5B"),
            .paragraphStyle: {
                var style = NSMutableParagraphStyle()
                style.alignment = .center
                return style
            }()
        ]
    }
    
    public struct InfoLabel {
        public static var enabled = true
        public static var textColor = UIColor.white
        public static var ellipsisText = NSLocalizedString("نمایش بیشتر", comment: "")
        public static var ellipsisColor = StyleTheme.shared.current.color.text.body.colorC
        
        public static var textAttributes: [NSAttributedString.Key: Any] = [
            .font: StyleTheme.shared.current.typography.body2.medium,
            .foregroundColor: UIColor.white
        ]
    }
    
    public struct Zoom {
        public static var minimumScale: CGFloat = 1.0
        public static var maximumScale: CGFloat = 3.0
    }
}
