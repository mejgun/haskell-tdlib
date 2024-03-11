module TD.Data.BusinessGreetingMessageSettings
  ( BusinessGreetingMessageSettings(..)    
  , defaultBusinessGreetingMessageSettings 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessRecipients as BusinessRecipients

data BusinessGreetingMessageSettings
  = BusinessGreetingMessageSettings -- ^ Describes settings for greeting messages that are automatically sent by a Telegram Business account as response to incoming messages in an inactive private chat
    { shortcut_id     :: Maybe Int                                   -- ^ Unique quick reply shortcut identifier for the greeting messages
    , recipients      :: Maybe BusinessRecipients.BusinessRecipients -- ^ Chosen recipients of the greeting messages
    , inactivity_days :: Maybe Int                                   -- ^ The number of days after which a chat will be considered as inactive; currently, must be on of 7, 14, 21, or 28
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessGreetingMessageSettings where
  shortShow BusinessGreetingMessageSettings
    { shortcut_id     = shortcut_id_
    , recipients      = recipients_
    , inactivity_days = inactivity_days_
    }
      = "BusinessGreetingMessageSettings"
        ++ I.cc
        [ "shortcut_id"     `I.p` shortcut_id_
        , "recipients"      `I.p` recipients_
        , "inactivity_days" `I.p` inactivity_days_
        ]

instance AT.FromJSON BusinessGreetingMessageSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessGreetingMessageSettings" -> parseBusinessGreetingMessageSettings v
      _                                 -> mempty
    
    where
      parseBusinessGreetingMessageSettings :: A.Value -> AT.Parser BusinessGreetingMessageSettings
      parseBusinessGreetingMessageSettings = A.withObject "BusinessGreetingMessageSettings" $ \o -> do
        shortcut_id_     <- o A..:?  "shortcut_id"
        recipients_      <- o A..:?  "recipients"
        inactivity_days_ <- o A..:?  "inactivity_days"
        pure $ BusinessGreetingMessageSettings
          { shortcut_id     = shortcut_id_
          , recipients      = recipients_
          , inactivity_days = inactivity_days_
          }
  parseJSON _ = mempty

instance AT.ToJSON BusinessGreetingMessageSettings where
  toJSON BusinessGreetingMessageSettings
    { shortcut_id     = shortcut_id_
    , recipients      = recipients_
    , inactivity_days = inactivity_days_
    }
      = A.object
        [ "@type"           A..= AT.String "businessGreetingMessageSettings"
        , "shortcut_id"     A..= shortcut_id_
        , "recipients"      A..= recipients_
        , "inactivity_days" A..= inactivity_days_
        ]

defaultBusinessGreetingMessageSettings :: BusinessGreetingMessageSettings
defaultBusinessGreetingMessageSettings =
  BusinessGreetingMessageSettings
    { shortcut_id     = Nothing
    , recipients      = Nothing
    , inactivity_days = Nothing
    }

