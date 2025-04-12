module TD.Query.DeleteBusinessMessages
  (DeleteBusinessMessages(..)
  , defaultDeleteBusinessMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Deletes messages on behalf of a business account; for bots only. Returns 'TD.Data.Ok.Ok'
data DeleteBusinessMessages
  = DeleteBusinessMessages
    { business_connection_id :: Maybe T.Text -- ^ Unique identifier of business connection through which the messages were received
    , message_ids            :: Maybe [Int]  -- ^ Identifier of the messages
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteBusinessMessages where
  shortShow
    DeleteBusinessMessages
      { business_connection_id = business_connection_id_
      , message_ids            = message_ids_
      }
        = "DeleteBusinessMessages"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "message_ids"            `I.p` message_ids_
          ]

instance AT.ToJSON DeleteBusinessMessages where
  toJSON
    DeleteBusinessMessages
      { business_connection_id = business_connection_id_
      , message_ids            = message_ids_
      }
        = A.object
          [ "@type"                  A..= AT.String "deleteBusinessMessages"
          , "business_connection_id" A..= business_connection_id_
          , "message_ids"            A..= message_ids_
          ]

defaultDeleteBusinessMessages :: DeleteBusinessMessages
defaultDeleteBusinessMessages =
  DeleteBusinessMessages
    { business_connection_id = Nothing
    , message_ids            = Nothing
    }

