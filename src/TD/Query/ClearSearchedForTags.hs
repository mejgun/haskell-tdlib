module TD.Query.ClearSearchedForTags
  (ClearSearchedForTags(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Clears the list of recently searched for hashtags or cashtags. Returns 'TD.Data.Ok.Ok'
data ClearSearchedForTags
  = ClearSearchedForTags
    { clear_cashtags :: Maybe Bool -- ^ Pass true to clear the list of recently searched for cashtags; otherwise, the list of recently searched for hashtags will be cleared
    }
  deriving (Eq, Show)

instance I.ShortShow ClearSearchedForTags where
  shortShow
    ClearSearchedForTags
      { clear_cashtags = clear_cashtags_
      }
        = "ClearSearchedForTags"
          ++ I.cc
          [ "clear_cashtags" `I.p` clear_cashtags_
          ]

instance AT.ToJSON ClearSearchedForTags where
  toJSON
    ClearSearchedForTags
      { clear_cashtags = clear_cashtags_
      }
        = A.object
          [ "@type"          A..= AT.String "clearSearchedForTags"
          , "clear_cashtags" A..= clear_cashtags_
          ]

