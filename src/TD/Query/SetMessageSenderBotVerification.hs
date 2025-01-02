module TD.Query.SetMessageSenderBotVerification
  (SetMessageSenderBotVerification(..)
  , defaultSetMessageSenderBotVerification
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T

-- | Changes the verification status of a user or a chat by an owned bot. Returns 'TD.Data.Ok.Ok'
data SetMessageSenderBotVerification
  = SetMessageSenderBotVerification
    { bot_user_id        :: Maybe Int                         -- ^ Identifier of the owned bot, which will verify the user or the chat
    , verified_id        :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the supergroup or channel chat, which will be verified by the bot
    , custom_description :: Maybe T.Text                      -- ^ Custom description of verification reason; 0-getOption("bot_verification_custom_description_length_max"). If empty, then "was verified by organization "organization_name"" will be used as description. Can be specified only if the bot is allowed to provide custom description
    }
  deriving (Eq, Show)

instance I.ShortShow SetMessageSenderBotVerification where
  shortShow
    SetMessageSenderBotVerification
      { bot_user_id        = bot_user_id_
      , verified_id        = verified_id_
      , custom_description = custom_description_
      }
        = "SetMessageSenderBotVerification"
          ++ I.cc
          [ "bot_user_id"        `I.p` bot_user_id_
          , "verified_id"        `I.p` verified_id_
          , "custom_description" `I.p` custom_description_
          ]

instance AT.ToJSON SetMessageSenderBotVerification where
  toJSON
    SetMessageSenderBotVerification
      { bot_user_id        = bot_user_id_
      , verified_id        = verified_id_
      , custom_description = custom_description_
      }
        = A.object
          [ "@type"              A..= AT.String "setMessageSenderBotVerification"
          , "bot_user_id"        A..= bot_user_id_
          , "verified_id"        A..= verified_id_
          , "custom_description" A..= custom_description_
          ]

defaultSetMessageSenderBotVerification :: SetMessageSenderBotVerification
defaultSetMessageSenderBotVerification =
  SetMessageSenderBotVerification
    { bot_user_id        = Nothing
    , verified_id        = Nothing
    , custom_description = Nothing
    }

