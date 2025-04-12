module TD.Data.BusinessConnectedBot
  ( BusinessConnectedBot(..)    
  , defaultBusinessConnectedBot 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessRecipients as BusinessRecipients
import qualified TD.Data.BusinessBotRights as BusinessBotRights

data BusinessConnectedBot
  = BusinessConnectedBot -- ^ Describes a bot connected to a business account
    { bot_user_id :: Maybe Int                                   -- ^ User identifier of the bot
    , recipients  :: Maybe BusinessRecipients.BusinessRecipients -- ^ Private chats that will be accessible to the bot
    , rights      :: Maybe BusinessBotRights.BusinessBotRights   -- ^ Rights of the bot
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessConnectedBot where
  shortShow BusinessConnectedBot
    { bot_user_id = bot_user_id_
    , recipients  = recipients_
    , rights      = rights_
    }
      = "BusinessConnectedBot"
        ++ I.cc
        [ "bot_user_id" `I.p` bot_user_id_
        , "recipients"  `I.p` recipients_
        , "rights"      `I.p` rights_
        ]

instance AT.FromJSON BusinessConnectedBot where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessConnectedBot" -> parseBusinessConnectedBot v
      _                      -> mempty
    
    where
      parseBusinessConnectedBot :: A.Value -> AT.Parser BusinessConnectedBot
      parseBusinessConnectedBot = A.withObject "BusinessConnectedBot" $ \o -> do
        bot_user_id_ <- o A..:?  "bot_user_id"
        recipients_  <- o A..:?  "recipients"
        rights_      <- o A..:?  "rights"
        pure $ BusinessConnectedBot
          { bot_user_id = bot_user_id_
          , recipients  = recipients_
          , rights      = rights_
          }
  parseJSON _ = mempty

instance AT.ToJSON BusinessConnectedBot where
  toJSON BusinessConnectedBot
    { bot_user_id = bot_user_id_
    , recipients  = recipients_
    , rights      = rights_
    }
      = A.object
        [ "@type"       A..= AT.String "businessConnectedBot"
        , "bot_user_id" A..= bot_user_id_
        , "recipients"  A..= recipients_
        , "rights"      A..= rights_
        ]

defaultBusinessConnectedBot :: BusinessConnectedBot
defaultBusinessConnectedBot =
  BusinessConnectedBot
    { bot_user_id = Nothing
    , recipients  = Nothing
    , rights      = Nothing
    }

