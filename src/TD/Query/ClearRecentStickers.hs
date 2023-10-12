module TD.Query.ClearRecentStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ClearRecentStickers -- ^ Clears the list of recently used stickers
  = ClearRecentStickers
    { is_attached :: Maybe Bool -- ^ Pass true to clear the list of stickers recently attached to photo or video files; pass false to clear the list of recently sent stickers
    }
  deriving (Eq)

instance Show ClearRecentStickers where
  show
    ClearRecentStickers
      { is_attached = is_attached_
      }
        = "ClearRecentStickers"
          ++ I.cc
          [ "is_attached" `I.p` is_attached_
          ]

instance AT.ToJSON ClearRecentStickers where
  toJSON
    ClearRecentStickers
      { is_attached = is_attached_
      }
        = A.object
          [ "@type"       A..= AT.String "clearRecentStickers"
          , "is_attached" A..= is_attached_
          ]
