-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEvent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatEventAction as ChatEventAction

--main = putStrLn "ok"

data ChatEvent = 
 ChatEvent { action :: ChatEventAction.ChatEventAction, user_id :: Int, date :: Int, _id :: Int }  -- deriving (Show)

instance T.ToJSON ChatEvent where
 toJSON (ChatEvent { action = action, user_id = user_id, date = date, _id = _id }) =
  A.object [ "@type" A..= T.String "chatEvent", "action" A..= action, "user_id" A..= user_id, "date" A..= date, "id" A..= _id ]
-- chatEvent ChatEvent  { action :: ChatEventAction.ChatEventAction, user_id :: Int, date :: Int, _id :: Int } 

