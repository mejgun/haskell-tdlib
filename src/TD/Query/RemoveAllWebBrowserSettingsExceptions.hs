module TD.Query.RemoveAllWebBrowserSettingsExceptions
  (RemoveAllWebBrowserSettingsExceptions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes special handling for the opening of all links. Returns 'TD.Data.Ok.Ok'
data RemoveAllWebBrowserSettingsExceptions
  = RemoveAllWebBrowserSettingsExceptions
  deriving (Eq, Show)

instance I.ShortShow RemoveAllWebBrowserSettingsExceptions where
  shortShow
    RemoveAllWebBrowserSettingsExceptions
        = "RemoveAllWebBrowserSettingsExceptions"

instance AT.ToJSON RemoveAllWebBrowserSettingsExceptions where
  toJSON
    RemoveAllWebBrowserSettingsExceptions
        = A.object
          [ "@type" A..= AT.String "removeAllWebBrowserSettingsExceptions"
          ]

