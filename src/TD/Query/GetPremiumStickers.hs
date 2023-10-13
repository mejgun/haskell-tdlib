module TD.Query.GetPremiumStickers
  (GetPremiumStickers(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetPremiumStickers -- ^ Returns premium stickers from regular sticker sets
  = GetPremiumStickers
    { limit :: Maybe Int -- ^ The maximum number of stickers to be returned; 0-100
    }
  deriving (Eq)

instance Show GetPremiumStickers where
  show
    GetPremiumStickers
      { limit = limit_
      }
        = "GetPremiumStickers"
          ++ I.cc
          [ "limit" `I.p` limit_
          ]

instance AT.ToJSON GetPremiumStickers where
  toJSON
    GetPremiumStickers
      { limit = limit_
      }
        = A.object
          [ "@type" A..= AT.String "getPremiumStickers"
          , "limit" A..= limit_
          ]

