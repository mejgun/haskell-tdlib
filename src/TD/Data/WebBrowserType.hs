module TD.Data.WebBrowserType
  (WebBrowserType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes the type of web browser
data WebBrowserType
  = WebBrowserTypeExternal -- ^ An external web browser
  | WebBrowserTypeInApp -- ^ The in-app browser
  deriving (Eq, Show)

instance I.ShortShow WebBrowserType where
  shortShow WebBrowserTypeExternal
      = "WebBrowserTypeExternal"
  shortShow WebBrowserTypeInApp
      = "WebBrowserTypeInApp"

instance AT.FromJSON WebBrowserType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "webBrowserTypeExternal" -> pure WebBrowserTypeExternal
      "webBrowserTypeInApp"    -> pure WebBrowserTypeInApp
      _                        -> mempty
    
  parseJSON _ = mempty

