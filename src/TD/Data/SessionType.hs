module TD.Data.SessionType
  (SessionType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes type of user session
data SessionType
  = SessionTypeDevice -- ^ A regular session from a device
    { session_id :: Maybe Int -- ^ Unique identifier of the session. Use terminateSession to terminate it or confirmSession to confirm it if it isn't confirmed yet
    }
  | SessionTypeConnectedBot -- ^ A business bot connected to the current user's account
    { bot_user_id :: Maybe Int -- ^ User identifier of the bot. Use deleteBusinessConnectedBot to remove it or confirmBusinessConnectedBot to confirm it if it isn't confirmed yet
    }
  deriving (Eq, Show)

instance I.ShortShow SessionType where
  shortShow SessionTypeDevice
    { session_id = session_id_
    }
      = "SessionTypeDevice"
        ++ I.cc
        [ "session_id" `I.p` session_id_
        ]
  shortShow SessionTypeConnectedBot
    { bot_user_id = bot_user_id_
    }
      = "SessionTypeConnectedBot"
        ++ I.cc
        [ "bot_user_id" `I.p` bot_user_id_
        ]

instance AT.FromJSON SessionType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "sessionTypeDevice"       -> parseSessionTypeDevice v
      "sessionTypeConnectedBot" -> parseSessionTypeConnectedBot v
      _                         -> mempty
    
    where
      parseSessionTypeDevice :: A.Value -> AT.Parser SessionType
      parseSessionTypeDevice = A.withObject "SessionTypeDevice" $ \o -> do
        session_id_ <- fmap I.readInt64 <$> o A..:?  "session_id"
        pure $ SessionTypeDevice
          { session_id = session_id_
          }
      parseSessionTypeConnectedBot :: A.Value -> AT.Parser SessionType
      parseSessionTypeConnectedBot = A.withObject "SessionTypeConnectedBot" $ \o -> do
        bot_user_id_ <- o A..:?  "bot_user_id"
        pure $ SessionTypeConnectedBot
          { bot_user_id = bot_user_id_
          }
  parseJSON _ = mempty

