module TD.Query.ClearSearchedForHashtags
  (ClearSearchedForHashtags(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Clears the list of recently searched for hashtags. Returns 'TD.Data.Ok.Ok'
data ClearSearchedForHashtags
  = ClearSearchedForHashtags
  deriving (Eq, Show)

instance I.ShortShow ClearSearchedForHashtags where
  shortShow
    ClearSearchedForHashtags
        = "ClearSearchedForHashtags"

instance AT.ToJSON ClearSearchedForHashtags where
  toJSON
    ClearSearchedForHashtags
        = A.object
          [ "@type" A..= AT.String "clearSearchedForHashtags"
          ]

