module TD.Query.RemoveWebBrowserSettingsException
  (RemoveWebBrowserSettingsException(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Removes a special handling for the opening of the specified URL. Returns 'TD.Data.Ok.Ok'
data RemoveWebBrowserSettingsException
  = RemoveWebBrowserSettingsException
    { url :: Maybe T.Text -- ^ URL of the website
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveWebBrowserSettingsException where
  shortShow
    RemoveWebBrowserSettingsException
      { url = url_
      }
        = "RemoveWebBrowserSettingsException"
          ++ I.cc
          [ "url" `I.p` url_
          ]

instance AT.ToJSON RemoveWebBrowserSettingsException where
  toJSON
    RemoveWebBrowserSettingsException
      { url = url_
      }
        = A.object
          [ "@type" A..= AT.String "removeWebBrowserSettingsException"
          , "url"   A..= url_
          ]

