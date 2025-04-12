module TD.Query.TransferBusinessAccountStars
  (TransferBusinessAccountStars(..)
  , defaultTransferBusinessAccountStars
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Transfer Telegram Stars from the business account to the business bot; for bots only. Returns 'TD.Data.Ok.Ok'
data TransferBusinessAccountStars
  = TransferBusinessAccountStars
    { business_connection_id :: Maybe T.Text -- ^ Unique identifier of business connection
    , star_count             :: Maybe Int    -- ^ Number of Telegram Stars to transfer
    }
  deriving (Eq, Show)

instance I.ShortShow TransferBusinessAccountStars where
  shortShow
    TransferBusinessAccountStars
      { business_connection_id = business_connection_id_
      , star_count             = star_count_
      }
        = "TransferBusinessAccountStars"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "star_count"             `I.p` star_count_
          ]

instance AT.ToJSON TransferBusinessAccountStars where
  toJSON
    TransferBusinessAccountStars
      { business_connection_id = business_connection_id_
      , star_count             = star_count_
      }
        = A.object
          [ "@type"                  A..= AT.String "transferBusinessAccountStars"
          , "business_connection_id" A..= business_connection_id_
          , "star_count"             A..= star_count_
          ]

defaultTransferBusinessAccountStars :: TransferBusinessAccountStars
defaultTransferBusinessAccountStars =
  TransferBusinessAccountStars
    { business_connection_id = Nothing
    , star_count             = Nothing
    }

