module TD.Query.SetPaidMessageReactionType
  (SetPaidMessageReactionType(..)
  , defaultSetPaidMessageReactionType
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PaidReactionType as PaidReactionType

-- | Changes type of paid message reaction of the current user on a message. The message must have paid reaction added by the current user. Returns 'TD.Data.Ok.Ok'
data SetPaidMessageReactionType
  = SetPaidMessageReactionType
    { chat_id    :: Maybe Int                               -- ^ Identifier of the chat to which the message belongs
    , message_id :: Maybe Int                               -- ^ Identifier of the message
    , _type      :: Maybe PaidReactionType.PaidReactionType -- ^ New type of the paid reaction
    }
  deriving (Eq, Show)

instance I.ShortShow SetPaidMessageReactionType where
  shortShow
    SetPaidMessageReactionType
      { chat_id    = chat_id_
      , message_id = message_id_
      , _type      = _type_
      }
        = "SetPaidMessageReactionType"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "_type"      `I.p` _type_
          ]

instance AT.ToJSON SetPaidMessageReactionType where
  toJSON
    SetPaidMessageReactionType
      { chat_id    = chat_id_
      , message_id = message_id_
      , _type      = _type_
      }
        = A.object
          [ "@type"      A..= AT.String "setPaidMessageReactionType"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "type"       A..= _type_
          ]

defaultSetPaidMessageReactionType :: SetPaidMessageReactionType
defaultSetPaidMessageReactionType =
  SetPaidMessageReactionType
    { chat_id    = Nothing
    , message_id = Nothing
    , _type      = Nothing
    }

