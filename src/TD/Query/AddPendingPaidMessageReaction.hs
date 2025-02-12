module TD.Query.AddPendingPaidMessageReaction
  (AddPendingPaidMessageReaction(..)
  , defaultAddPendingPaidMessageReaction
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PaidReactionType as PaidReactionType

-- | Adds the paid message reaction to a message. Use getMessageAvailableReactions to check whether the reaction is available for the message. Returns 'TD.Data.Ok.Ok'
data AddPendingPaidMessageReaction
  = AddPendingPaidMessageReaction
    { chat_id    :: Maybe Int                               -- ^ Identifier of the chat to which the message belongs
    , message_id :: Maybe Int                               -- ^ Identifier of the message
    , star_count :: Maybe Int                               -- ^ Number of Telegram Stars to be used for the reaction. The total number of pending paid reactions must not exceed getOption("paid_reaction_star_count_max")
    , _type      :: Maybe PaidReactionType.PaidReactionType -- ^ Type of the paid reaction; pass null if the user didn't choose reaction type explicitly, for example, the reaction is set from the message bubble
    }
  deriving (Eq, Show)

instance I.ShortShow AddPendingPaidMessageReaction where
  shortShow
    AddPendingPaidMessageReaction
      { chat_id    = chat_id_
      , message_id = message_id_
      , star_count = star_count_
      , _type      = _type_
      }
        = "AddPendingPaidMessageReaction"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "star_count" `I.p` star_count_
          , "_type"      `I.p` _type_
          ]

instance AT.ToJSON AddPendingPaidMessageReaction where
  toJSON
    AddPendingPaidMessageReaction
      { chat_id    = chat_id_
      , message_id = message_id_
      , star_count = star_count_
      , _type      = _type_
      }
        = A.object
          [ "@type"      A..= AT.String "addPendingPaidMessageReaction"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "star_count" A..= star_count_
          , "type"       A..= _type_
          ]

defaultAddPendingPaidMessageReaction :: AddPendingPaidMessageReaction
defaultAddPendingPaidMessageReaction =
  AddPendingPaidMessageReaction
    { chat_id    = Nothing
    , message_id = Nothing
    , star_count = Nothing
    , _type      = Nothing
    }

