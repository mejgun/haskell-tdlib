module TD.Data.WebBrowserSettings
  (WebBrowserSettings(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.WebDomainException as WebDomainException

data WebBrowserSettings
  = WebBrowserSettings -- ^ Describes web browser settings
    { open_external_browser :: Maybe Bool                                    -- ^ True, if links are opened in an external browser by default
    , external_exceptions   :: Maybe [WebDomainException.WebDomainException] -- ^ The list of websites which must always be opened in an external browser
    , in_app_exceptions     :: Maybe [WebDomainException.WebDomainException] -- ^ The list of websites which must always be opened in the in-app browser
    , display_close_button  :: Maybe Bool                                    -- ^ True, if a close button must be shown in the in-app browser; for Android app only
    }
  deriving (Eq, Show)

instance I.ShortShow WebBrowserSettings where
  shortShow WebBrowserSettings
    { open_external_browser = open_external_browser_
    , external_exceptions   = external_exceptions_
    , in_app_exceptions     = in_app_exceptions_
    , display_close_button  = display_close_button_
    }
      = "WebBrowserSettings"
        ++ I.cc
        [ "open_external_browser" `I.p` open_external_browser_
        , "external_exceptions"   `I.p` external_exceptions_
        , "in_app_exceptions"     `I.p` in_app_exceptions_
        , "display_close_button"  `I.p` display_close_button_
        ]

instance AT.FromJSON WebBrowserSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "webBrowserSettings" -> parseWebBrowserSettings v
      _                    -> mempty
    
    where
      parseWebBrowserSettings :: A.Value -> AT.Parser WebBrowserSettings
      parseWebBrowserSettings = A.withObject "WebBrowserSettings" $ \o -> do
        open_external_browser_ <- o A..:?  "open_external_browser"
        external_exceptions_   <- o A..:?  "external_exceptions"
        in_app_exceptions_     <- o A..:?  "in_app_exceptions"
        display_close_button_  <- o A..:?  "display_close_button"
        pure $ WebBrowserSettings
          { open_external_browser = open_external_browser_
          , external_exceptions   = external_exceptions_
          , in_app_exceptions     = in_app_exceptions_
          , display_close_button  = display_close_button_
          }
  parseJSON _ = mempty

