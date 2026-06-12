module TD.Query.AddWebBrowserSettingsException
  (AddWebBrowserSettingsException(..)
  , defaultAddWebBrowserSettingsException
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Adds a special handling for the opening of the specified URL. Returns 'TD.Data.Ok.Ok'
data AddWebBrowserSettingsException
  = AddWebBrowserSettingsException
    { open_external_browser :: Maybe Bool   -- ^ Pass true if the specified website must be opened in an external browser; pass false to open it in the in-app browser. There can be at most 100 exceptions in each list of the exceptions
    , url                   :: Maybe T.Text -- ^ URL of the website
    }
  deriving (Eq, Show)

instance I.ShortShow AddWebBrowserSettingsException where
  shortShow
    AddWebBrowserSettingsException
      { open_external_browser = open_external_browser_
      , url                   = url_
      }
        = "AddWebBrowserSettingsException"
          ++ I.cc
          [ "open_external_browser" `I.p` open_external_browser_
          , "url"                   `I.p` url_
          ]

instance AT.ToJSON AddWebBrowserSettingsException where
  toJSON
    AddWebBrowserSettingsException
      { open_external_browser = open_external_browser_
      , url                   = url_
      }
        = A.object
          [ "@type"                 A..= AT.String "addWebBrowserSettingsException"
          , "open_external_browser" A..= open_external_browser_
          , "url"                   A..= url_
          ]

defaultAddWebBrowserSettingsException :: AddWebBrowserSettingsException
defaultAddWebBrowserSettingsException =
  AddWebBrowserSettingsException
    { open_external_browser = Nothing
    , url                   = Nothing
    }

