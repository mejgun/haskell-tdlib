-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallbackQueryPayload where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CallbackQueryPayload = 
 CallbackQueryPayloadData { _data :: String }  
 | CallbackQueryPayloadGame { game_short_name :: String }  -- deriving (Show)

instance T.ToJSON CallbackQueryPayload where
 toJSON (CallbackQueryPayloadData { _data = _data }) =
  A.object [ "@type" A..= T.String "callbackQueryPayloadData", "data" A..= _data ]

 toJSON (CallbackQueryPayloadGame { game_short_name = game_short_name }) =
  A.object [ "@type" A..= T.String "callbackQueryPayloadGame", "game_short_name" A..= game_short_name ]
-- callbackQueryPayloadData CallbackQueryPayload  { _data :: String } 

-- callbackQueryPayloadGame CallbackQueryPayload  { game_short_name :: String } 

