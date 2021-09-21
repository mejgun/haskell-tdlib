-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallbackQueryPayload where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Represents a payload of a callback query
data CallbackQueryPayload = 
 -- |
 -- 
 -- The payload for a general callback button 
 -- 
 -- __data__ Data that was attached to the callback button
 CallbackQueryPayloadData { _data :: Maybe String }  |
 -- |
 -- 
 -- The payload for a callback button requiring password 
 -- 
 -- __password__ The password for the current user
 -- 
 -- __data__ Data that was attached to the callback button
 CallbackQueryPayloadDataWithPassword { _data :: Maybe String, password :: Maybe String }  |
 -- |
 -- 
 -- The payload for a game callback button 
 -- 
 -- __game_short_name__ A short name of the game that was attached to the callback button
 CallbackQueryPayloadGame { game_short_name :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON CallbackQueryPayload where
 toJSON (CallbackQueryPayloadData { _data = _data }) =
  A.object [ "@type" A..= T.String "callbackQueryPayloadData", "data" A..= _data ]

 toJSON (CallbackQueryPayloadDataWithPassword { _data = _data, password = password }) =
  A.object [ "@type" A..= T.String "callbackQueryPayloadDataWithPassword", "data" A..= _data, "password" A..= password ]

 toJSON (CallbackQueryPayloadGame { game_short_name = game_short_name }) =
  A.object [ "@type" A..= T.String "callbackQueryPayloadGame", "game_short_name" A..= game_short_name ]

instance T.FromJSON CallbackQueryPayload where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "callbackQueryPayloadData" -> parseCallbackQueryPayloadData v
   "callbackQueryPayloadDataWithPassword" -> parseCallbackQueryPayloadDataWithPassword v
   "callbackQueryPayloadGame" -> parseCallbackQueryPayloadGame v
   _ -> mempty
  where
   parseCallbackQueryPayloadData :: A.Value -> T.Parser CallbackQueryPayload
   parseCallbackQueryPayloadData = A.withObject "CallbackQueryPayloadData" $ \o -> do
    _data <- o A..:? "data"
    return $ CallbackQueryPayloadData { _data = _data }

   parseCallbackQueryPayloadDataWithPassword :: A.Value -> T.Parser CallbackQueryPayload
   parseCallbackQueryPayloadDataWithPassword = A.withObject "CallbackQueryPayloadDataWithPassword" $ \o -> do
    _data <- o A..:? "data"
    password <- o A..:? "password"
    return $ CallbackQueryPayloadDataWithPassword { _data = _data, password = password }

   parseCallbackQueryPayloadGame :: A.Value -> T.Parser CallbackQueryPayload
   parseCallbackQueryPayloadGame = A.withObject "CallbackQueryPayloadGame" $ \o -> do
    game_short_name <- o A..:? "game_short_name"
    return $ CallbackQueryPayloadGame { game_short_name = game_short_name }