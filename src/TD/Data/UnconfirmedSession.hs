module TD.Data.UnconfirmedSession
  (UnconfirmedSession(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data UnconfirmedSession
  = UnconfirmedSession -- ^ Contains information about an unconfirmed session
    { _id          :: Maybe Int    -- ^ Session identifier
    , log_in_date  :: Maybe Int    -- ^ Point in time (Unix timestamp) when the user has logged in
    , device_model :: Maybe T.Text -- ^ Model of the device that was used for the session creation, as provided by the application
    , location     :: Maybe T.Text -- ^ A human-readable description of the location from which the session was created, based on the IP address
    }
  deriving (Eq, Show)

instance I.ShortShow UnconfirmedSession where
  shortShow UnconfirmedSession
    { _id          = _id_
    , log_in_date  = log_in_date_
    , device_model = device_model_
    , location     = location_
    }
      = "UnconfirmedSession"
        ++ I.cc
        [ "_id"          `I.p` _id_
        , "log_in_date"  `I.p` log_in_date_
        , "device_model" `I.p` device_model_
        , "location"     `I.p` location_
        ]

instance AT.FromJSON UnconfirmedSession where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "unconfirmedSession" -> parseUnconfirmedSession v
      _                    -> mempty
    
    where
      parseUnconfirmedSession :: A.Value -> AT.Parser UnconfirmedSession
      parseUnconfirmedSession = A.withObject "UnconfirmedSession" $ \o -> do
        _id_          <- fmap I.readInt64 <$> o A..:?  "id"
        log_in_date_  <- o A..:?                       "log_in_date"
        device_model_ <- o A..:?                       "device_model"
        location_     <- o A..:?                       "location"
        pure $ UnconfirmedSession
          { _id          = _id_
          , log_in_date  = log_in_date_
          , device_model = device_model_
          , location     = location_
          }
  parseJSON _ = mempty

