module TD.Query.GetRepliedMessage
  (GetRepliedMessage(..)
  , defaultGetRepliedMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a non-bundled message that is replied by a given message. Also, returns the pinned message for messagePinMessage, the game message for messageGameScore, the invoice message for messagePaymentSuccessful, the message with a previously set same background for messageChatSetBackground, the giveaway message for messageGiveawayCompleted, the checklist message for messageChecklistTasksDone, messageChecklistTasksAdded, the message with suggested post information for messageSuggestedPostApprovalFailed, messageSuggestedPostApproved, messageSuggestedPostDeclined, messageSuggestedPostPaid, messageSuggestedPostRefunded, the message with the regular gift that was upgraded for messageUpgradedGift with origin of the type upgradedGiftOriginUpgrade, and the topic creation message for topic messages without non-bundled replied message. Returns a 404 error if the message doesn't exist. Returns 'TD.Data.Message.Message'
data GetRepliedMessage
  = GetRepliedMessage
    { chat_id    :: Maybe Int -- ^ Identifier of the chat the message belongs to
    , message_id :: Maybe Int -- ^ Identifier of the reply message
    }
  deriving (Eq, Show)

instance I.ShortShow GetRepliedMessage where
  shortShow
    GetRepliedMessage
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "GetRepliedMessage"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetRepliedMessage where
  toJSON
    GetRepliedMessage
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getRepliedMessage"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultGetRepliedMessage :: GetRepliedMessage
defaultGetRepliedMessage =
  GetRepliedMessage
    { chat_id    = Nothing
    , message_id = Nothing
    }

