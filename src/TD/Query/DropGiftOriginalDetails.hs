module TD.Query.DropGiftOriginalDetails
  (DropGiftOriginalDetails(..)
  , defaultDropGiftOriginalDetails
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Drops original details for an upgraded gift. Returns 'TD.Data.Ok.Ok'
data DropGiftOriginalDetails
  = DropGiftOriginalDetails
    { received_gift_id :: Maybe T.Text -- ^ Identifier of the gift
    , star_count       :: Maybe Int    -- ^ The amount of Telegram Stars required to pay for the operation
    }
  deriving (Eq, Show)

instance I.ShortShow DropGiftOriginalDetails where
  shortShow
    DropGiftOriginalDetails
      { received_gift_id = received_gift_id_
      , star_count       = star_count_
      }
        = "DropGiftOriginalDetails"
          ++ I.cc
          [ "received_gift_id" `I.p` received_gift_id_
          , "star_count"       `I.p` star_count_
          ]

instance AT.ToJSON DropGiftOriginalDetails where
  toJSON
    DropGiftOriginalDetails
      { received_gift_id = received_gift_id_
      , star_count       = star_count_
      }
        = A.object
          [ "@type"            A..= AT.String "dropGiftOriginalDetails"
          , "received_gift_id" A..= received_gift_id_
          , "star_count"       A..= star_count_
          ]

defaultDropGiftOriginalDetails :: DropGiftOriginalDetails
defaultDropGiftOriginalDetails =
  DropGiftOriginalDetails
    { received_gift_id = Nothing
    , star_count       = Nothing
    }

