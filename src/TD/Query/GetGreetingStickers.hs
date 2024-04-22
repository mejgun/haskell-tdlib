module TD.Query.GetGreetingStickers
  (GetGreetingStickers(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns greeting stickers from regular sticker sets that can be used for the start page of other users. Returns 'TD.Data.Stickers.Stickers'
data GetGreetingStickers
  = GetGreetingStickers
  deriving (Eq, Show)

instance I.ShortShow GetGreetingStickers where
  shortShow
    GetGreetingStickers
        = "GetGreetingStickers"

instance AT.ToJSON GetGreetingStickers where
  toJSON
    GetGreetingStickers
        = A.object
          [ "@type" A..= AT.String "getGreetingStickers"
          ]

