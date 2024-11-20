module TD.Data.WebAppOpenMode
  (WebAppOpenMode(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes mode in which a Web App is opened
data WebAppOpenMode
  = WebAppOpenModeCompact -- ^ The Web App is opened in the compact mode
  | WebAppOpenModeFullSize -- ^ The Web App is opened in the full-size mode
  | WebAppOpenModeFullScreen -- ^ The Web App is opened in the full-screen mode
  deriving (Eq, Show)

instance I.ShortShow WebAppOpenMode where
  shortShow WebAppOpenModeCompact
      = "WebAppOpenModeCompact"
  shortShow WebAppOpenModeFullSize
      = "WebAppOpenModeFullSize"
  shortShow WebAppOpenModeFullScreen
      = "WebAppOpenModeFullScreen"

instance AT.FromJSON WebAppOpenMode where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "webAppOpenModeCompact"    -> pure WebAppOpenModeCompact
      "webAppOpenModeFullSize"   -> pure WebAppOpenModeFullSize
      "webAppOpenModeFullScreen" -> pure WebAppOpenModeFullScreen
      _                          -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON WebAppOpenMode where
  toJSON WebAppOpenModeCompact
      = A.object
        [ "@type" A..= AT.String "webAppOpenModeCompact"
        ]
  toJSON WebAppOpenModeFullSize
      = A.object
        [ "@type" A..= AT.String "webAppOpenModeFullSize"
        ]
  toJSON WebAppOpenModeFullScreen
      = A.object
        [ "@type" A..= AT.String "webAppOpenModeFullScreen"
        ]

