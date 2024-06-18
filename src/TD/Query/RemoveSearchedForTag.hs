module TD.Query.RemoveSearchedForTag
  (RemoveSearchedForTag(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Removes a hashtag or a cashtag from the list of recently searched for hashtags or cashtags. Returns 'TD.Data.Ok.Ok'
data RemoveSearchedForTag
  = RemoveSearchedForTag
    { tag :: Maybe T.Text -- ^ Hashtag or cashtag to delete
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveSearchedForTag where
  shortShow
    RemoveSearchedForTag
      { tag = tag_
      }
        = "RemoveSearchedForTag"
          ++ I.cc
          [ "tag" `I.p` tag_
          ]

instance AT.ToJSON RemoveSearchedForTag where
  toJSON
    RemoveSearchedForTag
      { tag = tag_
      }
        = A.object
          [ "@type" A..= AT.String "removeSearchedForTag"
          , "tag"   A..= tag_
          ]

