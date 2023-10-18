module TD.Query.GetSuggestedStickerSetName
  (GetSuggestedStickerSetName(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns a suggested name for a new sticker set with a given title. Returns 'TD.Data.Text.Text'
data GetSuggestedStickerSetName
  = GetSuggestedStickerSetName
    { title :: Maybe T.Text -- ^ Sticker set title; 1-64 characters
    }
  deriving (Eq, Show)

instance I.ShortShow GetSuggestedStickerSetName where
  shortShow
    GetSuggestedStickerSetName
      { title = title_
      }
        = "GetSuggestedStickerSetName"
          ++ I.cc
          [ "title" `I.p` title_
          ]

instance AT.ToJSON GetSuggestedStickerSetName where
  toJSON
    GetSuggestedStickerSetName
      { title = title_
      }
        = A.object
          [ "@type" A..= AT.String "getSuggestedStickerSetName"
          , "title" A..= title_
          ]

