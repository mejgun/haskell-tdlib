module TD.Query.ChangeWebBrowserSettings
  (ChangeWebBrowserSettings(..)
  , defaultChangeWebBrowserSettings
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes web browser settings. Returns 'TD.Data.Ok.Ok'
data ChangeWebBrowserSettings
  = ChangeWebBrowserSettings
    { open_external_browser :: Maybe Bool -- ^ Pass true if links must be opened in an external browser by default
    , display_close_button  :: Maybe Bool -- ^ Pass true if a close button must be shown in the in-app browser; for Android app only
    }
  deriving (Eq, Show)

instance I.ShortShow ChangeWebBrowserSettings where
  shortShow
    ChangeWebBrowserSettings
      { open_external_browser = open_external_browser_
      , display_close_button  = display_close_button_
      }
        = "ChangeWebBrowserSettings"
          ++ I.cc
          [ "open_external_browser" `I.p` open_external_browser_
          , "display_close_button"  `I.p` display_close_button_
          ]

instance AT.ToJSON ChangeWebBrowserSettings where
  toJSON
    ChangeWebBrowserSettings
      { open_external_browser = open_external_browser_
      , display_close_button  = display_close_button_
      }
        = A.object
          [ "@type"                 A..= AT.String "changeWebBrowserSettings"
          , "open_external_browser" A..= open_external_browser_
          , "display_close_button"  A..= display_close_button_
          ]

defaultChangeWebBrowserSettings :: ChangeWebBrowserSettings
defaultChangeWebBrowserSettings =
  ChangeWebBrowserSettings
    { open_external_browser = Nothing
    , display_close_button  = Nothing
    }

