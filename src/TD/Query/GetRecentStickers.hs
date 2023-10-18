module TD.Query.GetRecentStickers
  (GetRecentStickers(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a list of recently used stickers. Returns 'TD.Data.Stickers.Stickers'
data GetRecentStickers
  = GetRecentStickers
    { is_attached :: Maybe Bool -- ^ Pass true to return stickers and masks that were recently attached to photos or video files; pass false to return recently sent stickers
    }
  deriving (Eq, Show)

instance I.ShortShow GetRecentStickers where
  shortShow
    GetRecentStickers
      { is_attached = is_attached_
      }
        = "GetRecentStickers"
          ++ I.cc
          [ "is_attached" `I.p` is_attached_
          ]

instance AT.ToJSON GetRecentStickers where
  toJSON
    GetRecentStickers
      { is_attached = is_attached_
      }
        = A.object
          [ "@type"       A..= AT.String "getRecentStickers"
          , "is_attached" A..= is_attached_
          ]

