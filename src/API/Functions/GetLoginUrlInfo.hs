-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLoginUrlInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLoginUrlInfo = 
 GetLoginUrlInfo { button_id :: Int, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetLoginUrlInfo where
 toJSON (GetLoginUrlInfo { button_id = button_id, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getLoginUrlInfo", "button_id" A..= button_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- getLoginUrlInfo GetLoginUrlInfo  { button_id :: Int, message_id :: Int, chat_id :: Int } 

