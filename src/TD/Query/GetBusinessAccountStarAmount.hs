module TD.Query.GetBusinessAccountStarAmount
  (GetBusinessAccountStarAmount(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the amount of Telegram Stars owned by a business account; for bots only. Returns 'TD.Data.StarAmount.StarAmount'
data GetBusinessAccountStarAmount
  = GetBusinessAccountStarAmount
    { business_connection_id :: Maybe T.Text -- ^ Unique identifier of business connection
    }
  deriving (Eq, Show)

instance I.ShortShow GetBusinessAccountStarAmount where
  shortShow
    GetBusinessAccountStarAmount
      { business_connection_id = business_connection_id_
      }
        = "GetBusinessAccountStarAmount"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          ]

instance AT.ToJSON GetBusinessAccountStarAmount where
  toJSON
    GetBusinessAccountStarAmount
      { business_connection_id = business_connection_id_
      }
        = A.object
          [ "@type"                  A..= AT.String "getBusinessAccountStarAmount"
          , "business_connection_id" A..= business_connection_id_
          ]

