module TD.Query.RemoveMessageSenderBotVerification
  (RemoveMessageSenderBotVerification(..)
  , defaultRemoveMessageSenderBotVerification
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Removes the verification status of a user or a chat by an owned bot. Returns 'TD.Data.Ok.Ok'
data RemoveMessageSenderBotVerification
  = RemoveMessageSenderBotVerification
    { bot_user_id :: Maybe Int                         -- ^ Identifier of the owned bot, which verified the user or the chat
    , verified_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the supergroup or channel chat, which verification is removed
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveMessageSenderBotVerification where
  shortShow
    RemoveMessageSenderBotVerification
      { bot_user_id = bot_user_id_
      , verified_id = verified_id_
      }
        = "RemoveMessageSenderBotVerification"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          , "verified_id" `I.p` verified_id_
          ]

instance AT.ToJSON RemoveMessageSenderBotVerification where
  toJSON
    RemoveMessageSenderBotVerification
      { bot_user_id = bot_user_id_
      , verified_id = verified_id_
      }
        = A.object
          [ "@type"       A..= AT.String "removeMessageSenderBotVerification"
          , "bot_user_id" A..= bot_user_id_
          , "verified_id" A..= verified_id_
          ]

defaultRemoveMessageSenderBotVerification :: RemoveMessageSenderBotVerification
defaultRemoveMessageSenderBotVerification =
  RemoveMessageSenderBotVerification
    { bot_user_id = Nothing
    , verified_id = Nothing
    }

