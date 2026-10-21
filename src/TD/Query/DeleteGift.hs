module TD.Query.DeleteGift
  (DeleteGift(..)
  , defaultDeleteGift
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Deletes a gift without receiving Telegram Stars for it. Use receivedGift.can_be_deleted or messageGift.can_be_deleted to check whether the gift can be deleted. Returns 'TD.Data.Ok.Ok'
data DeleteGift
  = DeleteGift
    { business_connection_id :: Maybe T.Text -- ^ Unique identifier of business connection on behalf of which to send the request; for bots only
    , received_gift_id       :: Maybe T.Text -- ^ Identifier of the gift
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteGift where
  shortShow
    DeleteGift
      { business_connection_id = business_connection_id_
      , received_gift_id       = received_gift_id_
      }
        = "DeleteGift"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "received_gift_id"       `I.p` received_gift_id_
          ]

instance AT.ToJSON DeleteGift where
  toJSON
    DeleteGift
      { business_connection_id = business_connection_id_
      , received_gift_id       = received_gift_id_
      }
        = A.object
          [ "@type"                  A..= AT.String "deleteGift"
          , "business_connection_id" A..= business_connection_id_
          , "received_gift_id"       A..= received_gift_id_
          ]

defaultDeleteGift :: DeleteGift
defaultDeleteGift =
  DeleteGift
    { business_connection_id = Nothing
    , received_gift_id       = Nothing
    }

