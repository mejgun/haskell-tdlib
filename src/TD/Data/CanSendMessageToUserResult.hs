module TD.Data.CanSendMessageToUserResult
  (CanSendMessageToUserResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes result of canSendMessageToUser
data CanSendMessageToUserResult
  = CanSendMessageToUserResultOk -- ^ The user can be messaged
  | CanSendMessageToUserResultUserHasPaidMessages -- ^ The user can be messaged, but the messages are paid
    { outgoing_paid_message_star_count :: Maybe Int -- ^ Number of Telegram Stars that must be paid by the current user for each sent message to the user
    }
  | CanSendMessageToUserResultUserIsDeleted -- ^ The user can't be messaged, because they are deleted or unknown
  | CanSendMessageToUserResultUserRestrictsNewChats -- ^ The user can't be messaged, because they restrict new chats with non-contacts
  deriving (Eq, Show)

instance I.ShortShow CanSendMessageToUserResult where
  shortShow CanSendMessageToUserResultOk
      = "CanSendMessageToUserResultOk"
  shortShow CanSendMessageToUserResultUserHasPaidMessages
    { outgoing_paid_message_star_count = outgoing_paid_message_star_count_
    }
      = "CanSendMessageToUserResultUserHasPaidMessages"
        ++ I.cc
        [ "outgoing_paid_message_star_count" `I.p` outgoing_paid_message_star_count_
        ]
  shortShow CanSendMessageToUserResultUserIsDeleted
      = "CanSendMessageToUserResultUserIsDeleted"
  shortShow CanSendMessageToUserResultUserRestrictsNewChats
      = "CanSendMessageToUserResultUserRestrictsNewChats"

instance AT.FromJSON CanSendMessageToUserResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "canSendMessageToUserResultOk"                    -> pure CanSendMessageToUserResultOk
      "canSendMessageToUserResultUserHasPaidMessages"   -> parseCanSendMessageToUserResultUserHasPaidMessages v
      "canSendMessageToUserResultUserIsDeleted"         -> pure CanSendMessageToUserResultUserIsDeleted
      "canSendMessageToUserResultUserRestrictsNewChats" -> pure CanSendMessageToUserResultUserRestrictsNewChats
      _                                                 -> mempty
    
    where
      parseCanSendMessageToUserResultUserHasPaidMessages :: A.Value -> AT.Parser CanSendMessageToUserResult
      parseCanSendMessageToUserResultUserHasPaidMessages = A.withObject "CanSendMessageToUserResultUserHasPaidMessages" $ \o -> do
        outgoing_paid_message_star_count_ <- o A..:?  "outgoing_paid_message_star_count"
        pure $ CanSendMessageToUserResultUserHasPaidMessages
          { outgoing_paid_message_star_count = outgoing_paid_message_star_count_
          }
  parseJSON _ = mempty

