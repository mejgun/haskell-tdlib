module TD.Data.BusinessAwayMessageSettings
  ( BusinessAwayMessageSettings(..)    
  , defaultBusinessAwayMessageSettings 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessRecipients as BusinessRecipients
import qualified TD.Data.BusinessAwayMessageSchedule as BusinessAwayMessageSchedule

data BusinessAwayMessageSettings
  = BusinessAwayMessageSettings -- ^ Describes settings for messages that are automatically sent by a Telegram Business account when it is away
    { shortcut_id  :: Maybe Int                                                     -- ^ Unique quick reply shortcut identifier for the away messages
    , recipients   :: Maybe BusinessRecipients.BusinessRecipients                   -- ^ Chosen recipients of the away messages
    , schedule     :: Maybe BusinessAwayMessageSchedule.BusinessAwayMessageSchedule -- ^ Settings used to check whether the current user is away
    , offline_only :: Maybe Bool                                                    -- ^ True, if the messages must not be sent if the account was online in the last 10 minutes
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessAwayMessageSettings where
  shortShow BusinessAwayMessageSettings
    { shortcut_id  = shortcut_id_
    , recipients   = recipients_
    , schedule     = schedule_
    , offline_only = offline_only_
    }
      = "BusinessAwayMessageSettings"
        ++ I.cc
        [ "shortcut_id"  `I.p` shortcut_id_
        , "recipients"   `I.p` recipients_
        , "schedule"     `I.p` schedule_
        , "offline_only" `I.p` offline_only_
        ]

instance AT.FromJSON BusinessAwayMessageSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessAwayMessageSettings" -> parseBusinessAwayMessageSettings v
      _                             -> mempty
    
    where
      parseBusinessAwayMessageSettings :: A.Value -> AT.Parser BusinessAwayMessageSettings
      parseBusinessAwayMessageSettings = A.withObject "BusinessAwayMessageSettings" $ \o -> do
        shortcut_id_  <- o A..:?  "shortcut_id"
        recipients_   <- o A..:?  "recipients"
        schedule_     <- o A..:?  "schedule"
        offline_only_ <- o A..:?  "offline_only"
        pure $ BusinessAwayMessageSettings
          { shortcut_id  = shortcut_id_
          , recipients   = recipients_
          , schedule     = schedule_
          , offline_only = offline_only_
          }
  parseJSON _ = mempty

instance AT.ToJSON BusinessAwayMessageSettings where
  toJSON BusinessAwayMessageSettings
    { shortcut_id  = shortcut_id_
    , recipients   = recipients_
    , schedule     = schedule_
    , offline_only = offline_only_
    }
      = A.object
        [ "@type"        A..= AT.String "businessAwayMessageSettings"
        , "shortcut_id"  A..= shortcut_id_
        , "recipients"   A..= recipients_
        , "schedule"     A..= schedule_
        , "offline_only" A..= offline_only_
        ]

defaultBusinessAwayMessageSettings :: BusinessAwayMessageSettings
defaultBusinessAwayMessageSettings =
  BusinessAwayMessageSettings
    { shortcut_id  = Nothing
    , recipients   = Nothing
    , schedule     = Nothing
    , offline_only = Nothing
    }

