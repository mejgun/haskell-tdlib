{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.UnconfirmedSession where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data UnconfirmedSession = -- | Contains information about an unconfirmed session
  UnconfirmedSession
  { -- | A human-readable description of the location from which the session was created, based on the IP address
    location :: Maybe String,
    -- | Model of the device that was used for the session creation, as provided by the application
    device_model :: Maybe String,
    -- | Point in time (Unix timestamp) when the user has logged in
    log_in_date :: Maybe Int,
    -- | Session identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show UnconfirmedSession where
  show
    UnconfirmedSession
      { location = location_,
        device_model = device_model_,
        log_in_date = log_in_date_,
        _id = _id_
      } =
      "UnconfirmedSession"
        ++ U.cc
          [ U.p "location" location_,
            U.p "device_model" device_model_,
            U.p "log_in_date" log_in_date_,
            U.p "_id" _id_
          ]

instance T.FromJSON UnconfirmedSession where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "unconfirmedSession" -> parseUnconfirmedSession v
      _ -> mempty
    where
      parseUnconfirmedSession :: A.Value -> T.Parser UnconfirmedSession
      parseUnconfirmedSession = A.withObject "UnconfirmedSession" $ \o -> do
        location_ <- o A..:? "location"
        device_model_ <- o A..:? "device_model"
        log_in_date_ <- o A..:? "log_in_date"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ UnconfirmedSession {location = location_, device_model = device_model_, log_in_date = log_in_date_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON UnconfirmedSession where
  toJSON
    UnconfirmedSession
      { location = location_,
        device_model = device_model_,
        log_in_date = log_in_date_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "unconfirmedSession",
          "location" A..= location_,
          "device_model" A..= device_model_,
          "log_in_date" A..= log_in_date_,
          "id" A..= U.toS _id_
        ]
