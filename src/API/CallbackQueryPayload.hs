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
 CallbackQueryPayloadData { _data :: Maybe String }  
 | CallbackQueryPayloadGame { game_short_name :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON CallbackQueryPayload where
 toJSON (CallbackQueryPayloadData { _data = _data }) =
  A.object [ "@type" A..= T.String "callbackQueryPayloadData", "data" A..= _data ]

 toJSON (CallbackQueryPayloadGame { game_short_name = game_short_name }) =
  A.object [ "@type" A..= T.String "callbackQueryPayloadGame", "game_short_name" A..= game_short_name ]

instance T.FromJSON CallbackQueryPayload where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "callbackQueryPayloadData" -> parseCallbackQueryPayloadData v
   "callbackQueryPayloadGame" -> parseCallbackQueryPayloadGame v
   _ -> mempty
  where
   parseCallbackQueryPayloadData :: A.Value -> T.Parser CallbackQueryPayload
   parseCallbackQueryPayloadData = A.withObject "CallbackQueryPayloadData" $ \o -> do
    _data <- o A..:? "data"
    return $ CallbackQueryPayloadData { _data = _data }

   parseCallbackQueryPayloadGame :: A.Value -> T.Parser CallbackQueryPayload
   parseCallbackQueryPayloadGame = A.withObject "CallbackQueryPayloadGame" $ \o -> do
    game_short_name <- o A..:? "game_short_name"
    return $ CallbackQueryPayloadGame { game_short_name = game_short_name }