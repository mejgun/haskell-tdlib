module TD.Data.NewChatPrivacySettings
  ( NewChatPrivacySettings(..)    
  , defaultNewChatPrivacySettings 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data NewChatPrivacySettings
  = NewChatPrivacySettings -- ^ Contains privacy settings for chats with non-contacts
    { allow_new_chats_from_unknown_users :: Maybe Bool -- ^ True, if non-contacts users are able to write first to the current user. Telegram Premium subscribers are able to write first regardless of this setting
    , incoming_paid_message_star_count   :: Maybe Int  -- ^ Number of Telegram Stars that must be paid for every incoming private message by non-contacts; 0-getOption("paid_message_star_count_max"). If positive, then allow_new_chats_from_unknown_users must be true. The current user will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending
    }
  deriving (Eq, Show)

instance I.ShortShow NewChatPrivacySettings where
  shortShow NewChatPrivacySettings
    { allow_new_chats_from_unknown_users = allow_new_chats_from_unknown_users_
    , incoming_paid_message_star_count   = incoming_paid_message_star_count_
    }
      = "NewChatPrivacySettings"
        ++ I.cc
        [ "allow_new_chats_from_unknown_users" `I.p` allow_new_chats_from_unknown_users_
        , "incoming_paid_message_star_count"   `I.p` incoming_paid_message_star_count_
        ]

instance AT.FromJSON NewChatPrivacySettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "newChatPrivacySettings" -> parseNewChatPrivacySettings v
      _                        -> mempty
    
    where
      parseNewChatPrivacySettings :: A.Value -> AT.Parser NewChatPrivacySettings
      parseNewChatPrivacySettings = A.withObject "NewChatPrivacySettings" $ \o -> do
        allow_new_chats_from_unknown_users_ <- o A..:?  "allow_new_chats_from_unknown_users"
        incoming_paid_message_star_count_   <- o A..:?  "incoming_paid_message_star_count"
        pure $ NewChatPrivacySettings
          { allow_new_chats_from_unknown_users = allow_new_chats_from_unknown_users_
          , incoming_paid_message_star_count   = incoming_paid_message_star_count_
          }
  parseJSON _ = mempty

instance AT.ToJSON NewChatPrivacySettings where
  toJSON NewChatPrivacySettings
    { allow_new_chats_from_unknown_users = allow_new_chats_from_unknown_users_
    , incoming_paid_message_star_count   = incoming_paid_message_star_count_
    }
      = A.object
        [ "@type"                              A..= AT.String "newChatPrivacySettings"
        , "allow_new_chats_from_unknown_users" A..= allow_new_chats_from_unknown_users_
        , "incoming_paid_message_star_count"   A..= incoming_paid_message_star_count_
        ]

defaultNewChatPrivacySettings :: NewChatPrivacySettings
defaultNewChatPrivacySettings =
  NewChatPrivacySettings
    { allow_new_chats_from_unknown_users = Nothing
    , incoming_paid_message_star_count   = Nothing
    }

