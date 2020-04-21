-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEvent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatEventAction as ChatEventAction

--main = putStrLn "ok"

data ChatEvent = 
 ChatEvent { action :: ChatEventAction.ChatEventAction, user_id :: Int, date :: Int, _id :: Int }  deriving (Show)

instance T.ToJSON ChatEvent where
 toJSON (ChatEvent { action = action, user_id = user_id, date = date, _id = _id }) =
  A.object [ "@type" A..= T.String "chatEvent", "action" A..= action, "user_id" A..= user_id, "date" A..= date, "id" A..= _id ]



instance T.FromJSON ChatEvent where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatEvent" -> parseChatEvent v

   _ -> mempty ""
  where
   parseChatEvent :: A.Value -> T.Parser ChatEvent
   parseChatEvent = A.withObject "ChatEvent" $ \o -> do
    action <- o A..: "action"
    user_id <- o A..: "user_id"
    date <- o A..: "date"
    _id <- o A..: "id"
    return $ ChatEvent { action = action, user_id = user_id, date = date, _id = _id }