module TD.Query.GetSavedMessagesTags
  (GetSavedMessagesTags(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns tags used in Saved Messages; for Telegram Premium users only. Returns 'TD.Data.SavedMessagesTags.SavedMessagesTags'
data GetSavedMessagesTags
  = GetSavedMessagesTags
  deriving (Eq, Show)

instance I.ShortShow GetSavedMessagesTags where
  shortShow
    GetSavedMessagesTags
        = "GetSavedMessagesTags"

instance AT.ToJSON GetSavedMessagesTags where
  toJSON
    GetSavedMessagesTags
        = A.object
          [ "@type" A..= AT.String "getSavedMessagesTags"
          ]

