module TD.Data.BusinessConnectedBotInfo
  (BusinessConnectedBotInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessConnectedBot as BusinessConnectedBot
import qualified Data.Text as T

data BusinessConnectedBotInfo
  = BusinessConnectedBotInfo -- ^ Describes a connection of a bot to an account
    { bot             :: Maybe BusinessConnectedBot.BusinessConnectedBot -- ^ Information about the bot
    , connection_date :: Maybe Int                                       -- ^ Point in time (Unix timestamp) when the bot was added; may be 0 if unknown
    , device_model    :: Maybe T.Text                                    -- ^ Model of the device that was used for the bot connection, as provided by the application; may be empty if unknown
    , location        :: Maybe T.Text                                    -- ^ A human-readable description of the location from which the bot was connected, based on the IP address; may be empty if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessConnectedBotInfo where
  shortShow BusinessConnectedBotInfo
    { bot             = bot_
    , connection_date = connection_date_
    , device_model    = device_model_
    , location        = location_
    }
      = "BusinessConnectedBotInfo"
        ++ I.cc
        [ "bot"             `I.p` bot_
        , "connection_date" `I.p` connection_date_
        , "device_model"    `I.p` device_model_
        , "location"        `I.p` location_
        ]

instance AT.FromJSON BusinessConnectedBotInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessConnectedBotInfo" -> parseBusinessConnectedBotInfo v
      _                          -> mempty
    
    where
      parseBusinessConnectedBotInfo :: A.Value -> AT.Parser BusinessConnectedBotInfo
      parseBusinessConnectedBotInfo = A.withObject "BusinessConnectedBotInfo" $ \o -> do
        bot_             <- o A..:?  "bot"
        connection_date_ <- o A..:?  "connection_date"
        device_model_    <- o A..:?  "device_model"
        location_        <- o A..:?  "location"
        pure $ BusinessConnectedBotInfo
          { bot             = bot_
          , connection_date = connection_date_
          , device_model    = device_model_
          , location        = location_
          }
  parseJSON _ = mempty

